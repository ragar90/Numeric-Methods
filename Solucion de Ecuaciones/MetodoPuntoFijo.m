clc
fprintf('Método de iteración de punto fijo\n');
a=input('Ingrese a: ');
b=input('Ingrese b: ');
P0=input('Ingrese P0: ');
while (P0<a)||(P0>b)
    fprintf('\nP0 esta fuera del intervalo\n');
    P0=input('Reingrese P0: ');
end
syms x
disp('Recuerde que la funcion debe de ser de la forma f(x)=x')
g=input('Ingrese g(x): ');
e=input('Ingrese el margen de error: 10^-');
if e>0
    e=-e;
end
e=10^e;
P=subs(g,P0);
cont=1;
error=abs(P-P0);
fprintf('n\t|P0\t\t\t|P\t\t\t|error');
fprintf('\n%d\t|%.20f\t|%.20f\t|%e',cont,P0,P,error);
while abs(P-P0)>e
    P0=P;
    P=subs(g,P0);
    cont=cont+1;
    error=abs(P-P0);
    fprintf('\n%d\t|%.20f\t|%.20f\t|%e',cont,P0,P,error);
end
fprintf('\nEl valor aproximado de x es: %9.8\n',P);