
function driveStraight(angle,speed,translation)
    motorAB=NXTMotor();
    motorAB.Port='AB';
    motorAB.SpeedRegulation=0;
    motorAB.Power=speed;
    motorAB.TachoLimit=angle*translation;
    %motorB.SendToNXT();
    %motorB.WaitFor()
    

    %motorA=NXTMotor();
    %motorA.Port='A';
    %motorA.SpeedRegulation=0;
    %motorA.Power=speed;
    %motorA.TachoLimit=angle*translation;
    
    
    motorAB.SendToNXT();
    motorAB.WaitFor()
    %motorA.SendToNXT();
    %motorA.WaitFor()
    
end

