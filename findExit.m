function findExit()
    OpenUltrasonic(SENSOR_1);
    
    while 1
        distance=GetUltrasonic(SENSOR_1);
        if distance>30
            %mert=fix(distance/30);
            %if(mert<=1)
            %    moveEnvironment();
            %    continue;
            %end
            %if mert==0
            %    mert=1;
            %end
            translation_num=fix(distance/30);
            if translation_num>3
                translation_num=2;
            end
            driveStraight(360,30,translation_num);
            continue;
            %pause(5);
        
        else 
           
           moveEnvironment();
        end
    end
    
    
    
end

