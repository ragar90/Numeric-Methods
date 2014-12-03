function MetodoTrasadoresCubicos()
clear all;
clc;
disp('Método de interpolación trazadores cúbicos');
y=input('Ingrese el número a evaluar: ');
%n=input('Ingrese el número de nodos: ');
%xi=zeros(1,n);
%a=zeros(1,n);
xi=input('x0,x1,.....,xn:');
a=input('Valores evaluados en la función:');%f(xi)
n = length(xi);
%for o=1:n
%    fprintf('Ingrese el valor de x%d: ',o-1);
%    xi(o)=input('');
%    fprintf('Ingrese el valor de f(x%d): ',o-1);
%    a(o)=input('');
%end
for o=1:n-1
    if (xi(o)<y)&&(y<xi(o+1))
        z=o
        break;
    end
end
q=zeros(n-2,n);
t=zeros(n-2,n-2);
k=zeros(n-2,1);
c=ones(1,n);
c(1)=0;
c(n)=0;
h=zeros(1,n-1);
for o=1:n-1
    h(o)=xi(o+1)-xi(o);
end
for o=2:n-1
    q(o-1,o-1)=h(o-1)*c(o-1);
    q(o-1,o)=2*(h(o-1)+h(o))*c(o);
    q(o-1,o+1)=h(o)*c(o+1);
    k(o-1)=(3*(a(o+1)-a(o)))/h(o)-(3*(a(o)-a(o-1)))/h(o-1);
end
for o=2:n-1
    for e=1:n-2
        t(e,o-1)=q(e,o);
    end
end
con=cramer(t,k);
for o=2:n-1
    c(o)=con(o-1);
end
fprintf('\n\nAncho:\n\n');
for o=1:n-1
    fprintf('h%d= %.10f\n',o-1,h(o));
end
fprintf('\n\nConstantes:\n\n');
for o=1:n
    fprintf('a%d= %.10f\n',o-1,a(o));
end
fprintf('\n\n');
for o=1:n-1
    bk=(a(o+1)-a(o))/h(o)-(h(o)*(2*c(o)+c(o+1)))/3;
    fprintf('b%d= %.10f\n',o-1,bk);
end
fprintf('\n\n');
for o=1:n
    fprintf('c%d= %.10f\n',o-1,c(o));
end
fprintf('\n\n');
for o=1:n-1
    dk=(c(o+1)-c(o))/(3*h(o));
    fprintf('d%d= %.10f\n',o-1,dk);
end
b=(a(z+1)-a(z))/h(z)-(h(z)*(2*c(z)+c(z+1)))/3;
d=(c(z+1)-c(z))/(3*h(z));
syms x
S=a(z)+b*(x-xi(z))+c(z)*(x-xi(z))^2+d*(x-xi(z))^3;
fprintf('\n\nS(x)=\n');
pretty(S);
s=subs(S,y);
fprintf('\n\nEl valor de S(%f) es: %.10f\n\n',y,s);

function r=cramer(A,B)
[m, n] = size(A);
if m ~= n 
    error('La matriz no es cuadrada.')
end
if det(A) == 0 
    error('La matriz es singular.')
end
r=zeros(1,n);
for j=1:n
    b=A;
    b(:,j)=B;
    r(j)=det(b)/det(A);
end