files = ["data-100", "data-80", "data-60", "data-40", "data-20", "data20", "data40", "data60", "data80", "data100"];
U_l = [-100; -80; -60; -40; -20; 20; 40; 60; 80; 100];
omega = zeros(1, 10);
for i=1:10
    data = readmatrix(files(i));
    omega(i) = data(end, 3) * pi/180;
end

figure(1)

plot(U_l, omega)
xlabel("voltage, %")
ylabel("\omega_у_с_т, rad/s")

grid on