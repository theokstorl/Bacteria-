function [image,deadcells,population,birthcells]=org_health(image)

%This function declares the health of an individual cell

%Variables declaring initial amounts of cell deaths, cell births, 
%population
deadcells=0;
population=0;
birthcells=0;

%finding rows and cols of seed file
[rows,cols]=size(image);

%Nested for loop to scan through all rows and cols, every pixel
for i=1:rows
    for j=1:cols
        %If pixel value is greater than zero, it is alive
        if image(i,j)>0
            %incrementing population variable
            population=population+1;
            
            %Lines 36-67, the code is scanning the eight neighboring cells
            %using a nested for loop. If statements are used if a pixel is
            %on the edge of the screen
            %scanning one row above
            istart=i-1;
            if istart<1
                istart=rows;
            end
            %scanning one column to the left
            jstart=j-1;
            if jstart<1
                jstart=cols;
            end
            %scanning one row below
            iend=i+1;
            if iend>rows
                irows=1;
            end
            %scanning one column to the right
            jend=j+1;
            if jend>cols
                jend=1;
            end
            %number of alive surrounding cells
            countalive=0;
            %nested for loop to scan 8 surrounding cells
            for x=istart:iend
                for y=jstart:jend
                    %If pixel value is greater than zero, a surrounding
                    %pixel is alive
                    if image(x,y)>0
                        %incrementing number of alive surrounding cells
                        countalive=countalive+1;
                    end
                end
            end
            
            %Using if statements to find status of cell
            %If number of surrounding alive cells is less than 2, pixel
            %dies with value of 0
            if countalive<2
                deadcells=deadcells+1;
                image(i,j)=0;
            %between 2-3 alive surrounding cells, pixel lives value 255
            elseif (countalive==2 || countalive==3)
                image(i,j)=255;
            %over 4 living surrounding cells, dies of overpopulation
            else
                deadcells=deadcells+1;
                image(i,j)=0;
            end
        %If pixel value is equal to zero, it is dead
        else
            %In lines 88-120, the code is scanning the eight surrounding cells of
            %a dead cell, using the same nested for loop and if statements
            %as before
            istart=i-1;
            %scanning one row above
            if istart<1
                istart=rows;
            end
            %scanning one column to the left
            jstart=j-1;
            if jstart<1
                jstart=cols;
            end
            %scanning one row below
            iend=i+1;
            if iend>rows
                iend=1;
            end
            %scanning one column to the right
            jend=j+1;
            if jend>cols
                jend=1;
            end
            %number of alive surrounding cells
            countdead=0;
            %nested for loop to scan 8 surrounding cells
            for x=istart:iend
                for y=jstart:jend
                    %If pixel value is greater than zero, a surrounding
                    %pixel is alive
                    if image(x,y)>0
                        %incrementing number of alive surrounding cells
                        countdead=countdead+1;
                    end
                end
            end
            %if there are three living cells around a dead cell, it gets
            %back brought to life
            if countdead==3
                birthcells=birthcells+1;
                image(i,j)=255;
            end
        end
    end
end
end
