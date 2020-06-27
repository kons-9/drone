P_pi=0.013;
I_pi=0.01;
D_pi=0.002;
P_x=-0.24;
D_x=0.1;

g=9.8;
Iyy=0.0000716914;
out=sim('pitch_x_test.slx');
% figure();
% plot(out.t_sim, out.simout);

% figure();
s=tf('s');
C=(I_pi+s*P_pi)/(s^4*D_pi*Iyy+I_pi+s*P_pi);
C=C*(-g)/s^2;
H=P_x*C/(1+P_x*C+s*D_x);
pzplot(H);