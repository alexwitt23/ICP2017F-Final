```matlab
function totalSum = getLognormalProb(x0)
    load('cells.mat');
    sumofASlice = zeros(1,16);
    CellCount = zeros(1,7);
    for t = 1:7
        for z = 1:16
            sumofASlice(z) = sum(sum(cells(:,:,z,t)));
        end
        CellCount(t) = sum(sumofASlice);
    end


    %L = x0(1)
    %c = x0(2);
    %sigma = x0(3);
    probArray = zeros(1,7);
    counter = 1;
 for tdays = 10:2:22
     N = 100000*exp(x0(1)*(1-exp(-(x0(2))*tdays)));
     probArray(tdays) = log((1/((x0(3))*sqrt(2*pi)*CellCount(counter)))*exp(-((log(CellCount(counter))-log(N)).^2)/(2*(x0(3))^2)));
     counter = counter + 1;
 end
   
    totalSum = -(sum(probArray));
end        
```
