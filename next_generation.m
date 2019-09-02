function [MeanPopulation,StdPopulation]=next_generation(iterations,DeadCellAmount,PopulationAmount,BirthCellAmount)

%Members of Team L19, Theodore Storl-Desmond, Mike Marynchak, Jeff
%Bushcer, certify that we have completed this project in an honest manner.

%This function is perfoming statistical operations for the most part

%displaying statistical data from function
    disp(['***Statistical Data***'])
%Calculating mean of population
MeanPopulation=mean(PopulationAmount);
    disp(['Average of Population: ',num2str(MeanPopulation)])
%Calculating std of population
StdPopulation=std(PopulationAmount);
    disp(['Standard Deviation of Population: ',num2str(StdPopulation)])
%Calculating median of population
MedianPopulation=median(PopulationAmount);
    disp(['Median of Population: ',num2str(MedianPopulation)])
    disp(['**********'])
%Calculating mean of cell deaths
MeanDeadCells=mean(DeadCellAmount);
    disp(['Average number of Cell Deaths: ',num2str(MeanDeadCells)])
%Calculating std of cell deaths
StdDeadCells=std(DeadCellAmount);
    disp(['Standard Deviation of number of Cell Deaths: ',num2str(StdDeadCells)])
%Calculating median of cell deaths
MedianDeadCells=median(DeadCellAmount);
    disp(['Median number of Cell Deaths: ',num2str(MedianDeadCells)])
    disp(['**********'])
%Calculating mean of cell births
MeanBirthCells=mean(BirthCellAmount);
    disp(['Average number of Cell Births: ',num2str(MeanBirthCells)])
%Calculating std of cell births
StdBirthCells=std(BirthCellAmount);
    disp(['Standard Deviation of number of Cell Births: ',num2str(StdBirthCells)])
%Calculating median of cell births
MedianBirthCells=median(BirthCellAmount);
    disp(['Median number of Cell Births: ',num2str(MedianBirthCells)])
    disp(['**********'])

%Creating array for number of generations
Generations=1:1:iterations;

%scatter plot of cell deaths per generation
subplot(2,3,1)
plot(Generations,DeadCellAmount,'-')
ylim([0,max(DeadCellAmount)])
title('Cell Deaths Per Generation')
xlabel('Generation')
ylabel('Cell Deaths')

%Scatter plot of cell births per generation
subplot(2,3,2)
plot(Generations,BirthCellAmount,'-')
ylim([0,max(BirthCellAmount)])
title('Cell Births Per Generation')
xlabel('Generation')
ylabel('Cell Births')

%Scatter plot of population per generation
subplot(2,3,3)
plot(Generations,PopulationAmount,'-')
ylim([0,max(PopulationAmount)])
title('Population Per Generation')
xlabel('Generation')
ylabel('Population')


%Histogram that displays frequency of a certain amount of cell deaths
subplot(2,3,4)
hist(DeadCellAmount,20)
title('Frequency of Cell Deaths')
xlabel('Cell Deaths')
ylabel('Frequency')

%Histogram that displays frequency of a certain amount of cell births
subplot(2,3,5)
hist(BirthCellAmount,20)
title('Frequency of Cell Births')
xlabel('Cell Births')
ylabel('Frequency')

%Histogram that displays frequency of a certain population
subplot(2,3,6)
hist(PopulationAmount,20)
title('Frequency of Populations')
xlabel('Population')
ylabel('Frequency')

end

