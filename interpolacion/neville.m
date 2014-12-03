x=input('Ingrese los datos en un nodos [x1 x2 x3....]: ');
f=input('Ingrese las imagenes de los nodos [fx1 fx2 fx3 ...]: ');
x0 = input('Ingrese el punto que quiere aproximar: ');
n = length(x);
Q = zeros(n,n);
Q(:,1) = f';
for j=2:n
    for i=j:n
        fprintf('\n((x0 - x(%d))*Q(%d,%d) - (x0 - x(%d))*Q(%d,%d) )/( x(%d) - x(%d))\n',i-1,i,j-1,i,i-1,j-1,i,i-1);
        Q(i,j)= ( (x0 - x(i-1))*Q(i,j-1) - (x0 - x(i))*Q(i-1,j-1) )/(x(i)-x(i-1));
    end
end
Q