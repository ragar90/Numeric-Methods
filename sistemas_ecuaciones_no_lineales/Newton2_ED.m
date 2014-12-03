%METODO DE NEWTON PARA SOLUCION DE SISTEMAS DE ECUACIONES NO LINEALES
clear all
clc
syms x1 x2
fprintf('\n- SOLUCION NUMERICA DE SISTEMAS NO LINEALES\n');
disp('Las ecuaciones deben de ser de la forma G(x1,x2)=0')
for i=1:2
   fprintf('- Introduzca la ecuacion G%0.0f : ',i);
   G(i)=input('');
end
xo = input('- Digite el vector de condiciones iniciales [xo1,xo2] :');
e = input('- Introduzca la precision 10^-');
if e>0
    e = e*-1;
end
err = 10^(e);
pre=err+1;
k=1;
for i=1:2
   Jx(i,1)=diff(G(i),x1);
   Jx(i,2)=diff(G(i),x2);
end
while abs(pre)>err
    for i=1:2
       Fxo(i)=subs(G(i),{x1,x2},{xo(1),xo(2)});
       Jxo(i,1)=subs(Jx(i,1),{x1,x2},{xo(1),xo(2)});
       Jxo(i,2)=subs(Jx(i,2),{x1,x2},{xo(1),xo(2)});
    end
    fprintf('\n\n- Iteracion %0.0f----------------------------------------------------\n',k);
    Fxi=Fxo'
    JX = subs(Jx,{x1,x2},{xo(1),xo(2)})
    %numeric(Jxo)
    X=(xo'-inv(Jxo)*Fxo')
    aux=X';
    k=1+k;
    e1=abs(xo(1)-X(1,1));
    e2=abs(xo(2)-X(2,1));
    pre=max([e1,e2]);
    xo=X';
    fprintf('\n El error es %e\n',pre);
end