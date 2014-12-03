clc;
fprintf('Método de la secante\n');
a=input('Ingrese P0: ');
b=input('Ingrese P1: ');
syms x
fprintf('Recuerde que la funcion debe de ser de la forma f(x)=0\n');
f=input('Ingrese f(x): ');
e=input('Ingrese el margen de error: 10^-');
if e>0
    e=-e;
end
e=10^e;
%Inializamos los valores
P0=a;
P1=b;
%necesitmaos evaluar la funcion en 2 puntos diferentes
fp0=subs(f,P0);
fp1=subs(f,P1);
P2=P1-((fp1*(P1-P0))/(fp1-fp0));
error=abs(P2-P1);
cont=1;
fprintf('n\t|P0\t\t\t\t|P1\t\t\t\t|P2\t\t\t\t|error');
fprintf('\n%d\t|%.10f\t|%.10f\t|%.10f\t|%e\n',cont,P0,P1,P2,error);
while abs(P2-P1)>e
    P0=P1;
    P1=P2;
    cont=cont+1;
    fp0=subs(f,P0);
    fp1=subs(f,P1);
    P2=P1-((fp1*(P1-P0))/(fp1-fp0));
    error=abs(P2-P1);
    fprintf('%d\t|%.10f\t|%.10f\t|%.10f\t|%e\n',cont,P0,P1,P2,error);
end
fprintf('El valor aproximado de x es: %9.10f\n',P2);