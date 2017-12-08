%Creates the subplots using createSubPlots.m
createSubPlots;

graphofCellCount;

hold on;

gompertzianFit(@getLognormalProb,[10,0.1,1],[0:.1:25])