function [DeadCellAmount,PopulationAmount,BirthCellAmount]=display_world(iterations,image)

    %Variables to create arrays and track Cell Deaths, Cell Births, and the population 
    DeadCellAmount=[];
    PopulationAmount=[];
    BirthCellAmount=[];
    
    %This function solely displays the world
    
    %For loop to make simulator run through user selected generations
    for z=1:iterations
        %Calling org_health function
        [image,deadcells,population,birthcells]=org_health(image);
        %creating array of cell death amounts per generation
        DeadCellAmount=[DeadCellAmount,deadcells];
        %creating array of population per generation
        PopulationAmount=[PopulationAmount,population];
        %creating array of cell births amounts per generation
        BirthCellAmount=[BirthCellAmount,birthcells];
        
        %Displaying image
        imshow(image)
        
        %Pausing
        pause(.001)
    end
end