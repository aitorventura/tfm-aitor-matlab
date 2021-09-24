

s = 1002;
for i = 1001:s
    fixations = struct;
    subjects = [];
    coordinates = [];
    orders = [];
    coordinates_x = [];
    coordinates_y = [];
   imageName = strcat('data/pycharm-coordinates/', int2str(i));
   disp(imageName);
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
   
   save(sprintf('data/log-polar/%d.mat', i), 'fixations')
end



