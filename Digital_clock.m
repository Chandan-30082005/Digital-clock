global  cc CloseReq;
CloseReq=false;
cc=figure('Name','Analog Clock',...
    'NumberTitle','off',...
    'MenuBar','none',...
    'Color',[1 1 1],...
    'CloseRequestFcn',@stl_CloseReqFcn);

plot(12*cosd(0:360),12*sind(0:360),'color','[0.75 0.75 0.75]','LineWidth',6);axis('off');hold on
plot(12.9*cosd(0:360),12.9*sind(0:360),'k','LineWidth',7);
fill(11.8*cosd(0:360),11.8*sind(0:360),[0.9 0.9 0.9]);
fill(cosd(0:360),sind(0:360),'k');

%drawing number

for n=1:12
    text(-8.5*cosd(90+n*360/12),8.5*sind(90+n*360/12),num2str(n),"FontSize",12)
    plot([9.5 11].*cosd(90+n*360/12),[9.5 11].*sind(90+n*360/12),'k','LineWidth',3);

    for nn=1:4
        plot([9.9 11].*cosd(90+n*360/12+nn*6),[9.9 11].*sind(90+n*360/12+nn*6),'k','LineWidth',1);
    end


end
%movement
sp=[];mp=[]; hp=[];

while(1)
    time=fix(clock);
    hs=90+time(6)*6;
    hm=90+time(5)*6+time(6)/10;
    hh=90+time(4)*30+time(5)/2;

    delete(hp),hp=plot([0 -7.5*cosd(hh)],[0 7.5*sind(hh)],'r','LineWidth',2);
    delete(mp),mp=plot([0 -9*cosd(hm)],[0 9*sind(hm)],'b','LineWidth',1.5);
    delete(sp),sp=plot([0 -10*cosd(hs)],[0 10*sind(hs)],'r','LineWidth',1);
    pause(1);

    if CloseReq
        delete(cc);
        clear all
        break
    end   
end 

function stl_CloseReqFcn(~,~,~)
global CloseReq;
CloseReq=true;
end