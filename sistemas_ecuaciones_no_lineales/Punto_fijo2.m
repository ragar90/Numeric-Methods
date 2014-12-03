function Punto_fijo2()
%Las funciones tienen que estar de la forma x=g(x)!!!
clc;
syms x1 x2 x3
disp('Metodo de Punto Fijo para un sistema de 2 Ec.')
disp('Las funciones tienen que estar de la forma x=g(x)!!!')
f1=input('Ingrese la funcion 1: ');
f2=input('Ingrese la funcion 2: ');
xo=input('Valor inicial X1= ');
yo=input('Valor inicial X2= ');
e=input('Ingrese el error de 10^-');
if e>0
    e = e*-1;
end
error = 10^(e);
X(1)=xo;
Y(1)=yo;
X(2)=subs(f1,{x1,x2},{X(1),Y(1)});
Y(2)=subs(f2,{x1,x2},{X(1),Y(1)});
if abs(X(1)-X(2)) > abs(Y(1)-Y(2))
    mayor=abs(X(1)-X(2));
else
    mayor=abs(Y(1)-Y(2));
end
tol=mayor;
fprintf('\nk|X1\t\t\t\t\t\t\t|X2\t\t\t\t\t\t\t|Error')
fprintf('\n0|%.15f|%.15f|0\n',X(1),Y(1))
i=2;
while tol > error
    X(i)=subs(f1,{x1,x2},{X(i-1),Y(i-1)});
    Y(i)=subs(f2,{x1,x2},{X(i-1),Y(i-1)});
if abs(X(i)-X(i-1)) > abs(Y(i)-Y(i-1))
    mayor=abs(X(i)-X(i-1));
else
    mayor=abs(Y(i)-Y(i-1));
end
tol=mayor;
fprintf('%d|%.15f|%.15f|%e\n',i-1,X(i),Y(i),tol)
i=i+1;
%if i==10
%   tol=error;
end
end