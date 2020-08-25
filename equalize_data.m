%Parameters
i=1;
N=length(e);
iterations=ceil(N/10);      %Decides number of iterations to run(40 iterations=1 symbol=1ns)
op=zeros(N,1);
err=zeros(iterations,1);
a0=zeros(iterations,1);   %Tap Coefficients Array
a1=zeros(iterations,1);
a0(1)=1;                    %Tap Coefficients- Initial Value
a1(1)=0;
u=0.0001;                   %Step factor
prbs=double(d(40:end)/2000);
x_n=double(e)/1000;
x_n_1=zeros(N,1);            %x_n delayed by 1 
x_n_1(41:end)=x_n(1:end-40);

%EQUALIZATION
while i<iterations
  op(i)=a0(i)*x_n(i)+a1(i)*x_n_1(i);
  err(i)=prbs(i)-op(i);
  a0(i+1)=a0(i)+u*err(i)*x_n(i);
  a1(i+1)=a1(i)+u*err(i)*x_n_1(i);
  i=i+1;
end