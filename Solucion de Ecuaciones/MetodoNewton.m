clc
disp('Metodo de Newton')
syms x;
disp('Recuerde que la funcion debe de ser de la forma f(x)=0')
funcion=input('Ingrese la funcion= ');
po=input('Ingrese el punto inicial= ');
error=input('Ingrese el margen de error 10^-');
if error>0
    error=-error;
end
error=10^error;
%Iniciamos el calculo, primero derivamos la funcion dada.
fderivada=diff(funcion);
%Evaluamos la funcion inicial y su derivada en el punto inicial.
fa=subs(funcion,po);
fb=subs(fderivada,po);
%Formula para el valor aproximado
valor=po-(fa/fb);
%Revismos el criterio de paro
tol=abs(valor-po);
n=1;
fprintf('n=%3.0f || Po=%9.20f || P=%9.20f || tol=%e\n', n,po,valor,tol)
while tol>error
    n=n+1;
    %Reasignamos valores
    po=valor;
    fa=subs(funcion,po);
    fb=subs(fderivada,po);
    valor=po-(fa/fb);
    tol=abs(valor-po);
    fprintf('n=%3.0f || Po=%9.9f || P=%9.9f || tol=%e\n', n,po,valor,tol)
end
fprintf('El valor aproximado de X es: %.9f\n', valor)