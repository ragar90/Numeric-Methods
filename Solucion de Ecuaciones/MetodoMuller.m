clear all
clc
disp('Metodo de Müller')
syms x;
disp('Recuerde que la funcion debe de ser un polinomio')
funcion=input('Ingrese la funcion= ');
x0=input('Ingrese x0: ');
x1=input('Ingrese x1: ');
x2=input('Ingrese x2: ');
error=input('Ingrese el margen de error 10^-');
if error>0
    error=-error;
end
error=10^error;
%Primero debemos evaluar la funcion en los puntos iniciales
fx0=subs(funcion,x0);
fx1=subs(funcion,x1);
fx2=subs(funcion,x2);
%Luego debemos inicializar las constantes A, B y C
a=((x1-x2)*(fx0-fx2)-(x0-x2)*(fx1-fx2))/((x0-x2)*(x1-x2)*(x0-x1));
b=((x0-x2)^2*(fx1-fx2)-(x1-x2)^2*(fx0-fx2))/((x0-x2)*(x1-x2)*(x0-x1));
c=fx2;
%Al tener todos los datos obtenemos el valor de apox
%Es de resaltar que se utiliza la funcion signo.
x3=x2-(2*c)/(b+sign(b)*sqrt(b^2-4*a*c));
%Luego calculamos el error
tol=abs(x3-x2);
n=1;
fprintf('n\t|x0\t\t\t\t|x1\t\t\t\t|x2\t\t\t\t|x3\t\t\t\t|a\t\t\t\t|b\t\t\t\t|c\t\t\t\t|error');
fprintf('\n%d\t|%.15f\t|%.15f\t|%.15f\t|%.15f\t|%.15f\t|%.15f\t|%.15f\t|%.9e',n,x0,x1,x2,x3,a,b,c,tol);
while tol>error
    %Los valores iniciales se "arrastran"
    x0=x1;
    x1=x2;
    x2=x3;
    %se hace el calculo otta vez
    fx0=subs(funcion,x0);
    fx1=subs(funcion,x1);
    fx2=subs(funcion,x2);
    a=((x1-x2)*(fx0-fx2)-(x0-x2)*(fx1-fx2))/((x0-x2)*(x1-x2)*(x0-x1));
    b=((x0-x2)^2*(fx1-fx2)-(x1-x2)^2*(fx0-fx2))/((x0-x2)*(x1-x2)*(x0-x1));
    c=fx2;
    x3=x2-(2*c)/(b+sign(b)*sqrt(b^2-4*a*c));
    tol=abs(x3-x2);
    n=n+1;
    fprintf('\n%d\t|%.15f\t|%.15f\t|%.15f\t|%.15f\t|%.15f\t|%.15f\t|%.15f\t|%.9e',n,x0,x1,x2,x3,a,b,c,tol);
end
fprintf('\nEl valor aproximado de X es: %.15f\n', x3);












