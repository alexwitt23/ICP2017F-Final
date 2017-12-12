function parameters = gompertzianFit(func,x0,t)
    parameters = fminsearch(func,x0);
    lambda = parameters(1);
    mu = parameters(2);
    sigma = parameters(3);
    disp(['lambda: ',num2str(parameters(1)),' , ','c: ',num2str(parameters(2)),' , ','sigma: ',num2str(parameters(3))]);
    output = 100000*exp(parameters(1)*(1-exp(-(parameters(2).*t))));
    plot(t,output,'linewidth',4,'color','red');
    ylim([0 2*10^8]);
    xlabel( 'Time [days]', ...
                     'fontsize',13 ...
                    );
    ylabel( 'Tumor Cell Count', ...
                     'fontsize',13 ...
                    );
    title('Gompertzian Fit to Rat''s Brain Tumor Growth');
    legend('Experimental Data','Error','Gompertzian Fit','Location','northwest')
    filename = sprintf(['gompertzianFit.png']);
    flocation = '..\results';
    saveas(gca, fullfile(flocation, filename),'jpeg');
    
    save('..\results\parameters', 'lambda', 'mu','sigma')
end
%call like this:
%gompertzianFit(@getLognormalProb,[10,0.1,1],[0:.1:25])