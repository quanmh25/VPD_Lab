data = readmatrix("data100");

angle=data(:,2)
angle=angle*pi/180;

time=data(:,1)/1000

omega=data(:,3)*pi/180;

figure(1)

plot(time, angle)
xlabel("time, s")
ylabel("angle, rad")







