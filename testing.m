function trackErrors = testing(X,BaseMatrix,testAns)

dummy = 10; %godtyckligt högt tal för att sätta igång if-satsen
position = 0;
trackErrors = zeros(10,1); %10x1 matris för att spara antalet fel
       
for i = 1:2007 %Loopar igenom alla testsiffor
    
    for j = 1:10 %Projicerar testsiffra på varje underrrum
          [S,R,N] = compProjection(X(:,i),BaseMatrix(:,:,j));
        
        if (N < dummy) %Om avståndet av proj är mindre än föregående
            
            dummy = N; %Avståndet blir dummy
            position = j; %Vilken siffra(position) som det var sparas 
        end       
    end
   
dummy = 10; %Återställer dummy för att kunna sätta igång if-sats i nästa


 if((position - 1) ~= testAns(i,:)) %Om siffran inte var rätt
 
   trackErrors(testAns(i,:) + 1) = trackErrors(testAns(i,:) + 1) + 1; %Registrera ett fel på sin position i matrisen
     
 end
 
end



end

