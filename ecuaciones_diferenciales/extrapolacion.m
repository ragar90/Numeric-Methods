%MÉTODO DE EXTRAPOLACIÓN

% - Introduzca la ecuación diferencial        : 'Dy+(4*y)=(x*exp(-x))'
% - Introduzca la condición y(a)=b            : 'y(0)=4'
% - Introduzca la función de trabajo          : (x*exp(-x))-(4*y)
% - Introduzca la condición inicial           : 4
% - Introduzca el valor de a                  : 0
% - Introduzca el valor de b                  : 0.1
% - Introduzca el tamaño de paso h            : 0.05
% - Introduzca el valor de precisión          : 10^(-4)

fprintf('\n');
clc;
fprintf('-----------------------\n')
fprintf('MÉTODO DE EXTRAPOLACIÓN\n')
fprintf('-----------------------\n')
fprintf('\n');
syms x y
f=input(' - Introduzca la función de trabajo          : ');
m = input('Introdusca la solucion: ');
ya=input(' - Introduzca la condición inicial           : ');
interv=input(' - Introduzca el rango de valores [a b] : ');
a = interv(1);
b = interv(2);
r=input(' - Introduzca el tamaño de paso h            : ');
error=input(' - Introduzca el valor de precisión 10^-');
if error>0
    error=error*-1;
end
e = 10^(error);
fprintf('\n\n');
fprintf(' - La solución de la ecuación diferencial es : \n\n');
% dsolve(d,n,'x');
pretty(m);
fprintf('\n\n\n');
%Condiciones para el funcionamiento de los lazos FOR
%Condiciones para el primer lazo FOR
d=0;
dg=0;
t(1)=a;
v(1)=a;
%Condiciones para el segundo lazo FOR
c=1;
g=0;
%Conciciones para el ciclo de operaciones
hp=[2 4 6 8 12 16 24 32];
a2=a+r;
w(1)=ya;
%Para el incremento de la matriz Y
f1=1;
f2=1;
%Primer lazo FOR
%Este for obtiene y guarda todos los valores de t
%También se utiliza para evaluar la ecuación diferencial
for p=a:r:b
   d=d+1;
   dg=dg+1;
   t(dg)=p;
   %v(d)=solve(subs(m,x,p));
end
xs(1)=v(1);
dj=1;
%Segundo lazo FOR
%Este for se usa para contabilizar las iteraciones
for s=c:1:d
   g=1+g;
   k(g)=(g-1);
