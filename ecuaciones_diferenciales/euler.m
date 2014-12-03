function Euler()
clear all
disp('Método de Euler para ecuaciones diferenciales');
syms y t
f=input('Ingrese y´: ');
ed=input('Ingrese la solución de la ecuación diferencial: ');
interv=input('Ingrese el intervalo: ');
vin=input('Ingrese el valor inicial: ');
h=input('Ingrese el tamaño de paso: ');
n=(interv(2)-interv(1))/h;
n=round(n);
ti=zeros(1,n+1);
wi=zeros(1,n+1);
wi(1)=vin;
ti(1)=interv(1);
ti(n+1)=interv(2);
for i=2:n
    ti(i)=interv(1)+(i-1)*h;
end
for i=2:n+1
    wi(i)=wi(i-1)+(h*subs(f,{t,y},{ti(i-1),wi(i-1)}));
end
fprintf('ti\t\t\t\t|wi\t\t\t\t\t|y(ti)\n');
for i=1:n+1
    fprintf('%.15f\t\t|%.15f\t\t|%.15f\n',ti(i),wi(i),subs(ed,ti(i)));
end
fprintf('\n');