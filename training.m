function BaseMatrix = training(A_sorted,trainAns_Sorted)

BaseMatrix = zeros(256,8,10); %Matris för att spara alla underrum
firstindex = 0; %Startplats i A
secondindex = 0; %Slutplats i A

for i = 0:9
    
    if(i ~= 9 )
    firstindex = find(trainAns_Sorted==i,1); %Startplats för siffra
    secondindex = find(trainAns_Sorted==(i+1),1) - 1; %Slutplats för siffra
    else
        firstindex = find(trainAns_Sorted==i,1); %Startplats för sista siffran
        secondindex = (firstindex + sum(trainAns_Sorted==9))-1; %Slutplats för sista siffran
    end
    
    dummy = A_sorted(:,firstindex:secondindex); %Delar upp A i matris från startplats till slutplats
    [U,S,V] = svd(dummy); %Singulärvärdesuppdelning för matrisen. U är 256x256
    
    subspace = U(:,1:8); %Tar fram ett underrum med hjälp av U. Vi väljer här 8 dimensioner, dvs 256x8 för varje siffra
                         
    
    BaseMatrix(:,:,i+1) = subspace; %Lagrar underrummet i matris med alla underrum.
  
end
end