end
k3=k(end);
%Varialbres utilizadas para el conteo de la presentación de los
%valores de t
g1=1;
t1=1;
%Este es el h inicial
r1=r;
dc=1;
%Inicio del for de las iteraciones
for a1=a2:r:b
   %Para el incremento de hq (h principal)
   a3=1;  
   %Para el incremento de hp
   a4=1;
   %Para el incremento de w
   ix=1;
   %Para el incremento de las evaluaciones
   dc=dc+1;
   dj=dj+1;
   fprintf('---------------------------------------');
   fprintf('\n - Para el valor de t%1.0f : %1.15f\n',k(g1+1),t(t1+1));
   fprintf('---------------------------------------');
   fprintf('\n\n');
   g1=g1+1;
   t1=t1+1;
   %Paso 1
   hq(a3)=r1/hp(a4); %h(0)
   fprintf('**** El valor de h%1.0f es   : %1.15f ****\n',(a3-1),hq(a3));
   %Paso 2
   %w(1)=ya   -->   w(0)= Condición inicial
   %Paso 3
   %w(1)
   w(ix+1)=w(1)+(hq(a3)*(subs(f,{x,y},{a,w(1)})));
   fprintf(' - w%1.0f = w%1.0f + h%1.0f * f(a,w%1.0f)',ix,ix-1,a3-1,ix-1);
   fprintf(' = %.15f',w(2));
   fprintf('\n');
   %Paso 4
   %w(2+n)
   ix=3;
   w(ix)=w(ix-2)+(2*hq(a3)*(subs(f,{x,y},{(a+((ix-2)*hq(a3))),(w(ix-1))})));  
   fprintf(' - w%1.0f = w%1.0f + 2 h%1.0f * f(a + h%1.0f,w%1.0f)',ix-1,ix-2,a3-1,a3-1,ix-2);
   fprintf(' = %.15f',w(3));
   fprintf('\n');
   %Paso 5
   %Y(1,1)
   Y(f1,f2)=(1/2)*(w((hp(a4)+1))+w(hp(a4))+(hq(a3)*(subs(f,{x,y},{(a+(((hp(a4))*hq(a3)))),w((hp(a4)+1))}))));
   fprintf(' - Y(%1.0f,%1.0f) = (1/2) [ w%1.0f + w%1.0f + h%1.0f * f(a + 2h%1.0f,w%1.0f) ]',f1,f2,(hp(a4)+1)-1,(hp(a4)+1)-2,(hp(a4)+1)-3,(hp(a4)+1)-3,(hp(a4)+1)-1);
   fprintf(' = %.15f',Y(f1,f2));
   fprintf('\n');   
   o2=Y(f1,f2);
   %Paso 6
   E=(abs(v(dc)-o2));
   fprintf(' - El error es         : %ef',E);
   fprintf('\n\n');	
   if E < e
      xs(dj)=o2;
   end
	%inicio del if
   if E >= e
    %Inicio del while
    while E >= e      
     a3=a3+1;
     a4=a4+1;
     ix=1;
     f2=1;
     %Paso 1a   
     hq(a3)=r1/hp(a4); %h(0)
     fprintf('**** El valor de h%1.0f es   : %1.9f ****\n',(a3-1),hq(a3));

     %Paso 2
        %w(1)=ya   -->   w(0)= Condición inicial
       %Paso 3
     %w(1)  
     w(ix+1)=w(1)+(hq(a3)*(subs(f,{x,y},{a,w(1)})));    
     fprintf(' - w%1.0f = w%1.0f + h%1.0f * f(a,w%1.0f)',ix,ix-1,a3-1,ix-1);
     fprintf(' = %.15f',w(2));
     fprintf('\n');
     %Paso 4
     ix=2;
     a6=1;
     for a5=a6:1:(hp(a4)-1)   
      ix=ix+1;
      %w(2+n)  
      w(ix)=w(ix-2)+(2*hq(a3)*(subs(f,{x,y},{(a+((ix-2)*hq(a3))),(w(ix-1))})));  
      fprintf(' - w%1.0f = w%1.0f + 2 h%1.0f * f(a + h%1.0f,w%1.0f)',ix-1,ix-3,a3-1,a3-1,ix-2);
      fprintf(' = %.15f',w(ix));
      fprintf('\n');
     end
     %Paso 5
     f1=f1+1;
     %Y(1,1)
     Y(f1,f2)=(1/2)*(w((hp(a4)+1))+w(hp(a4))+(hq(a3)*(subs(f,{x,y},{(a+(((hp(a4))*hq(a3)))),w((hp(a4)+1))})))); 
     fprintf(' - Y(%1.0f,%1.0f) = (1/2) [ w%1.0f + w%1.0f + h%1.0f * f(a + 2h%1.0f,w%1.0f) ]',f1,f2,(hp(a4)+1)-1,(hp(a4)+1)-2,(hp(a4)+1)-3,(hp(a4)+1)-3,(hp(a4)+1)-1);
     fprintf(' = %.15f',Y(f1,f2));
     fprintf('\n');
     o1=2;
     hl=1;
     for a7=a3:1:a3
       for a9=o1:1:a3
         f2=f2+1;
         Y(f1,f2)=Y(f1,f2-1)+((((hq(a3))^2)/((hq(a3-hl)^2)-((hq(a3))^2)))*(Y(f1,f2-1)-Y(f1-1,f2-1)));
         fprintf(' - Y(%1.0f,%1.0f) = Y(%1.0f,%1.0f) + [ ( (h%1.0f)^2 / ((h%1.0f)^2 - (h%1.0f)^2) ) * ( Y(%1.0f,%1.0f) - Y(%1.0f,%1.0f) ) ]',f1,f2,f1,f2-1,a3-1,a3-hl-1,a3-1,f1,f2-1,f1-1,f2-1);
         fprintf(' = %.15f',Y(f1,f2));
         fprintf('\n');
         o2=Y(f1,f2);
         hl=hl+1;
       end
     end
     %Paso 6
     E=(abs(v(dc)-o2));
     fprintf(' - El error es         : %ef',E);
     fprintf('\n\n');
     if E < e
          xs(dj)=o2;
     end
   %Fin del while   
   end
      %Fin del if   
   end
   %Con esta r (h) entra al nuevo ciclo de iteraciones
   %Se incrementa en h+h a cada itreración
   r1=r1+r;
   f1=1;
   f2=1;
   %Finalización del for de las iteraciones
end

%Presentación de los datos
fprintf('\n|i\t\t\t\t\t|ti\t\t\t\t\t|wi\t\t\t\t\t\t|y(t)\n');

for k1=0:k3
   k2=k1+1;
   %La respuesta es lo que se detalla en al tabla como y(t)
   fprintf('\n|%1.0f|%10.15f|%.15f|%.15f\n',k(k2),t(k2),xs(k2),v(k2));
end
fprintf('\n');

