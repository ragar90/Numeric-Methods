%ajustar los decimales seg�n la necesidad
%M�todo de Hermit - con datos - Diferencias divididas
%Pedir datos iniciales: funci�n, valores de xi, valor de x
clc;
clear all
syms x;
disp('Ingrese los valores de X en forma de vector []');
xi=input('x0,x1,.....,xn:');
z=zeros(1,length(xi)*2);
%los dos puntos siguientes se pueden modificar si solo da la funci�n
fxi=input('Valores evaluados en la funci�n:');%f(xi)
fpxi=input('Valores evaluados en la derivada de la funci�n:');%f`(xi)
vx=input('x=');%vx=variable x
H=0;
Ffxi=zeros(length(xi)*2,length(xi)*2);
j=0;
for i=1:length(xi)%llenar la primera columna y asignar valores de z
   fprintf('x%1.0f=%2.2f\n',i-1,xi(i))
   z(1,i+j)=xi(i);
   z(1,i+j+1)=xi(i);
   Ffxi(i+j,1)=fxi(i);
   Ffxi(i+j+1,1)=fxi(i);
   Ffxi(i+j,2)=fpxi(i);
   Ffxi(i+j+1,2)=fpxi(i);
   j=j+1;
end
Ffxi