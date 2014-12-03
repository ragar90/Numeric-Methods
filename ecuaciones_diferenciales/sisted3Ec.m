clc
clear all
disp('Método de solucion de sistemas de ecuaciones diferenciales');
m=input('Ingrese el # de ecuaciones: ');
%agregar mas variables simbolicas si hay mas ecuaciones
syms x y z t
fi=cell(1,m);
for i=1:m
    fprintf('Ingrese f%d´: ',i); % 1+1/2*exp(t)-2*x
    fi{i}=input('');
end
%fprintf('\n');
wi0=zeros(1,m);
for i=1:m
    fprintf('Ingrese w%d0: ',i); % 2
    wi0(i)=input('');
end
%fprintf('\n');
interv=input('Ingrese el intervalo: '); %[0 0.3]
h=input('Ingrese el tamaño de paso: '); % 0.1
n=(interv(2)-interv(1))/h;
n=round(n);
ti=zeros(1,n+1);
for i=2:n
    ti(i)=interv(1)+(i-1)*h;
end
ti(1)=interv(1);
ti(n+1)=interv(2);
k1i=zeros(1,m);
k2i=zeros(1,m);
k3i=zeros(1,m);
k4i=zeros(1,m);
wij=zeros(n);
fprintf('\n');
for j=1:n
    fprintf('\nj = %d\nt%d = %d\n\n',j-1,j-1, ti(j+1));
    %fprintf('\nj=%d\n\n',j-1);
    display('Calculando k1i...')
    for i=1:m
        if j==1
            k1i(i)=h*subs(fi{i},{t,x,y,z},{ti(j),wi0(1),wi0(2),wi0(3)});
        else
            k1i(i)=h*subs(fi{i},{t,x,y,z},{ti(j),wij(1,j-1),wij(2,j-1),wij(3,j-1)});
        end
        %fprintf('K1%d = h*f(t%d,w%d)',i,j,j); %rk4 normalito
        fprintf('k1%d = h*f%d(t%d',i,i,j-1);
        for cont=1:m
            fprintf(',w%d%d',cont,j-1);
        end
        fprintf(') = %.9f\n',k1i(i));
        %fprintf('K1%d=%.9f\n',i,k1i(i)); %como lo tenia el gordo
    end
    display('Calculando k2i...')
    for i=1:m
        if j==1
            k2i(i)=h*subs(fi{i},{t,x,y,z},{ti(j)+h/2,wi0(1)+1/2*k1i(1),wi0(2)+1/2*k1i(2),wi0(3)+1/2*k1i(3)});
        else
            k2i(i)=h*subs(fi{i},{t,x,y,z},{ti(j)+h/2,wij(1,j-1)+1/2*k1i(1),wij(2,j-1)+1/2*k1i(2),wij(3,j-1)+1/2*k1i(3)});
        end
        %fprintf('K2%d = h*f(t%d+h/2,w%d+1/2*k1)',i,j,j); %rk4 normalito
        fprintf('k2%d = h*f%d(t%d+h/2',i,i,j-1);
        for cont=1:m
            fprintf(',w%d%d+(1/2)*k1%d',cont,j-1,cont);
        end
        fprintf(') = %.9f\n',k2i(i));
        %fprintf('K2%d=%.9f\n',i,k2i(i));
    end
    display('Calculando k3i...')
    for i=1:m
        if j==1
            k3i(i)=h*subs(fi{i},{t,x,y,z},{ti(j)+h/2,wi0(1)+1/2*k2i(1),wi0(2)+1/2*k2i(2),wi0(3)+1/2*k2i(3)});
        else
            k3i(i)=h*subs(fi{i},{t,x,y,z},{ti(j)+h/2,wij(1,j-1)+1/2*k2i(1),wij(2,j-1)+1/2*k2i(2),wij(3,j-1)+1/2*k2i(3)});
        end
        %fprintf('K3%d = h*f(t%d+h/2,w%d+1/2*k2)',i,j,j); %rk4 normalito
        fprintf('k3%d = h*f%d(t%d+h/2',i,i,j-1);
        for cont=1:m
            fprintf(',w%d%d+(1/2)*k2%d',cont,j-1,cont);
        end
        fprintf(') = %.9f\n',k3i(i));
        %fprintf('K3%d=%.9f\n',i,k3i(i));
    end
    display('Calculando k4i...')
    for i=1:m
        if j==1
            k4i(i)=h*subs(fi{i},{t,x,y,z},{ti(j)+h,wi0(1)+k3i(1),wi0(2)+k3i(2),wi0(3)+k3i(3)});
        else
            k4i(i)=h*subs(fi{i},{t,x,y,z},{ti(j)+h,wij(1,j-1)+k3i(1),wij(2,j-1)+k3i(2),wij(3,j-1)+k3i(3)});
        end
        %fprintf('K4%d = h*f(t%d,w%d+k3)',i,j+1,j); %rk4 normalito
        fprintf('k4%d = h*f%d(t%d+h',i,i,j-1);
        for cont=1:m
            fprintf(',w%d%d+k3%d',cont,j-1,cont);
        end
        fprintf(') = %.9f\n',k4i(i));
        %fprintf('K4%d=%.9f\n',i,k4i(i));
    end
    display('Calculando wij...')
    for i=1:m
        if j==1
            wij(i,j)=wi0(i)+1/6*(k1i(i)+2*k2i(i)+2*k3i(i)+k4i(i));
        else
            wij(i,j)=wij(i,j-1)+1/6*(k1i(i)+2*k2i(i)+2*k3i(i)+k4i(i));
        end
        fprintf('w%d%d = w%d%d+(k1%d+2*k2%d+2*k3%d+k4%d)/6 = %.9f\n',i,j,i,j-1, i,i,i,i, wij(i,j));
        %fprintf('w%d%d=%.9f\n',i,j,wij(i,j));
    end
    fprintf('\n');
end