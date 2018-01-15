
function [sDistances, sAngles]=scanEnvironment(angle,speed)

    OpenUltrasonic(SENSOR_1);
    %mysonicsensor = sonicSensor(num2str(SENSOR_1));
    motorC=NXTMotor();
    motorC.Port='C';
    
    motorC.Power=-speed;
    motorC.TachoLimit=90;
    motorC.SendToNXT();
    motorC.WaitFor();
    
    
    
    motorC.Power=speed;
    motorC.TachoLimit=angle;
    motorC.SendToNXT();
    
    data=motorC.ReadFromNXT();
    %data = readDistance(mysonicsensor);
    sDistances=[];
    sAngles=[];

    while data.IsRunning
        sDistances(end+1)=GetUltrasonic(SENSOR_1);
        sAngles(end+1)=data.TachoCount;
        %sAngles(end+1)=data.TachoCount;
        data=motorC.ReadFromNXT();
    end
    
    motorC.WaitFor();
    %motorC.Power=-50;
    motorC.Power=-speed;
    motorC.TachoLimit=90;
    motorC.SendToNXT();
    motorC.WaitFor();


    %CloseSensor(SENSOR_1);
end


