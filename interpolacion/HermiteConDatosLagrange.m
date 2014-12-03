%ajustar los decimales según la necesidad
%Método de Hermit - Lagrange
%Pedir datos iniciales: función, valores de xi, valor de x

clear all
clc;
syms x;
%fx=input('f(x)=');
disp('Metodo de Hermit - Lagrange');
disp('TODOS LOS VALORES QUE SE PIDEN A CONTINUACION DEBEN DE SER SEPARADOS POR COMAS');
xi=input('[x0,x1,.....,xn]: ');
z=zeros(1,length(xi)*2);
%los dos puntos siguientes se pueden modificar si solo da la función
fxi=input('Valores evaluados en la función [fx0,fx1,.....,fxn]:');%f(xi)
fpxi=input('Valores evaluados en la derivada de la función:');%f`(xi)
vx=input('Ingrese el valor sobre el cual se desea realizar la aproximacion x=');%vx=variable x
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
%imprimir los valores encontrados antes
for i=1:length(xi)*2
   fprintf('z%1.0f=%2.2f F(z%1.0f)=%2.9f F`(z%1.0f)=%2.9f\n',i-1,z(1,i),i-1,Ffxi(i,1),i-1,Ffxi(i,2));
end
Ffxi(length(xi)*2,2)=0;
%modificar lo siguiente
k=length(xi)*2-1;%saber hasta que fila llegará
n=0;%reparación
factor=1;
%inicia el proceso
for j=2:length(xi)*2
   n=n+1;
   for i=1:k
      if (z(1,i+n)-z(1,i))==0
         %hacer nada
      else
         Ffxi(i,j)=(Ffxi(i+1,j-1)-Ffxi(i,j-1))/(z(1,i+n)-z(1,i));
      end     
   end
   k=k-1;
end
%mandar a imprimir datos preliminares
fprintf('\nDada la matriz triangular superior izquierda fxi=\n');
%imprimir la primera mitad de la matriz
k=length(xi)*2;
for i=1:length(xi)*2
   fprintf('z%1.0f=%2.2f-->  ',i-1,z(1,i));
   for j=1:k
      if Ffxi(i,j)<1e-3
         fprintf('%e  ',Ffxi(i,j));
      else  
         fprintf('%2.8f  ',Ffxi(i,j));
      end     
   end
   k=k-1;
   fprintf('\n');
end
%construir e imprimir el final
fprintf('\nSe extrae :\n');
for i=1:length(xi)*2
   if Ffxi(1,i)<1e-3
       fprintf('a%1.0f=%e\n',i-1,Ffxi(1,i));
   else  
       fprintf('a%1.0f=%2.8f\n',i-1,Ffxi(1,i));
   end     
end
%imprimir el primer término
factor=1;
fprintf('\nH%1.0f(x)=a0+',length(xi)*2-1);
H=H+Ffxi(1,1);
%formar el resto e ir completando la cadena
for i=2:length(xi)*2
   fprintf('a%1.0f',i-1);
   for j=1:i-1
      fprintf('(x-z%1.0f)',j-1);
      factor=factor*(vx-z(1,j));
   end
   H=H+Ffxi(1,i)*factor;
   factor=1;
   if i==length(xi)*2
      fprintf('=');
   else
      fprintf('+');
   end
end
fprintf('\n%.8f\n',H);