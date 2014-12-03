%clear all
syms x y;
funcion=input('funcion=');
a=input('a=');
b=input('b=');
n=input('n=');
h=(b-a)/n;
for i=1:n-1
    x(i)=a+i*h;
    fprintf('x(%d)= ',i)
    pretty(x(i));
    %disp(x(i));
end
part2=0;
for i=1:(n/2-1)
    part2=part2+subs(funcion,x(i*2));
end
part3=0;
for i=1:(n/2)
    part3=part3+subs(funcion,x(i*2-1));
end
resultado=(h/3)*(subs(funcion,a)+2*part2+4*part3+subs(funcion,b));
fprintf('R// >> %9.15f',resultado);