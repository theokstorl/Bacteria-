%Project 1 Group L19
%Theodore Storl-Desmond
%Simulation of Bacteria Growth

%Coded in MatLab

%closing and clearing all windows
clear
clc
close all

%Assigning variables to be used throughout program
%PlayAgain=variable used to run simulation an infinite amount of times in loop
PlayAgain=1;
%AveragePopulation=array of average population from first run to last
AveragePopulation=[];
%PopulationStd=array of standard deviations from first run to last
PopulationStd=[];
%LargestSeed=cell array of all seed files used from first run to last
LargestSeed={};

%While loop to start and run program a user selected amount of times
while PlayAgain==1
    
    disp('*****Welcome to Bacteria Simulation*****')

    %Receiving input from user on seed file to commence run
    %Error checking
    seedfile='';
    while (~exist(seedfile,'file'))
        seedfile=input('Please enter seed image to commence simulator: ','s');
    end
    image=imread(seedfile);
    
    %LargestSeed=variable used to make array of seed files 
    %Concatenates them together
    LargestSeed=[LargestSeed,seedfile];

    %Asking user for number of iterations
    %Error checking between 1 and 2500
    iterations=0;
    while (iterations<1 || iterations>2500)
        iterations=input('Please enter number of generations from 1 to 2500: ');
    end
    
    %Setting up a figure window to display seed world and all future iterations 
    %Calling display_world function
    [DeadCellAmount,PopulationAmount,BirthCellAmount]=display_world(iterations,image);
    
    %Calling next_generation function
    [MeanPopulation,StdPopulation]=next_generation(iterations,DeadCellAmount,PopulationAmount,BirthCellAmount);
    
    %Filling previosly declared variable with mean populations and standard deviations of all games
    %played
    AveragePopulation=[AveragePopulation,MeanPopulation];
    PopulationStd=[PopulationStd,StdPopulation];
    
    %Asking user if they want to run again
    PlayAgain=input('Would you like to play again? (Enter "1" for yes or Enter "2" for no): ');

    close all
end

%If user does not want to run again.....

%Finding the location of the seed played that yielded the max average population
[MaxPopulation,Locationmax]=max(AveragePopulation);
%Finding the location of the seed played that yielded the smalled average population
[MinPopulation,Locationmin]=min(AveragePopulation);
%Finding the max population seed file in the cell array LargestSeed
BiggestSeed=LargestSeed{1,Locationmax};
%Finding the smallest population seed file in the cell array LargestSeed
SmallestSeed=LargestSeed{1,Locationmin};

%Displaying results
disp(['*****Results*****'])
%displaying average populations in order of runs
disp(['The average populations for your runs are listed below in order from the first game to the last game: '])
disp(AveragePopulation)
%displaying standard deviations of the population in order of runs
disp(['The standard deviations of the population average for your runs are listed below: '])
disp(PopulationStd)
%displaying seed file that created largest population
disp(['The seed file that created the largest average population: '])
disp([BiggestSeed])
%Displaying seed file that created smallest population
disp(['The seed file that created the smallest average population: '])
disp([SmallestSeed])

%End






   
    
