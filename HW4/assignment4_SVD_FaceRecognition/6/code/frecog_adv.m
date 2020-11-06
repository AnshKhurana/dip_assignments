function [ false_positive, false_negative ] = frecog_adv( k, threshold )
%FRECOG_ADV Summary of this function goes here
%   Detailed explanation goes here
    h = 92;
    w = 112;
    num_train_speakers = 32;
    num_train_files = 6;
    evec_func = 'svd';
    include_top_ecoffs = 'true';
    dataset = 'ORL';
    
    data_folder_format = '..\\..\\..\\%s';
    person_folder_format = '..\\..\\..\\%s\\%s';
    image_format = '..\\..\\..\\%s\\%s\\%s';
    
    data_folder_path = sprintf(data_folder_format,dataset);
    X = zeros([h*w,num_train_speakers*num_train_files]);
    
    if strcmp(dataset,'ORL')
        persons = dir(strcat(data_folder_path,'\\s*'));
        persons = persons(1:40);
    else
        persons = dir(strcat(data_folder_path,'\\y*'));
    end
    

    
    persons_train = persons(1:num_train_speakers);
    image_no = 1;
    
    for person = persons_train';
        person_folder_path = sprintf(person_folder_format,dataset,person.name);
        person_images = dir(person_folder_path);
        person_images = person_images(3:size(person_images));
        person_images_train = person_images(1:num_train_files);
        for image = person_images_train';
            image_path = sprintf(image_format,dataset,person.name,image.name);
            image_matrix = imread(image_path);
            X(:,image_no) = image_matrix(:);
            image_no = image_no + 1;
        end
    end

    X_mean = mean(X,2);
    X_mean_subtracted = bsxfun(@minus,X,X_mean);
    
    if strcmp(evec_func,'svd')
        eigen_vectors = get_eigenvectors_svd(X_mean_subtracted,k);
    else
        eigen_vectors = get_eigenvectors_eig(X_mean_subtracted,k);
    end
    
    eigen_coefficients = transpose(eigen_vectors)*X_mean_subtracted;
%     eigen_coefficients_cumulative = zeros(k,32);
    
%     for person_no = 1:size(persons_train);
%         eigen_coefficients_cumulative(:,person_no) = mean(eigen_coefficients(:,6*(person_no-1)+1:6*person_no),2);
%     end

%     total_test_images = 0;
%     correctly_detected_test_images = 0;
    
    false_positive = 0;
    false_negative = 0;
    
    person_no = 0;
    for person = persons';
        person_no = person_no+1;
        person_folder_path = sprintf(person_folder_format,dataset,person.name);
        person_images = dir(person_folder_path);
        person_images = person_images(3:size(person_images));
        
        if person_no <= 32
            person_images_test = person_images(num_train_files+1:size(person_images));
        else
            person_images_test = person_images;
        end
        
        for image = person_images_test';
            image_path = sprintf(image_format,dataset,person.name,image.name);
            image_matrix = imread(image_path);
            x = image_matrix(:);
            xbar = double(x) - X_mean;
            x_ecoff = transpose(eigen_vectors)*xbar;

%             x_ecoff_diff = bsxfun(@minus,eigen_coefficients_cumulative,x_ecoff);
            x_ecoff_diff = bsxfun(@minus,eigen_coefficients,x_ecoff);
            if strcmp(include_top_ecoffs,'false')
                x_ecoff_diff = x_ecoff_diff(4:k,:);
            end
            x_distance = sqrt(sum(x_ecoff_diff.^2,1));

            [y,y_i] = min(x_distance);
            
            if y < threshold
                if person_no > num_train_speakers
                    false_positive = false_positive + 1;
                end
            else
                if person_no <= num_train_speakers
                    false_negative = false_negative + 1;
                end
            end
            
%             if ceil(y_i/num_train_files) == person_no
%                 correctly_detected_test_images = correctly_detected_test_images + 1;
%             end
% 
%             total_test_images = total_test_images + 1;
        end
    end

end

