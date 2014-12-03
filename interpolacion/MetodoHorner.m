function MetodoHorner()
fprintf('Método de Horner\n');
syms x
%Datos iniciales
f=input('Ingrese la función: ');
x0=input('Ingrese el punto inicial x0: ');
e=input('Ingrese el margen de error: 10^-');
if e>0
    e=-e;
end
e=10^e;
%La funcion sym2poly regresa un vector con los coeficientes del polinomio.
coef=sym2poly(f);
%Para el calculo se ha creado una funcion llamada divsinhor - DIVision SINtetica HORner
%Se le pasan 2 argumentos el vector con los coeficientes y el valor inicial
[b0,h]=divsinhor(coef,x0);
%retorna dos valores, un arreglo con el residuo (h) y el residuo de la Ec.
fprintf('\n\n\n');
%Para la segunda division solo me interesa el residuo de la Ec. es por ello 
%que solo neceitamos de un dato
[Qx0]=divsinhor(h,x0);
%Obtengo el valor de aproximacion
x1=x0-(b0/Qx0);
%Obtengo el error
error=abs(x0-x1);
fprintf('\n\nx1=%.12f\nerror=%.12E\n\n',x1,error);
while abs(x0-x1)>e
    x0=x1;
    [b0,h]=divsinhor(coef,x0);
    fprintf('\n\n\n');
    [Qx0]=divsinhor(h,x0);
    x1=x0-(b0/Qx0);
    error=abs(x0-x1);
    fprintf('\n\nx1=%.12f\nerror=%.12E\n\n',x1,error);
end
fprintf('El valor aproximado de x es: %.10f\n',x1);

function [b,a]=divsinhor(c,y)
n=length(c);
%zeros(m,n) returns an m-by-n matrix of zeros.
a=zeros(1,n-1);
m=zeros(1,n-1);
r=zeros(1,n);
%for i=1:n es como poner for(i=1;i<n;1++)
for i=1:n
    if i==1
        r(i)=c(i);
    else
        m(i-1)=r(i-1)*y;
        r(i)=c(i)+m(i-1);
    end
end
for i=1:n
    fprintf('%.10f\t\t\t',c(i));
end
fprintf('|%.10f\n',y);
for i=1:n
    if i==1
        fprintf('\t\t\t\t\t\t');
    else
        fprintf('%.10f\t\t\t',m(i-1));
    end
end
fprintf('\t|\n');
fprintf('------------------------------------------------------------------------------------------------------------------------------------\n');
for i=1:n
    fprintf('%.10f\t\t\t',r(i));
    if i==n
        b=r(i);
    else
        a(i)=r(i);
    end
end