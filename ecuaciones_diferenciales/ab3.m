%function ab3()
clear all
disp('Método de Adams-Bashforth de 3 pasos para ecuaciones diferenciales');
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
wi(2)=subs(ed,ti(2));%cuando sean implicitas utilizar solve(subs(ed,7.7,t))
wi(3)=subs(ed,ti(3));%cuando sean implicitas utilizar solve(subs(ed,ti(2),t))
for i=4:n+1
    wi(i)=wi(i-1)+h/12*(23*subs(f,{t,y},{ti(i-1),wi(i-1)})-16*subs(f,{t,y},{ti(i-2),wi(i-2)})+5*subs(f,{t,y},{ti(i-3),wi(i-3)}));
end
fprintf('ti\t\t\t\t|wi\t\t\t\t\t|y(ti)\n');
for i=1:n+1
    fprintf('%.9f\t\t|%.9f\t\t|%.9f\n',ti(i),wi(i),subs(ed,ti(i)));
end
fprintf('\n');