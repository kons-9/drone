P_pi=0.013;
I_pi=0.01;
D_pi=0.002;
P_x=-0.24;
D_x=-0.1;

g=9.8;
Iyy=0.0000716914;
out=sim('pitch_x_test.slx');
figure();
plot(out.t_sim, out.simout);

% figure();
s=tf('s');
C=(I_pi+s*P_pi)/(s^3*Iyy+s^2*D_pi+I_pi+s*P_pi);

pzplot(C);
figure();
C=C*(-g)/s^2;
H=P_x*C/(1+P_x*C+s*D_x*C)
pzplot(H);
close();clear;
close();clear;

fig=openfig('sim.fig');
fig.Color('white');
saveas(fig,'xsim.pdf');
