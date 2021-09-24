
while true
   p = randperm(700);
    p = p(1:10);
    p = p+1000;
    if(all(p(:) ~= 1001))
        break;
    end
end


total = 0;
other_map = zeros(600,800);
other_map = uint8(other_map);
for i = 1:length(p)
    map =load(strcat('data/fixation_maps/', int2str( p(i)),'.mat'));
    fixations_pts = map.fixationPts;
    total = total + sum(fixations_pts(:) == 1);
    other_map = fixations_pts | other_map;
end

num = sum(other_map(:) == 1);
