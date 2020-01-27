pi_x=[0.00615+0.00091+0.00061 0.00070 0.00132 0.00136 0.00162 0.00234 0.00385 0.00746 0.01316 0.02078 0.03032 0.04364 0.06709 0.11241 0.19513 0.33001
]; 
urodzenia=[356.1 364.4 374.2 387.9 414.5 417.6 413.3 388.4 386.3 369.6 375.2 369.3  369.308]
urodzenia=urodzenia/2
%w chwili t=0 wiek ludzi zkrokiem co 5 lat warunki poczatkowe funkcji
%u(x,0)
funkcja_u_wiek=[1794481 2045472 2537284 2980474 3306759 3062053 2664952 2366347 2585935 3093469 2942361 2264454 1511521 1561704 1412374 1078008];
%u(x,0)
%poszczególny wiek z odstêpstwem piêciu lat. praw œmierci
pi_x =1-pi_x;
%policzenie f(t)
wsp_dzietnosci=1.35/80; %t=2004
beta=wsp_dzietnosci/2;
r_1=r_n(beta,pi_x,1)
r_0=r_n(beta,pi_x,0)
r_2=r_n(beta, pi_x,2)
%k_1=r_1/r_0
%k_2=k_1-(r_2)^2/(r_0^2)
delta=r_1^2-2*r_2*(r_0-1)
lambda_1=(r_1-sqrt(delta))/(2*r_2)%uzyska³yœmy rozwi¹zanie urojone tka tyci tyci urojonego
lambda_2=(r_1+sqrt(delta))/(2*r_2)
t=0:12; %20 lat
A=urodzenia(1)
plot(t,A*1000*exp(lambda_1*t),'g')
hold on
plot(t,A*1000*exp(lambda_2*t),'b')
%plot(t,exp(t))
hold on
plot(0:12,urodzenia*10^3,'r-o')
hold on
%t1=[]
%for i=1:length(t)
 %   a=t(i)
%t1(i)=f_t(beta,funkcja_u_wiek,pi_x,a)
%end
%plot(t,t1)
%hold on
xlabel('czas w latach');
ylabel('Liczba narodzonych dzieci w chwili t');
legend('B(t) dla lambda<0','B(t) dla lambda>0','rzeczywiste dane','Location','northwest')