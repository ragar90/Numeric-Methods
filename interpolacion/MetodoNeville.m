clear all
clc
disp('Metodo de Neville')
disp('Recuerde que no hay funcion, debe de ingresar los datos con la funcion ya evaluada')
po=input('Ingrese el número a evaluar: ');
%creo las variables en que se almacenara los datos
x=input('Ingrese los datos en un nodos [x1 x2 x3....]: ');
f=input('Ingrese las imagenes de los nodos [fx1 fx2 fx3 ...]: ');
n=length(x);
Q=zeros(n-1,n-1);
%comienzo a evaluar los datos
%se crean los Q(x,y)
for l=1:n-1
    for m=l:n-1
        %El if esta xq si l>1 ya no se usan los valores de F(xi) sino que se usan los valores previamente obtenidos de Q
        if l==1
            %Calculo el valor de Q(x,y) y la Ec. la coloco en pantalla
            Q(m,l)=((po-x(m))*f(m+1)-(po-x(m+1))*f(m))/(x(m+1)-x(m));
            fprintf('\nQ[%d,%d]= (X-X(%d))Q[%d,%d]-(X-X(%d))Q[%d,%d])',m,l,m-1,m,l-1,m,m-1,l-1);
            fprintf('\n--------------------------------------------  =  %.9f',Q(m,l));
            fprintf('\n\t\t\tX(%d)-X(%d)\n',m,m-1);
        else
            %Calculo el valor de Q(x,y) y la Ec. la coloco en pantalla
            Q(m,l)=((po-x(m-l+1))*Q(m,l-1)-(po-x(m+1))*Q(m-1,l-1))/(x(m+1)-x(m-l+1));
            fprintf('\nQ[%d,%d]= (X-X(%d))Q[%d,%d]-(X-X(%d))Q[%d,%d])',m,l,m-l,m,l-1,m-1,m-1,l-1);
            fprintf('\n--------------------------------------------  =  %.9f',Q(m,l));
            fprintf('\n\t\t\tX(%d)-X(%d)\n',m,m-l);
        end
    end
end
fprintf('\n\nEl valor aproximado de x es: %.9f\n\n',Q(n-1,n-1));
fprintf('\n\nEl valor aproximado de x es: %.9e\n\n',Q(n-1,n-1));

    