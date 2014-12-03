function rkf4()
clear all
disp('Método de Runge-Kutta-Fehlberg de orden 4 para ecuaciones diferenciales');
syms y t
f=input('Ingrese y´: ');
%Para obtener la solucion de la ecuacion diferencial:
%funcion='Dy=(log(t)-y)/(t+1)';
%valorInicial='y(1)=10';
%exacta=dsolve(funcion,valorInicial)
ed=input('Ingrese la solución de la ecuación diferencial: ');
interv=input('Ingrese el intervalo [a,b]: ');
vin=input('Ingrese el valor inicial: ');
hi=input('Ingrese el tamaño de paso: ');
n=(interv(2)-interv(1))/hi;
n=round(n);
ti=zeros(1,n+1);
wi=zeros(1,n+1);
wi(1)=vin;
ti(1)=interv(1);
ti(n+1)=interv(2);
for i=2:n
    ti(i)=interv(1)+(i-1)*hi;
end
fprintf('t0=%.15f\nw0=%.15f\nY(%.15f)=%.15f\n',ti(1),wi(1),ti(1),subs(ed,ti(1)));
for i=2:n+1
    k1=hi*subs(f,{t,y},{ti(i-1),wi(i-1)});
    k2=hi*subs(f,{t,y},{ti(i-1)+hi/4,wi(i-1)+k1/4});
    k3=hi*subs(f,{t,y},{ti(i-1)+3*hi/8,wi(i-1)+3/32*k1+9*k2/32});
    k4=hi*subs(f,{t,y},{ti(i-1)+12/13*hi,wi(i-1)+1932/2197*k1-7200/2197*k2+7296/2197*k3});
    k5=hi*subs(f,{t,y},{ti(i-1)+hi,wi(i-1)+439/216*k1-8*k2+3680/513*k3-845/4104*k4});
    wi(i)=wi(i-1)+25/216*k1+1408/2565*k3+2197/4104*k4-k5/5;
    fprintf('\ni=%d\nt%d=%.15f\nk1=%.15f\nk2=%.15f\nk3=%.15f\nk4=%.15f\nk5=%.15f',i-2,i-1,ti(i),k1,k2,k3,k4,k5);
    fprintf('\nw%d=wi(%d)+25/216*k1+1408/2565*k3+2197/4104*k4-k5/5=%.15f - Valor Aprox\n',i-1,i-2,wi(i));
    fprintf('Y(%.15f)=%.15f - Valor Exacto\n\n',ti(i),subs(ed,ti(i)));
end
fprintf('\n');