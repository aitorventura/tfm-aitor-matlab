
scores = [];


for i = 1001: 1002
    
    while true
       random_images = randperm(700);
        random_images = random_images(1:10);
        random_images = random_images+1000;
        if(all(random_images(:) ~= i))
            break;
        end
    end

    
    otherMap = zeros(600,800);
    otherMap = uint8(otherMap);
    for j = 1:length(random_images)
        map = load(strcat('data/fixation_maps/', int2str( random_images(j)),'.mat'));
        fixations_pts = map.fixationPts;
        otherMap = fixations_pts | otherMap;
        %map =  imread(strcat('data/fixation_maps/', int2str( random_images(j)),'.jpg'));
        %fixations_pts = imbinarize(map); 
        %otherMap = fixations_pts | otherMap;
    end

    
    saliencyMap = imread(strcat('data/mouse_maps/log-polar/', int2str( i ),'.jpg'));
    %saliencyMap = double(saliencyMap);
    
    fixationMap = load(strcat('data/fixation_maps/', int2str(i),'.mat')).fixationPts;
    %fixationMap =  imread(strcat('data/fixation_maps/', int2str( i ),'.jpg'));
    %fixationMap = imbinarize(fixationMap); 
    %saliencyMap2 =  imread(strcat('data/fixation_maps/', int2str( i ),'.jpg'));
    
 
    pause(4)

    subplot(3,1,1),imshow(saliencyMap), title('Saliency map'),
    subplot(3,1,2),imshow(fixationMap), title('Fixation map'),
    subplot(3,1,3),imshow(otherMap), title('Other map');

    drawnow;
    

    Nsplits = 100;
    stepSize = 0.1;
    toPlot = 0;
    jitter = 0;

    [score,tp,fp] = AUC_shuffled(saliencyMap, fixationMap, otherMap, Nsplits, stepSize, toPlot)
    %[score,tp,fp] = AUC_Borji(saliencyMap, fixationMap, Nsplits, stepSize, toPlot)
    %[score,tp,fp,allthreshes] = AUC_Judd(saliencyMap, fixationMap, jitter, toPlot)
    %score = CC(saliencyMap, saliencyMap2)
    %score = NSS(saliencyMap, fixationMap)
    
    scores = [scores score]

end

media = sum(scores)/length(scores);
nbins = 10;
histogram(scores,nbins);
   

