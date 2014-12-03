function RICHARDSON(h,N,Xo,g)
%h es el espaciado, N es hasta q numero se va a llegar N3,N4, etc. Xo es el
%punto en donde se va a evaluar la derivada y g es la funcion.
R=zeros(N,N);
for j=1:N
    X1=Xo+h;
    X2=Xo-h;
    syms x
    g1=subs(g,X1);
    g2=subs(g,X2);
    %Primero usamos la formula de 3 puntos
    %f'(h)=(1/2h)(f(x0+h)-f(x0-h))
    %f'(h/2)=(1/2(h/2))(f(x0+(h/2))-f(x0-(h/2)))
    R(j,1)=(1/(2*h))*(g1-g2);
    fprintf('h=%1.4f\n',h)
    h=h/2;
end
for j=2:N
    for i=j:N
        R(i,j)=R(i,j-1) + (R(i,j-1)-R(i-1,j-1))/((4^(j-1))-1);
    end
end
for j=1:N
   for i=j:N
fprintf('N(%d,%d)= %3.10f\n',i,j,R(i,j))
   end
end
valor_aproximado=R(N,N)
gp=diff(g);
valor_exacto=subs(gp,Xo)
error=abs(valor_aproximado - valor_exacto)

%Formula de Richardson
%               N1(h/2)-N1(h)        
%N2(h)=N1(h/2)+ -------------
%                4^(j-1))-1
%
%                 N1(h/4)-N1(h/2)        
%N2(h/2)=N1(h/4)+ -------------
%                  4^(j-1))-1
%
%....
