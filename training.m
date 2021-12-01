function BaseMatrix = training(A_sorted,trainAns_Sorted)

BaseMatrix = zeros(256,8,10); %Matris f�r att spara alla underrum
firstindex = 0; %Startplats i A
secondindex = 0; %Slutplats i A

for i = 0:9
    
    if(i ~= 9 )
    firstindex = find(trainAns_Sorted==i,1); %Startplats f�r siffra
    secondindex = find(trainAns_Sorted==(i+1),1) - 1; %Slutplats f�r siffra
    else
        firstindex = find(trainAns_Sorted==i,1); %Startplats f�r sista siffran
        secondindex = (firstindex + sum(trainAns_Sorted==9))-1; %Slutplats f�r sista siffran
    end
    
    dummy = A_sorted(:,firstindex:secondindex); %Delar upp A i matris fr�n startplats till slutplats
    [U,S,V] = svd(dummy); %Singul�rv�rdesuppdelning f�r matrisen. U �r 256x256
    
    subspace = U(:,1:8); %Tar fram ett underrum med hj�lp av U. Vi v�ljer h�r 8 dimensioner, dvs 256x8 f�r varje siffra
                         
    
    BaseMatrix(:,:,i+1) = subspace; %Lagrar underrummet i matris med alla underrum.
  
end
end

