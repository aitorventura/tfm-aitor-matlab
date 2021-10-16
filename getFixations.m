
images_to_evaluate = "1009#1026#1092#1093#1094#1097#1144#1159#1164#1278#1387#1408#1409#1414#1442#1471#1527#1572#1585#1617";
images_to_evaluate = images_to_evaluate.split('#');                     
                     
for i = 1:length(images_to_evaluate)
    fixations = struct;
    subjects = [];
    coordinates = [];
    orders = [];
    coordinates_x = [];
    coordinates_y = [];
    disp(images_to_evaluate(i))
   imageName = strcat('data/pycharm-coordinates/high-quality/', images_to_evaluate(i));
   load(imageName,'eyedat') %load eye data cell array
   %fixationstats = ClusterFix(eyedat);
   %disp(length(fixationstats));
   for user = 1:length(eyedat)
       values = eyedat(user);
       values = values{1};
       for coord = 1:length(values)
           subjects = [subjects user];
           coordinate_x = values(1, coord);
           coordinate_y = values(2, coord);
           coordinates_x = [coordinates_x coordinate_x];
           coordinates_y = [coordinates_y coordinate_y];
           orders = [orders (coord)];
       end
   end
   
   fixations.subj = transpose(subjects);
   fixations.coord = transpose([coordinates_y;coordinates_x]);
   fixations.order = transpose(orders); 
   
   save(sprintf('data/log-polar/high-quality/%s.mat', images_to_evaluate(i)), 'fixations')
end


for i = 1:length(images_to_evaluate)
    fixations = struct;
    subjects = [];
    coordinates = [];
    orders = [];
    coordinates_x = [];
    coordinates_y = [];
    disp(images_to_evaluate(i))
   imageName = strcat('data/pycharm-coordinates/low-quality/', images_to_evaluate(i));
   load(imageName,'eyedat') %load eye data cell array
   %fixationstats = ClusterFix(eyedat);
   %disp(length(fixationstats));
   for user = 1:length(eyedat)
       values = eyedat(user);
       values = values{1};
       for coord = 1:length(values)
           subjects = [subjects user];
           coordinate_x = values(1, coord);
           coordinate_y = values(2, coord);
           coordinates_x = [coordinates_x coordinate_x];
           coordinates_y = [coordinates_y coordinate_y];
           orders = [orders (coord)];
       end
   end
   
   fixations.subj = transpose(subjects);
   fixations.coord = transpose([coordinates_y;coordinates_x]);
   fixations.order = transpose(orders); 
   
   save(sprintf('data/log-polar/low-quality/%s.mat', images_to_evaluate(i)), 'fixations')
end





