function rotateRobot(angle,speed,translation)
    motorA=NXTMotor();
    motorA.Port='A';
    %motorA.SpeedRegulation=0;
    motorA.Power=speed;
    fprintf('%d\n',round(fix(angle*translation)));
    t=fix(angle*translation);
    if isnan(t)
        t=1;
    end    
    %motorA.TachoLimit=fix(angle*translation);
    motorA.TachoLimit=t;
    
    
    motorB=NXTMotor();
    motorB.Port='B';
    %motorB.SpeedRegulation=0;
    motorB.Power=-speed;
    %motorB.TachoLimit=fix(angle*translation);   
    motorB.TachoLimit=t;
    
    motorA.SendToNXT();
    motorB.SendToNXT();
    
    motorA.WaitFor();
    motorB.WaitFor();
end
