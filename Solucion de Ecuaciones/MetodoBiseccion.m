clc
disp('Metodo de Biseccion')
a=input('Introduzca el valor de X0: ');
b=input('Introduzca el valor de X1: ');
syms x
disp('Recuerde que la funcion debe de ser de la forma f(x)=0')
g=input('Introduzca la funcion: ');
e=input('Ingrese el margen de error: 10^-');
if e>0
    e=-e;
end
error=10^e;
fa=subs(g,a);
fb=subs(g,b);
c=0;
if fa*fb<0
    c=(a+b)/2;
    fc=subs(g,c);
    cont=1;
    tol=abs(fc);
    fprintf('n || a\t\t\t  || b\t\t\t  || P\t\t\t  || error\n') 
    fprintf('%d || %.10f || %.10f || %.10f || %e\n', cont,a,b,c,tol)
    while abs(c-a)>error
        cont=cont+1;
        if fa*fc<0
            a=a;
            b=c;
            c=(a+b)/2;
            tol=abs(c-b);
        else
            a=c;
            b=b;
            c=(a+b)/2;
            tol=abs(c-a);
        end
        fc=subs(g,c);
        fprintf('%d || %.10f || %.10f || %.10f || %e\n', cont,a,b,c,tol)
    end
end
fprintf('\nEl valor aproximado de X es: %.10f\n', c)
    