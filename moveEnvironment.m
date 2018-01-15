function moveEnvironment()



    %01 scan environment
    [sDistances, sAngles]=scanEnvironment(180,3);
    %polar(sAngles/180*pi,sDistances);
    startExitIdx=find(sDistances==max(sDistances),1,'first');
    stopExitIdx=find(sDistances==max(sDistances),1,'last');
    startAngles=sAngles(startExitIdx);
    stopAngles=sAngles(stopExitIdx);
    exitAngle=mean([startAngles,stopAngles]);
    if isnan(exitAngle)
       exitAngle= sAngles(stopExitIdx);
    end
    %hold on;
    %polar(startAngles/180*pi,255,'ro');
    %polar(stopAngles/180*pi,255,'ro');
    %polar(exitAngle/180*pi,255,'go')
    %02 rotate to exit
    if exitAngle>=90
        exitAngle=exitAngle-90;
        rotateRobot(exitAngle,30,2);
    else
        exitAngle=exitAngle-90;
        exitAngle=exitAngle*-1;
        rotateRobot(exitAngle,-30,2);
    end
    %rotateRobot(exitAngle,30,2);
    %03 leave through exit
    %driveStraight(1000,50,2);


end

