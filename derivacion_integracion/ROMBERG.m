clear all;
syms x y z q valorsitos;
disp('Metodo de Romberg')
f=input('Ingrese la funcion: ');
a=input('Ingrese el valor de a: ');
b=input('Ingrese el valor de b: ');
n=input('Ingrese el valor de N: ');
cont1=1;
%encontrando los valores de h
while(cont1<=n)
    h(cont1)=(b-a)/(2^(cont1-1));
    fprintf('h%d=%.9f\n\n',cont1,h(cont1));
    cont1=cont1+1;
end
%generando la primera columna
t(1,1)=(h(1)/2)*(subs(f,a)+subs(f,b));
fprintf('R(1,1)=%.4f/2*(f(%.4f)+f(%.4f))==>',h(1),a,b);
disp(t(1,1));
cont1=2;
sumatoria=0;
while(cont1<=n)
    cont2=1;
    fprintf('R(%1.0f,%1.0f)=1/2*(R(%1.0f,1)+h(%1.0f)*(',cont1,1,(cont1-1),cont1-1);
    valorsitos(cont1,cont2)=q+h(cont1-1);
    while(cont2<=(2^(cont1-2)))
        fprintf('f(%9.8f)+',(a+(2*cont2-1)*h(cont1)));
        valorsitos(cont1,cont2+1)=(q+a+(2*cont2-1)*h(cont1));
        sumatoria=sumatoria+subs(f,(a+(2*cont2-1)*h(cont1)));
        cont2=cont2+1;
    end
    t(cont1,1)=(1/2)*(t(cont1-1,1)+h(cont1-1)*sumatoria);
    fprintf(')==>');
    disp(t(cont1,1));
    sumatoria=0;
    cont1=cont1+1;
end
%generando el resto de la tabla
cont1=2;
cont2=2;
cont3=2;
while(cont2<=n)
    while(cont1<=n)
       t(cont1,cont2)=t(cont1,cont2-1)+(t(cont1,cont2-1)-t(cont1-1,cont2-1))/(4^(cont2-1)-1);
       fprintf('R(%1.0f,%1.0f)=R(%1.0f,%1.0f)+(R(%1.0f,%1.0f)-R(%1.0f,%1.0f)/%d)==>',cont1,cont2,cont1,cont2-1,cont1,cont2-1,cont1-1,cont2-1,(4^(cont2-1)-1));
       disp(t(cont1,cont2));
       cont1=cont1+1;
    end
    cont3=cont3+1;
    cont1=cont3;
    cont2=cont2+1;
end