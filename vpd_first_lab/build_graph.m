
files = ["data-100", "data-80", "data-60", "data-40", "data-20", "data20", "data40", "data60", "data80", "data100",];
voltages = [-100, -80, -60, -40, -20, 20, 40, 60, 80, 100];
k_all = [];
Tm_all = [];
w_yct_all = [];
U_pr_all = [];

for i = 1:10
    data =  readmatrix(files(i));
    U_pr = voltages(i);
    
    time  = data(:,1) / 1000;
    angle = data(:,2) * pi/180;
    omega = data(:,3) * pi/180;
    
    figure(1);
    plot(time, angle, 'DisplayName', ['U = ' num2str(U_pr) '%']);
    xlabel("Time, s");
    ylabel("Angle, rad");
    hold on

    figure(2);
    plot(time, omega, 'DisplayName', ['U = ' num2str(U_pr) '%']);
    xlabel("Time, s");
    ylabel("Omega, rad/s")
    hold on

%     par0 = [0.1; 0.06]; % Initial guess for k and Tm
%     fun_theta = @(par, t) U_pr * par(1) * (t - par(2) * (1 - exp(-t / par(2))));
%     par_theta = lsqcurvefit(fun_theta, par0, time, angle);
%     
%     k = par_theta(1);
%     Tm = par_theta(2);
    
    %k_all = [k_all; k];
    %Tm_all = [Tm_all; Tm];

    % Generate smoother time vector for plotting approximation
%     time_apr = 0:0.01;
%     theta_approx = U_pr * k * (time_apr - Tm * (1 - exp(-time_apr / Tm)));
% 
%     % Plot approximated function on figure 1
%     figure(1);
%     plot(time_apr, theta_approx, '-r', 'DisplayName', ['Approx U = ' num2str(U_pr) '%']);
    

    % Approximation for angular velocity
    fun_omega = @(par, t) U_pr * par(1) * (1 - exp(-t / par(2)));
    par_omega = lsqcurvefit(fun_omega, par0, time, omega);

    k_omega = par_omega(1);
    Tm_omega = par_omega(2);

    % Compute approximated omega
%     omega_approx = U_pr * k_omega * (1 - exp(-time_apr / Tm_omega));

    % Plot approximated function on figure 2
%     figure(2);
%     plot(time_apr, omega_approx, '--', 'DisplayName', ['Approx U = ' num2str(U_pr) '%']);

    w_yct = U_pr * k_omega;
    w_yct_all(i)  = w_yct;
    U_pr_all(i) = U_pr;

end

figure(3);
plot (U_pr_all,w_yct_all, 'o-');
xlabel('Voltage U, %')
ylabel('w_{yct}, rad/s')
grid on

% Show legends on plots
figure(1);
legend;
figure(2);
legend;



hold off; 