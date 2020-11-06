%% Q4

tic;
%% ORL Dataset
% The experiements in this section take about 25 seconds to run

dataset = 'ORL';
h = 92;
w = 112;
num_train_persons = 32;
num_train_images = 6;

plot_title_format = 'recognition rate vs k - %s';
table_title_format = 'recognition_rate_%s';

evec_funcs = {'svd','eig'};

for i = 1:2
    evec_func = evec_funcs{i};
    klist = [1,2,3,5,10,15,20,30,50,75,100,150,170];
    num_ks = size(klist);
    num_ks = num_ks(2);
    recognition_rate = zeros(size(klist));

    for i = 1:num_ks
        [T,C] = frecog(klist(i),dataset,h,w,num_train_persons,num_train_images,evec_func,'true');
        recognition_rate(i) = double(C)/double(T);
    end

    figure;
    plot(klist,recognition_rate);
    xlabel('k');
    ylabel('recognition_rate');
    title(sprintf(plot_title_format,evec_func));

    T = table(klist',recognition_rate');
    table_title = sprintf(table_title_format,evec_func);
    T.Properties.VariableNames = {'k',table_title};
    T(:,:)
end

toc;

%% CroppedYale Dataset
% The experiements in this section take about 10-15 minutes to run

tic;

dataset = 'CroppedYale';
h = 192;
w = 168;
num_train_persons = 38;
num_train_images = 40;

plot_title_format = 'recognition rate vs k - (top 3 ecoffs included - %s)';
table_title_format = 'recognition_rate_top_3_ecoffs_%s';

include_top_ecoffs = {'true','false'};

for i = 1:2
    include_top_ecoff = include_top_ecoffs{i};
    klist = [1,2,3,5,10,15,20,30,50,60,65,75,100,200,300,500,1000];
    num_ks = size(klist);
    num_ks = num_ks(2);
    recognition_rate = zeros(size(klist));

    for i = 1:num_ks
        [T,C] = frecog(klist(i),dataset,h,w,num_train_persons,num_train_images,'svd',include_top_ecoff);
        recognition_rate(i) = double(C)/double(T);
    end

    figure;
    plot(klist,recognition_rate);
    xlabel('k');
    ylabel('recognition_rate');
    title(sprintf(plot_title_format,include_top_ecoff));

    T = table(klist',recognition_rate');
    table_title = sprintf(table_title_format,include_top_ecoff);
    T.Properties.VariableNames = {'k',table_title};
    T(:,:)
end


toc;
