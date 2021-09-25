
images_to_evaluate = "1001#1012#1018#1026#1036#1057#1067#1098#1102#1104#1131#1163#1274#1278#1299#1375#1385#1409#1499#1501#1663";
images_to_evaluate = images_to_evaluate.split('#');                     
                     
for i = 1:length(images_to_evaluate)
    fixations = struct;
    subjects = [];
    coordinates = [];
    orders = [];
    coordinates_x = [];
    coordinates_y = [];
    disp(images_to_evaluate(i))
   imageName = strcat('data/pycharm-coordinates/', images_to_evaluate(i));
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
   
   save(sprintf('data/log-polar/%s.mat', images_to_evaluate(i)), 'fixations')
end



