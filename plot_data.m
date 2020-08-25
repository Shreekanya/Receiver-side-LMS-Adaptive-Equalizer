%Parameters
%Whatever you want to plot, set that to 1
plt_op=0;
plt_coeff=0;
plt_eye=1;

%Plotting Received Signal and Original Signal, Error ,Equalized signal
if plt_op==1
figure;
subplot(3,1,1)
hold on;
plot(x_n,'LineWidth',3);
plot(prbs,'LineWidth',2);
xlim([0 4000])
hold off;
title('Received Signal and Original Signal') 

subplot(3,1,2)
plot(err,'LineWidth',3)
xlim([0 4000]);
title('Error') 

subplot(3,1,3)
plot(op,'LineWidth',3);
xlim([0 4000])
title('Output') 
end


%Plotting Transient Response of Tap Coefficients
if plt_coeff==1
figure;
subplot(2,1,1)
plot(a0,'LineWidth',3);
ylim([-2 2])
title('Coefficient a0') 

subplot(2,1,2)
plot(a1,'LineWidth',3);
ylim([-1 1])
title('Coefficient a1') 
end

%Plotting Eye Diagrams of Received Signal and Equalized Signal
if plt_eye==1
pkg load communications
dtp0=x_n(40:400000);
eyediagram(dtp0,80)
title('Received SIgnal Eye');
dtp1=op(500000:600000);
eyediagram(dtp1,80)
title('Equalized SIgnal Eye');
end