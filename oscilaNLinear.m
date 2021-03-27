clear; 
length = 9.8; 
g = 9.8; 
q = 0.5;
F_Drive=1.2; 
Omega_D=2/3; 
npoints =15000; 
dt = 0.04;
theta = zeros(npoints,1); 
time = zeros(npoints,1);
theta(1)=0.2;
omega(1)=0;
for step = 1:npoints-1;
omega(step+1) = omega(step)+(-(g/length)*sin(theta(step))-q*omega(step) ...
              + F_Drive*sin(Omega_D*time(step)))*dt;
temporary_theta_step_plus_1 = theta(step)+omega(step+1)*dt;
if (temporary_theta_step_plus_1 < -pi)
    temporary_theta_step_plus_1= temporary_theta_step_plus_1+2*pi;
elseif (temporary_theta_step_plus_1 > pi) 
    temporary_theta_step_plus_1= temporary_theta_step_plus_1-2*pi;
end;

theta(step+1)=temporary_theta_step_plus_1;
time(step+1) = time(step) + dt;
end;
figure
plot (theta,omega,'r' ); 
xlabel('\theta (Radiano)');
ylabel('\omega (Radiano/segundo)');
axis([-3,3,-2.5,2.5])
figure
plot(time,theta,'b');
xlabel('Tempo (Segundo)');
ylabel('\theta (Radiano)');
axis([0,60,-4,4])
figure
plot(time,omega,'b');
xlabel('Tempo (Segundo)');
ylabel('\omega (Radiano/segundo)');
axis([0,60,-4,4])

