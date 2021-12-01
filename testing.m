function trackErrors = testing(X,BaseMatrix,testAns)

dummy = 10; %godtyckligt h�gt tal f�r att s�tta ig�ng if-satsen
position = 0;
trackErrors = zeros(10,1); %10x1 matris f�r att spara antalet fel
       
for i = 1:2007 %Loopar igenom alla testsiffor
    
    for j = 1:10 %Projicerar testsiffra p� varje underrrum
          [S,R,N] = compProjection(X(:,i),BaseMatrix(:,:,j));
        
        if (N < dummy) %Om avst�ndet av proj �r mindre �n f�reg�ende
            
            dummy = N; %Avst�ndet blir dummy
            position = j; %Vilken siffra(position) som det var sparas 
        end       
    end
   
dummy = 10; %�terst�ller dummy f�r att kunna s�tta ig�ng if-sats i n�sta


 if((position - 1) ~= testAns(i,:)) %Om siffran inte var r�tt
 
   trackErrors(testAns(i,:) + 1) = trackErrors(testAns(i,:) + 1) + 1; %Registrera ett fel p� sin position i matrisen
     
 end
 
end



end

