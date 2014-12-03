function N = richardson2B(f, x0, n, h, pre)
%meter lo de arriba  asi como va copy paste! y  la funcion f es  primero
%hayq  declararla!
% f es la funcion, x0 el de aproximar, n el subindice de N, h es h y pre es
% precisi�n (opcional)
 
if nargin < 5
    pre = 8;
end
pre = num2str(pre);

N = zeros(n,n);

% generamos la primera columna
for a = 1:n
    h_ = h/(2^(a-1));    
    expr = sprintf('[1/(2*(%g))]*[f(%g) - f(%g)]', h_, x0 + h_, x0 - h_);   
    N(a, 1) = centrada3_fun(f, x0, h_, str2num(pre));    
    
end

% las demas columnas
for a = 2:n
    for b = a:n 
        N(b, a) = N(b, a-1) + (N(b, a-1) - N(b-1, a-1))/(4^(a-1) - 1);
    end
end