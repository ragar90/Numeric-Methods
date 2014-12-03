%Metodo de Broyden para ecua no lineales
%x^(k)=x^(k-1)-(J(x^(k-1))^(-1)*F(x^(k-1))
syms x1 x2
A=0; F=0; x=0; Y=0; S=0; F1=0; xk=0;
disp('Las ecuaciones deben de ingresarlas usando las variables x1, x2')
disp('Las ecuaciones deben de estar igualadas a cero')
f1=input('Introduzca la funcion fx= ');
fun1=input('Introduzca la funcion fx entre '''' :');
f2=input('Introduzca la funcion fy= ');
fun2=input('Introduzca la funcion fy entre '''' :');
%Primero se sacan las derivadas y asi se evaluan las constantes
f11=diff(f1,x1);
f12=diff(f1,x2);
f21=diff(f2,x1);
f22=diff(f2,x2);
x1=input('Introduzca el valor de x1= ');
x2=input('Introduzca el valor de x2= ');
e=input('Introduzca la precision 10^-');
if e>0
    e=e*-1;
end
error= 10^e;
A(1,1)=subs(f11,{'x1','x2'},{x1,x2});
A(1,2)=subs(f12,{'x1','x2'},{x1,x2});
A(2,1)=subs(f21,{'x1','x2'},{x1,x2});
A(2,2)=subs(f22,{'x1','x2'},{x1,x2});
F1(1,1)=subs(f1,{'x1','x2'},{x1,x2});
F1(2,1)=subs(f2,{'x1','x2'},{x1,x2});
x=[x1 x2]';
k=1;

fprintf('\nMatriz Jacoviana\n')
MJ(1,1)=diff(fun1,'x1');
MJ(1,2)=diff(fun1,'x2');
MJ(2,1)=diff(fun2,'x1');
MJ(2,2)=diff(fun2,'x2');
MJ

fprintf('\n*** k=%d ***\nx(0)=\n',k)
for i=1:2
    fprintf('     %10.15f\n',x(i,1))
end
fprintf('\nF(x0)=\n')
for i=1:2
    fprintf('     %10.15f\n',F1(i,1))
end
fprintf('\nJ(x0)=\n')
for i=1:2
    for j=1:2
        fprintf('     %10.15f',A(i,j))
    end
    fprintf('\n')
end
A=inv(A);
fprintf('\nJ^(-1)(x0)=\n')
for i=1:2
    for j=1:2
        fprintf('     %10.15f',A(i,j))
    end
    fprintf('\n')
end
xk=x-A*F1;
fprintf('\nx(1)=x(0)-J^(-1)(x(0))F(x(0))\n')
for i=1:2
    fprintf('     %10.15f\n',xk(i,1))
end
tol=norm(xk-x,inf);
fprintf('\nError=|x(1)-x(0)|=%e\n',tol)
while tol>error
    k=k+1;
    x1=xk(1,1);
    x2=xk(2,1);
    F(1,1)=subs(f1,{'x1','x2'},{x1,x2});
    F(2,1)=subs(f2,{'x1','x2'},{x1,x2});
    Y=F-F1;
    F1=F;
    S=xk-x;
    ST=S';
    A=A+((S-A*Y)*ST*A)/(ST*A*Y);
    x=[x1 x2]';
    fprintf('\n*** k=%d ***\nx(%d)=\n',k,k-1)
    for i=1:2
       fprintf('     %10.15f\n',x(i,1))
    end
    fprintf('\nF(x%d)=\n',k-1)
    for i=1:2
       fprintf('     %10.15f\n',F(i,1))
    end   
    fprintf('\nY%d=F(X%d)-F(X%d)=\n',k-1,k-1,k-2)
    for i=1:2
       fprintf('     %10.15f\n',Y(i,1))
    end
    fprintf('\nS%d=x(%d)-x(%d)=\n',k-1,k-1,k-2)
    for i=1:2
       fprintf('     %10.15f\n',S(i,1))
    end
    fprintf('\nA%d=A%d+((S%d-A%d*Y%d)ST%d*A%d)/(ST%d*A%d*Y%d)\n',k-1,k-2,k-1,k-2,k-1,k-1,k-2,k-1,k-2,k-1)
    for i=1:2
      for j=1:2
          fprintf('     %10.15f',A(i,j))
      end
      fprintf('\n')
    end
    xk=x-A*F;
    fprintf('\nx(%d)=x(%d)-A^(-1)(x(%d))F(x(%d))\n',k,k-1,k-1,k-1)
    for i=1:2
       fprintf('     %.15f\n',xk(i,1))
    end
    tol=norm(xk-x,inf);
    fprintf('\nError=|x(%d)-x(%d)|=%e\n',k,k-1,tol)
end
fprintf('\nx1= %.15f',xk(1,1))
fprintf('\nx2= %.15f\n\n',xk(2,1))