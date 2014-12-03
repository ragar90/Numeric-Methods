clear all
disp('Método de Adams-Bashforth de 5 pasos para ecuaciones diferenciales');
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
yi = zeros(1,n+1);
wi(1)=vin;
ti(1)=interv(1);
ti(n+1)=interv(2);
for i=2:n
    ti(i)=interv(1)+(i-1)*h;
end
wi(2)=solve(subs(ed,t,ti(2)));
wi(3)=solve(subs(ed,t,ti(3)));
wi(4)=solve(subs(ed,t,ti(4)));
wi(5)=solve(subs(ed,t,ti(5)));
yi(2)=solve(subs(ed,t,ti(2)));
yi(3)=solve(subs(ed,t,ti(3)));
yi(4)=solve(subs(ed,t,ti(4)));
yi(5)=solve(subs(ed,t,ti(5)));

for i=6:n+1
    wi(i)=wi(i-1)+h/720*(1901*subs(f,{t,y},{ti(i-1),wi(i-1)})-2774*subs(f,{t,y},{ti(i-2),wi(i-2)})+2616*subs(f,{t,y},{ti(i-3),wi(i-3)})-1274*subs(f,{t,y},{ti(i-4),wi(i-4)})+251*subs(f,{t,y},{ti(i-5),wi(i-5)}));
    yi(i) = solve(subs(ed,t,ti(i)));
end
fprintf('ti\t\t\t\t|wi\t\t\t\t\t|y(ti)\n');
for i=1:n+1
    fprintf('%.9f\t\t|%.15f\t\t|%.15f\n',ti(i),wi(i),yi(i));
end
fprintf('\n');