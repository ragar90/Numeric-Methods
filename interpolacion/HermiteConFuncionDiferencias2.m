function HermiteConFuncionDiferencias2()
disp('Método de interpolación de Hermite usando diferencias divididas');
y=input('Ingrese el número a evaluar: ');
syms x
f=input('Ingrese la función: ');
n=input('Ingrese el número de nodos: ');
n=2*n;
xi=zeros(1,n);
fxd=zeros(1,n);
dif=zeros(n,n);
px=0;
Lnk=1;
fd=diff(f);
for k=1:2:n
    fprintf('Ingrese el valor de x%d: ',k-1);
    xi(k)=input('');
    xi(k+1)=xi(k);
    dif(k,1)=subs(f,xi(k));
    dif(k+1,1)=dif(k,1);
    fxd(k)=subs(fd,xi(k));
    fxd(k+1)=fxd(k);
    if k==1
        px=px+dif(k,1);
    end
end
syms x
for l=2:n
    for m=l:n
        if xi(m)==xi(m-l+1)
            dif(m,l)=fxd(m);
        else
            dif(m,l)=(dif(m,l-1)-dif(m-1,l-1))/(xi(m)-xi(m-l+1));
        end
        if m==l
            for t=1:l-1
                Lnk=Lnk*(x-xi(t));
            end
            px=px+(dif(m,l)*Lnk);
            Lnk=1;
        end
    end
end
p=1;
for l=1:n
    fprintf('\n%.15f\t\t%.15f\t\t',xi(l),dif(l,1));
    for m=2:p
        fprintf('%.15f\t\t',dif(l,m));
    end
    p=p+1;
end
fprintf('\n\nP(x)=\n');
pretty(px);
a=subs(px,y);
fprintf('\n\nEl valor de P(%f) es: %.15f\n\n',y,a);
w=subs(f,y);
fprintf('El valor exacto de f(x) es: %.15f\n',w);
error=abs(w-a);
fprintf('El error de aproximación es: %.9E\n\n',error);