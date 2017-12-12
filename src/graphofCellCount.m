binary = cells;
binary(binary ~= 0) = 1;


for t = 1:7
    for z = 1:16
        sumOfASlice(z) = sum(sum(cells(:,:,z,t)));
    end 
    CellCount(t) = sum(sumOfASlice);
end 


for time = 1:7
    for slice = 1:16 
        B = bwboundaries(binary(:,:,slice,time));
        if isempty(B) == 1
            errorAtSlice(slice) = 0;     
        else     
            boundary = B{1};
            for r = 1:length(boundary)
                cellValueAtBoundary(r) = .5*cells(boundary(r),boundary(r,2),slice,time); 
            end 
        errorAtSlice(slice) = sum(cellValueAtBoundary);
        end 
    end
    errorAtTime(time) = sum(errorAtSlice);
end 


y = [0 CellCount(1,:)];
x = [0 10 12 14 16 18 20 22];
err = [0 errorAtTime(1) errorAtTime(2) errorAtTime(3) errorAtTime(4) errorAtTime(5) errorAtTime(6) errorAtTime(7)];
figure;


plot(x,y,'-o',...
    'Color','b',...
    'MarkerSize',8,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'LineWidth',4);
hold on;
e = errorbar(x,y,err);
e.Color = 'blue';
e.CapSize = 8;
e.LineWidth = 4;


%gompertzianFit(@getLognormalProb,[10,0.1,1],[0:.1:25])

yticks([0 2e+07 4e+07 6e+07 8e+07 10e+07 12e+07 14e+07 16e+07]);
%legend('Experimental Data','Error','Gompertzian Fit','Location','northwest')
title('Gompertzian Fit to Rat Brain Tumor Growth');
xlabel('Time [Days]');
ylabel('Tumor Cell Count');

filename = sprintf(['ExperimentalDataPlot.png']);
flocation = '..\results';
saveas(gca, fullfile(flocation, filename),'jpeg');


