%Aplicacion de diferencias divididas 
clear all
clc
disp('-.Método de diferencias divididias.-')
X=input('Introduzca los valores de X [xo,x1,x2,...,x3]: ');
syms x
f=input('Introduzca la funcion f(x): ');
pto=input('Introduzca el punto a aproximar: ');
Y=subs(f,X);
n=length(X);
Q=zeros(n,n);
Q(:,1)=Y';
c=2;
k=1;

for j=2:1:n
    for i=c:1:n
        Q(i,j)=(Q(i,j-1)-Q(i-1,j-1))/(X(i)-X(i-k));
    end
    k=k+1;
    c=c+1;
end
fprintf('\nLa matriz Q es: \n')
disp(Q)
fprintf('\nEl polinomio P es: \n')

syms x
c=1;
prod=1;
P=Q(1,1);

for N=2:1:n
    for i=1:1:c
        prod=prod*(x-X(i));
    end
    c=c+1;
    P=P+prod*Q(N,N);
    prod=1;
end

P
valor_aprox=subs(P,pto);
valor_exacto=subs(f,pto);
resta=abs(valor_aprox-valor_exacto);
fprintf('\nEl valor aproximado es: %9.9f',valor_aprox)
fprintf('\nEl valor exacto es: %9.9f',valor_exacto)
fprintf('\nEl error entre las cifras es: %e',resta)
fprintf('\n')

        