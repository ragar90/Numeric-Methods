clc
fprintf('Método de la posicion falsa\n');
a=input('Ingrese a: ');
b=input('Ingrese b: ');
syms x
disp('Recuerde que la funcion debe de ser de la forma f(x)=0')
f=input('Ingrese f(x): ');
e=input('Ingrese el margen de error: 10^-');
if e>0
    e=-e;
end
e=10^e;
%Inicializamos los valores
P0=a;
P1=b;
fp0=subs(f,P0);
fp1=subs(f,P1);
if fp1*fp0<0
    %misma formula que en el Metodo de la Secante
    P2=P1-((fp1*(P1-P0))/(fp1-fp0));
    error=abs(P2-P1);
    cont=1;
    fprintf('n || P0\t\t\t\t || P1\t\t\t\t || P2\t\t\t\t || error');
    fprintf('\n%d || %.20f\t || %.20f\t || %.20f\t || %e\n',cont,P0,P1,P2,error);
    while abs(P2-P1)>e
        cont=cont+1;
        fp2=subs(f,P2);
        %Los valores iniciales deben de tener signos opustos
        if fp0*fp2<0
            P0=P0;
            P1=P2;
        else
            if fp1*fp2<0
                P0=P1;
                P1=P2;
            end
        end
        fp0=subs(f,P0);
        fp1=subs(f,P1);
        %misma formula que en el Metodo de la Secante
        P2=P1-((fp1*(P1-P0))/(fp1-fp0));
        error=abs(P2-P1);
        fprintf('%d\t || %.20f\t || %.20f\t || %.20f\t || %e\n',cont,P0,P1,P2,error);
        
    end
end
fprintf('El valor aproximado de x es: %9.10f\n',P2);