function diferenciasdivididas()
clear all;
clc;
disp('Método de interpolación de diferencias divididas de Newton');
syms x;
y=input('Ingrese el número a evaluar: ');
%n=input('Ingrese el número de datos: ');
%creo las variables en que se almacenara los datos
%recordar que para una matrix M(x,y) el orden es M(fila , columna)
%xi=zeros(1,n);
xi = input('Ingrese los datos en un nodos [x1 x2 x3....]: ');
n = length(xi);
dif=zeros(n,n);
yi = input('Ingrese las imagenes de los nodos [fx1 fx2 fx3 ...]: ');
dif(:,1)= transpose(yi);
polinomio=0;
factor=1;
%Pido los datos de entrada
for k=1:n
    %fprintf('Ingrese el valor de x%d: ',k-1);
    %xi(k)=input('');
    %fprintf('Ingrese el valor de f(x%d): ',k-1);
    %dif(k,1)=input(''); %me desplazo en las filas
    if k==1
        polinomio=polinomio+dif(k,1);
    end
end
for l=2:n
    for m=l:n
        dif(m,l)=(dif(m,l-1)-dif(m-1,l-1))/(xi(m)-xi(m-l+1));
        %se entra al loop al inicio para tener todos los factores (x-xn) 
        %en cada iteracion
        if m==l
            for t=1:l-1
                % en la variable vamos a ir guardando la expresión (x - x0)(x - x1)...
                % (x - xn)
                factor=factor*(x-xi(t));
            end
            %Se agrega el contenido de factores y guardamos el polinomio final
            polinomio=polinomio+(dif(m,l)*factor);
            factor=1;
        end
    end
end
fprintf('Opciones:\n1) Respuestas en escritura normal\n2) Respuestas en notación científica\n');
t=1;
p=1;
while t==1
    op=input('Ingrese la opción: ');
    switch op
        case 1
            for l=1:n
                fprintf('\n%.8f\t\t%.8f\t\t',xi(l),dif(l,1));
                for m=2:p
                    fprintf('%.8f\t\t',dif(l,m));
                end
                p=p+1;
            end
            t=0;
        case 2
            for l=1:n
                fprintf('\n%.8E\t\t%.8E\t\t',xi(l),dif(l,1));
                for m=2:p
                    fprintf('%.8E\t\t',dif(l,m));
                end
                p=p+1;
            end
            t=0;
        otherwise
            disp('Opción incorrecta');
            t=1;
    end
end
fprintf('\n\nP(x)=\n');
pretty(polinomio);
a=subs(polinomio,y);
fprintf('\n\nEl valor de P(%f) es: %.10f\n\n',y,a);