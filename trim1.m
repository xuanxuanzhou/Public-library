%-----追赶法----------
function s=trim1(A,bb)
n=size(A,1);
s=zeros(n,1);
%-----取出三对角--------
b=diag(A);
a=diag(A,-1);
c=diag(A,1);

d=zeros(n,1);
u=zeros(n-1,1);

for i=1:n-1
    d(1)=b(1);
    u(i)=c(i)/d(i);
    d(i+1)=b(i+1)-a(i)*u(i);
end
%-----追的过程------------
y=zeros(n,1);
y(1)=bb(1)/d(1);
for i=2:n
    y(i)=(bb(i)-a(i-1)*y(i-1))/d(i);
end
%-----赶的过程---------------
s(n)=y(n);
for i=n-1:-1:1
    s(i)=y(i)-u(i)*s(i+1);
end
% s
% ss=inv(A)*bb
% sss=s-ss
end