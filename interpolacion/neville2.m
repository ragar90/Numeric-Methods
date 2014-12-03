function neville2()
disp('Método de interpolación de Neville');
y=input('Ingrese el número a evaluar: ');
syms x
fx=input('Ingrese la función: ');
n=input('Ingrese el número de datos: ');
f=zeros(1,n);
x=zeros(1,n);
Q=zeros(n-1,n-1);
for i=1:n
    fprintf('Ingrese el valor de x%d: ',i-1);
    x(i)=input('');
    f(i)=subs(fx,x(i));
end
for l=1:n-1
    for m=l:n-1
        if l==1
            Q(m,l)=((y-x(m))*f(m+1)-(y-x(m+1))*f(m))/(x(m+1)-x(m));
            fprintf('\nQ[%d,%d]= (X-X(%d))Q[%d,%d]-(X-X(%d))Q[%d,%d])',m,l,m-1,m,l-1,m,m-1,l-1);
            fprintf('\n--------------------------------------------  =  %.15f',Q(m,l));
            fprintf('\n\t\t\tX(%d)-X(%d)\n',m,m-1);
        else
            Q(m,l)=((y-x(m-l+1))*Q(m,l-1)-(y-x(m+1))*Q(m-1,l-1))/(x(m+1)-x(m-l+1));
            fprintf('\nQ[%d,%d]= (X-X(%d))Q[%d,%d]-(X-X(%d))Q[%d,%d])',m,l,m-l,m,l-1,m-1,m-1,l-1);
            fprintf('\n--------------------------------------------  =  %.15f',Q(m,l));
            fprintf('\n\t\t\tX(%d)-X(%d)\n',m,m-l);
        end
    end
end
fprintf('\n\nEl valor aproximado de x es: %.15f',Q(n-1,n-1));
fprintf('\n\nEl valor aproximado de x es: %.15f',Q(n-1,n-1));
exacto=subs(fx,y);
fprintf('\nEl valor exacto es: %.15f ',exacto);
fprintf('\nEl error es: %.15f \n',exacto-Q(n-1,n-1));

