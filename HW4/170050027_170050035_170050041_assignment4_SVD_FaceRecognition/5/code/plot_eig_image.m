function [ ] = plot_eig_image( sample_image_path )
%PLOT_EIG_IMAGE Summary of this function goes here
%   Detailed explanation goes here
    dataset = 'ORL';
    h = 92;
    w = 112;
    num_train_speakers = 32;
    num_train_files = 6;
    evec_func = 'svd';
    
    data_folder_format = '..\\..\\..\\%s';
    person_folder_format = '..\\..\\..\\%s\\%s';
    image_format = '..\\..\\..\\%s\\%s\\%s';
    
    data_folder_path = sprintf(data_folder_format,dataset);
    X = zeros([h*w,num_train_speakers*num_train_files]);
    
    if strcmp(dataset,'ORL')
        persons = dir(strcat(data_folder_path,'\\s*'));
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
        eigen_vectors = get_eigenvectors_svd(X_mean_subtracted,175);
    else
        eigen_vectors = get_eigenvectors_eig(X_mean_subtracted,175);
    end
    
    sample_image = imread(sample_image_path);
    sample_image = sample_image(:);
    sample_image_ms = double(sample_image) - X_mean;
    eigen_coefficients = transpose(eigen_vectors)*sample_image_ms;
    
    klist = [2,10,20,50,75,100,125,150,175];
    f = figure;
    for i = 1:9
        k = klist(i);
        reconstructed_image = eigen_vectors(:,1:k)*eigen_coefficients(1:k) + X_mean;
        reconstructed_image = reshape(reconstructed_image,[112,92])/255;
        
        subplot(3,3,i);
        imshow(reconstructed_image);
        title(sprintf('s1, img1, k = %d',k));
    
    end
    
    f = figure;
    for i = 1:25
        evec = eigen_vectors(:,i);
        [min_evec, min_evec_i] = min(evec);
        evec = evec - min_evec;
        [max_evec, max_evec_i] = max(evec);
        evec = evec/max_evec;
        eigenface = reshape(evec,[112,92]);
        
        subplot(5,5,i);
        imshow(eigenface);
        title(sprintf('e%d',i));
    end
    
        

end

