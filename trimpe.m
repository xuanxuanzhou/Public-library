%-----追赶法----------
function s=trimpe(A,bb)
n=size(A,1);
s=zeros(n,1);
%-----取出三对角--------
b=diag(A);
a=diag(A,-1);
c=diag(A,1);
a(n)=A(1,n);
c(n)=A(n,1);


d=zeros(n,1);
u=zeros(n-2,1);
e=zeros(n-1,1);
f=zeros(n-1,1);
d(1)=b(1);u(1)=c(1)/d(1);e(1)=c(n);f(1)=a(1)/d(1);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
for k=2:n-2
   d(k)=b(k)-a(k)*u(k-1);
   u(k)=c(k)/d(k);
   e(k)=-e(k-1)*u(k-1);
   f(k)=-f(k-1)*a(k)/d(k);
end
d(n-1)=b(n-1)-a(n-1)*u(n-2);%%%%%%%%%%%%%%%%%%%%%%%%%%
e(n-1)=a(n)-e(n-2)*u(n-2);
f(n-1)=(c(n-1)-a(n-1)*f(n-2))/d(n-1);
ww=0;
for k=1:n-1
   ww=ww-e(k)*f(k);
end
 d(n)=b(n)+ww;
 
%-----追的过程------------
y=zeros(n,1);
y(1)=bb(1)/d(1);
for k=2:n-1
    y(k)=(bb(k)-a(k)*y(k-1))/d(k);
end
ww=0;
for k=1:n-1
   ww=ww+e(k)*y(k);
end
y(n)=(bb(n)-ww)/d(n);
%-----赶的过程---------------
s(n)=y(n);
s(n-1)=y(n-1)-f(n-1)*s(n);
for k=n-2:-1:1
    s(k)=y(k)-u(k)*s(k+1)-f(k)*s(n);
end
% s
% ss=inv(A)*bb
% sss=s-ss
end