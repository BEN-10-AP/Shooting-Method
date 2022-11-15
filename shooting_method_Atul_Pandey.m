clear all
clc
guess = 0.1; %Assumed guess value for f''(0)
c=0;
while(c<=0.99)%we require f'(0)=u/u0 = 0.99
    [eta,f] = ode45(@shooting_method, [0,10], [0,0,guess]);
    c=f(50,2);
    guess=guess+0.01;
end
% [eta,f] = ode45(@shooting_method, [0,10], [0,0,guess]);
plot(f(:,1),eta,'-r',f(:,2),eta,'-b', f(:,3),eta,'-g');
title("Blasius Solution");
xlabel("f");
ylabel("eta");
legend('f1','f2','f3');
fprintf("f''(0) = %d ",f(1,3));

function dfdeta=shooting_method(eta,f) %f1=f, f2=f', f3=f''
dfdeta = [f(2); f(3); -0.5*f(1)*f(3)];
end
