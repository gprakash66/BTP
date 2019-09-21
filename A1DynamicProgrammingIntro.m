%parameters and initial values
r=0.01;lambda=0.8;q=0.9;rho=1;c=0;
P=[0.7,0.3,0,0;
   0,0.5,0.5,0;
   0,0,0.4,0.6;
   0,0,0,1];
v=[20;10;5;1];
n=0;nmax=10000;
v1=v;a=zeros(4,1);
%value iteration
while (n==0 || norm(v1-v,inf)/norm(v1,inf)>= r)&&n<nmax
n=n+1;v=v1;
for i=1:4 %i=1 E, i=2 G, i=3 D, i=4, F
if i<=3
%calculate new value functions and optimal decision for states E, G,and D
[v1(i),a(i)]=max([c+lambda*((1-q)*v(i)+q*v(1)), exp(-i)+lambda*(P(i,i)*v(i)+P(i,i+1)*v(i+1))]);
else
%calculate new value functions and optimal decision for state F
[v1(i),a(i)]=max([c+lambda*((1-q)*v(i)+q*v(1)), exp(-i)+lambda*(P(i,i)*v(i))]);
end
end
%output of policy and value a(i)=1 means repair, a(i)=2 means defer
disp('Number of Iterations: '); disp(n);
disp('Value function'); disp(v1);
disp('Optimal Policy'); disp(a);
end

