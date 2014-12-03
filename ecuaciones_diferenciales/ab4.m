function ab4()
clear all
disp('Método de Adams-Bashforth de 4 pasos para ecuaciones diferenciales');
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
wi(2)=subs(ed,ti(2));
wi(3)=subs(ed,ti(3));
wi(4)=subs(ed,ti(4));
for i=5:n+1
    wi(i)=wi(i-1)+h/24*(55*subs(f,{t,y},{ti(i-1),wi(i-1)})-59*subs(f,{t,y},{ti(i-2),wi(i-2)})+37*subs(f,{t,y},{ti(i-3),wi(i-3)})-9*subs(f,{t,y},{ti(i-4),wi(i-4)}));
end
fprintf('ti\t\t\t\t|wi\t\t\t\t\t|y(ti)\n');
for i=1:n+1
    fprintf('%.15f\t\t|%.15f\t\t|%.15f\n',ti(i),wi(i),subs(ed,ti(i)));
end
fprintf('\n');