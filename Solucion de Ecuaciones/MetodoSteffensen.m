clc;
disp('Metodo de Steffensen')
syms x
disp('Recuerde la funcion debe ser de la forma x=f(x)')
funcion=input('Ingrese la funcion= ');
p0=input('Ingrese el punto inicial= ');
error=input('Ingrese el margen de error: 10^-');
if error>0
    error=-error;
end
error=10^error;
%Inicializamos valores
p1=subs(funcion,p0);
p2=subs(funcion,p1);
valor=p0-((p1-p0)^2/(p2-2*p1+p0));
tol=abs(valor-p0);
n=1;
fprintf('n\t|P0\t\t\t\t\t|P1\t\t\t\t\t|P2\t\t\t\t\t|P^\t\t\t\t\t|error');
fprintf('\n%d\t|%.15f\t|%.15f\t|%.15f\t|%.15f\t|%e',n,p0,p1,p2,valor,tol);
while(tol>error)
    p0=valor;
    p1=subs(funcion,p0);
    p2=subs(funcion,p1);
    valor=p0-((p1-p0)^2/(p2-2*p1+p0));
    tol=abs(valor-p0);
    n=n+1;
    fprintf('\n%d\t|%.15f\t|%.15f\t|%.15f\t|%.15f\t|%e',n,p0,p1,p2,valor,tol);
end
fprintf('\nEl valor de aporximacion de X es= %.15f\n',valor);