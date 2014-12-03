clc
%clear all
disp('Método de Runge-Kutta de orden 4 para ecuaciones diferenciales');
syms y t
f=input('Ingrese y´: ');
%Para obtener la solucion de la ecuacion diferencial:
%funcion='Dy=(log(t)-y)/(t+1)';
%valorInicial='y(1)=10';
%exacta=dsolve(funcion,valorInicial)
ed=input('Ingrese la solución de la ecuación diferencial: ');
interv=input('Ingrese el intervalo [a,b]: ');
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
fprintf('t0=%.15f\nw0=%.15f\nY(%.15f)=%.15f\n',ti(1),wi(1),ti(1),subs(ed,ti(1)));
for i=2:n+1
    k1=h*subs(f,{t,y},{ti(i-1),wi(i-1)});
    k2=h*subs(f,{t,y},{ti(i-1)+h/2,wi(i-1)+k1/2});
    k3=h*subs(f,{t,y},{ti(i-1)+h/2,wi(i-1)+k2/2});
    k4=h*subs(f,{t,y},{ti(i),wi(i-1)+k3});
    wi(i)=wi(i-1)+1/6*(k1+2*k2+2*k3+k4);
    fprintf('\nt%d=%.15f\nk1=%.15f\nk2=%.15f\nk3=%.15f\nk4=%.15f',i-1,ti(i),k1,k2,k3,k4);
    fprintf('\nw%1.0f= w%1.0f + 1/6 [ K1+ 2K2 + 2K3 + K4 ] = %9.15f - Valor Aprox\n',i-1,i-2,wi(i));
    fprintf('Y(%.15f)=%.15f - Valor Exacto\n\n',ti(i),subs(ed,ti(i)));
end
fprintf('\n');