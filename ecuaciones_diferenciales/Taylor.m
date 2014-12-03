function Taylor()
clear all
disp('Método de Taylor de orden n=4 para ecuaciones diferenciales');
disp('****Este metodo usa derivadas parciales****');
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
m=(interv(2)-interv(1))/h;
m=round(m);
ti=zeros(1,m+1);
wi=zeros(1,m+1);
wi(1)=vin;
ti(1)=interv(1);
ti(m+1)=interv(2);
%Las derivadas implicitas hay que colocarlas a manos como sigue:
df1=y -t^2 - 2*t + 1;%Primera Derivada
df2=y -t^2-2*t-1;%Segunda Derivada
df3=y-t^2-2*t-1;%Tercera Derivada

for i=2:m
    ti(i)=interv(1)+(i-1)*h;
end
for i=2:m+1
    hdf0 = (h*subs(f,{t,y},{ti(i-1),wi(i-1)}));
    hdf1 = (h^2/2*subs(df1,{t,y},{ti(i-1),wi(i-1)}));
    hdf2 = (h^3/6*subs(df2,{t,y},{ti(i-1),wi(i-1)}));
    hdf3 = (h^4/24*subs(df3,{t,y},{ti(i-1),wi(i-1)}));
    %hdfn = (h^n/factorial(n)*subs(dfn-1,{t,y},{ti(i-1),wi(i-1)}))
    wi(i)=wi(i-1)+hdf0+hdf1+hdf2+hdf3;%....+%hdfn
end
fprintf('ti\t\t\t\t|wi\t\t\t\t\t|y(ti)\n');
for i=1:m+1
    fprintf('%.9f\t\t|%.9f\t\t|%.9f\n',ti(i),wi(i),subs(ed,ti(i)));
end
fprintf('\n');