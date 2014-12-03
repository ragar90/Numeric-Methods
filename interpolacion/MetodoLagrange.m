clear all;
clc;
disp('Metodo de Interpolacion y Polinomio de Lagrage - Sin usar funcion.');
syms x;
disp('RECUERDE TODOS LOS DATOS DEBEN DE ESTAR EN LA MISMA ESCALA');
po=input('Ingrese el número a evaluar: ');
n=input('Ingrese el número de datos: ');
%creo las variables en que se almacenara los datos
puntos=zeros(1,n);
valores=zeros(1,n);
EcLagrange=0;
%'La' representa el numerador de cada polinimo L(x) y 'Lb' representa el denominador
La=1;
Lb=1;
L=zeros(1,n);
%Pido los datos de entrada
for i=1:n
    fprintf('Ingrese el valor de x%d: ',i-1);
    puntos(i)=input('');
    fprintf('Ingrese el valor de f(x%d): ',i-1);
    valores(i)=input('');
end
for i=1:n
    for j=1:n
        if j~=i
            %Generamos el numerador y denominador del polinomio
            La=La*(x-puntos(j));
            Lb=Lb*(puntos(i)-puntos(j));
        end
    end
    %imprimimos la formula en pantalla
    fprintf('L%d(x)=\n',i-1);
    pretty(La/Lb);
    fprintf('\n--------------------------------------------------------------------------------\n\n');
    %Evaluamos la funcion
    funcion=La/Lb;
    %creamos el polinomio de lagrange.
    EcLagrange=EcLagrange+funcion*valores(i);
    L(i)=subs(po,funcion);
    La=1;
    Lb=1;
end
fprintf('Polinomio de Lagrange:\n');
pretty(EcLagrange);
resultado=subs(EcLagrange,po);
fprintf('\n\nEl valor del polinomio evaluado en %f es de: %.8f\n',po,resultado);
