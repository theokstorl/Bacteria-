%Project 1 Group L19
%Mena 10am
%Theodore Storl-Desmond, Mike Marynchak, Jeff Buscher
%Game Of Life

%Members of Team L19, Theodore Storl-Desmond, Mike Marynchak, Jeff
%Buscher, certify that we have completed this project in an honest manner.

%closing and clearing all windows
clear
clc
close all

%Assigning variables to be used throughout program
%PlayAgain=variable used to run game an infinite amount of times in loop
PlayAgain=1;
%AveragePopulation=array of average population from first game to last
AveragePopulation=[];
%PopulationStd=array of standard deviations from first game to last
PopulationStd=[];
%LargestSeed=cell array of all seed files used from first game to last
LargestSeed={};

%While loop to start and run program a user selected amount of times
while PlayAgain==1
    
    disp('*****Welcome to the Game of Life*****')

    %Receiving input from user on seed file to commence game
    %Error checking
    seedfile='';
    while (~exist(seedfile,'file'))
        seedfile=input('Please enter seed image to commence game: ','s');
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
    
    %Asking user if they want to play again
    PlayAgain=input('Would you like to play again? (Enter "1" for yes or Enter "2" for no): ');

    close all
end

%If user does not want to play again.....

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
%displaying average populations in order of games played
disp(['The average populations for your games are listed below in order from the first game to the last game: '])
disp(AveragePopulation)
%displaying standard deviations of the population in order of games played
disp(['The standard deviations of the population average for your games are listed below: '])
disp(PopulationStd)
%displaying seed file that created largest population
disp(['The seed file that created the largest average population: '])
disp([BiggestSeed])
%Displaying seed file that created smallest population
disp(['The seed file that created the smallest average population: '])
disp([SmallestSeed])

%End






   
    
