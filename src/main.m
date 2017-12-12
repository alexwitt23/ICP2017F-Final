load ../data/cells.mat;

%Creates the subplots using createSubPlots.m
createSubPlots;

%Create the cell count graph with error bars. 
graphofCellCount;

hold on;

%fit data
gompertzianFit(@getLognormalProb,[10,0.1,1],[0:.1:25])