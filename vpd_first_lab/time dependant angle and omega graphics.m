files = ["data-100", "data-80", "data-60", "data-40", "data-20", "data20", "data40", "data60", "data80", "data100"];

figure(1)
hold on
grid on
for i=1:10
    data = readmatrix(files(i));
    time = data(:, 1);
    size(time)
    omega = data(:, 3);
   
    
    plot(time, omega)
    xlabel("time, s")
    ylabel("angle speed, rad/s")
end

figure(2)
hold on
grid on
for i=1:10
    data = readmatrix(files(i));
    time = data(:, 1);
    size(time)
    angle = data(:, 2);
   
    
    plot(time, angle)
    xlabel("time, s")
    ylabel("angle, rad")
end