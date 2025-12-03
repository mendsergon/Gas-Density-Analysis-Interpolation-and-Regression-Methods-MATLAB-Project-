function [l,L] = lagranp(x,y)
N = length(x)-1; 
l = 0;
for m = 1:N + 1
P = 1;
for k = 1:N + 1
    if k ~= m 
        P = conv(P,[1 -x(k)])/(x(m)-x(k)); 
    end
end
L(m,:) = P; 
l = l + y(m)*P; 
end