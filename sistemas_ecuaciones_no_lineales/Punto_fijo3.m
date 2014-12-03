function Punto_fijo3()
%Las funciones tienen que estar de la forma x=g(x)!!!
syms x y z
disp('Metodo de Punto Fijo para un sistema de 3 Ec.')
disp('Las funciones tienen que estar de la forma x=g(x)!!!')
f1=input('Ingrese la funcion 1: ');
f2=input('Ingrese la funcion 2: ');
f3=input('Ingrese la funcion 3: ');
xo=input('Valor inicial X1= ');
yo=input('Valor inicial X2= ');
zo=input('Valor inicial X3= ');
error=input('Ingrese el error de a forma 1*10^(-x): ');
X(1)=xo;
Y(1)=yo;
Z(1)=zo;
X(2)=subs(f1,{x,y,z},{X(1),Y(1),Z(1)});
Y(2)=subs(f2,{x,y,z},{X(1),Y(1),Z(1)});
Z(2)=subs(f3,{x,y,z},{X(1),Y(1),Z(1)});
if abs(X(1)-X(2)) > abs(Y(1)-Y(2))
    mayor=abs(X(1)-X(2));
    if abs(X(1)-X(2))> abs(Z(1)-Z(2))
        mayor=abs(X(1)-X(2));
    else
        mayor=abs(Z(1)-Z(2));
    end
else
    mayor=abs(Y(1)-Y(2));
    if abs(Y(1)-Y(2)) > abs(Z(1)-Z(2))
        mayor=abs(Y(1)-Y(2));
    else
        mayor=abs(Z(1)-Z(2));
    end
end
tol=mayor;
fprintf('k=0 X1=%9.8f X2=%9.8f X3=%9.8f \n',X(1),Y(1),Z(1))
i=2;
while tol > error
    X(i)=subs(f1,{x,y,z},{X(i-1),Y(i-1),Z(i-1)});
    Y(i)=subs(f2,{x,y,z},{X(i-1),Y(i-1),Z(i-1)});
    Z(i)=subs(f3,{x,y,z},{X(i-1),Y(i-1),Z(i-1)});
if abs(X(i)-X(i-1)) > abs(Y(i)-Y(i-1))
    mayor=abs(X(i)-X(i-1));
    if abs(X(i)-X(i-1))> abs(Z(i)-Z(i-1))
        mayor=abs(X(i)-X(i-1));
    else
        mayor=abs(Z(i)-Z(i-1));
    end
else
    mayor=abs(Y(i)-Y(i-1));
    if abs(Y(i)-Y(i-1)) > abs(Z(i)-Z(i-1))
        mayor=abs(Y(i)-Y(i-1));
    else
        mayor=abs(Z(i)-Z(i-1));
    end
end
tol=mayor;
fprintf('k=%d X1=%9.8f X2=%9.8f X3=%9.8f Error=%e\n',i-1,X(i),Y(i),Z(i),tol)
i=i+1;
if i==10
    tol=error;
end
end