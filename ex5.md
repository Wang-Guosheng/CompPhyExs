#第五次作业

## 1、蕨菜

```matlab
clear all
u=[0,1i];
figure
plot(u)
m1=0.44*[0,1i];
 for k=2:8
	uu=[0.56*[0,1i],0.56i+0.33*u*(sqrt(3)*0.5+0.5i),...
	0.56i+0.33*u*(sqrt(3)*0.5-0.5i),...
	0.56i+m1,1i+.26*u*(sqrt(3)*0.5+0.5i),...
	1i+.26*u*(sqrt(3)*0.5-0.5i),1i+0.667*u];
	u=uu;
	plot(u),axis equal,axis([-1,1,0,3.5])
	pause(1);
 end
```
# 2.康托尔集

```matlab
function ktr(a,b,n)
 B1=2/3*a+1/3*b;
 B2=1/3*a+2/3*b;
line([a,b],[n,n]);
axis([0 1 0 7])
 hold on
N2=n-1;
if N2>0;
    ktr(a,B1,N2);
    ktr(B2,b,N2);
end
```

## 3.香肠

```matlab
new=[0i,1+0i];
for k=1:4
    old=new;
    n=length(old)/2-1;
    diff=(old(2:2:end)-old(1:2:end-1))/4;
    p1=old(1:2:end-1)+diff;
    up=diff*exp(1i*pi/2);
    p2=p1+up;
    p3=p2+diff;
    dp=diff*exp(-1i*pi/2);
    p7=p3+dp;
    p4=p7+dp;
    p5=p4+diff;
    p6=p5+up;
    new(1:16:16*n+1)=old(1:2:end-1);
    new(2:16:16*n+2)=p1;
    new(3:16:16*n+3)=p1;
    new(4:16:16*n+4)=p2;
    new(5:16:16*n+5)=p2;
    new(6:16:16*n+6)=p3;
    new(7:16:16*n+7)=p3;
    new(8:16:16*n+8)=p7;
    new(9:16:16*n+9)=p7;
    new(10:16:16*n+10)=p4;
    new(11:16:16*n+11)=p4;
    new(12:16:16*n+12)=p5;
    new(13:16:16*n+13)=p5;
    new(14:16:16*n+14)=p6;
    new(15:16:16*n+15)=p6;
    new(16:16:16*n+16)=old(2:2:end);
    plot(new)
end
```