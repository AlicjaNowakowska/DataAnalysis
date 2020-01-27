function kendall2
kobiety=[19.696176 19.704140 19.720950 19.730046 19.748008 19.875565 19.883965 19.868029 19.860916 19.839248 19.835181 19.833606 ]  ;
mezczyzni=[18.436101 18.411501 18.414926 18.423343 18.438852 18.650105 18.649334 18.634367 18.623041 18.597991 18.591628 18.588740 ];
malzenstwa=9*10^6;
kobiety=kobiety.*10^6;
mezczyzni=mezczyzni.*10^6;
s_kobiety=kobiety-malzenstwa*(ones(1,length(kobiety)));
s_mezczyzni=mezczyzni-malzenstwa;
s_kobiety=s_kobiety./10^6;
s_mezczyzni=s_mezczyzni./10^6
y0=[s_kobiety(1) s_mezczyzni(1) 9];
soln = ode45(@f2,[0 10],y0);%[jakie rowanania czas->start end ,warunki poczatkowe] ;
y0=[s_kobiety(1) s_mezczyzni(1) 9];
soln2 = ode45(@f5,[0 10],y0)
y0=[s_kobiety(1) s_mezczyzni(1) 9];
soln3 = ode45(@f7,[0 10],y0)
 t = linspace(0,10,100);
 y(:,1)=deval(soln,t,1) %Prey bierzemy pierwsza kolumne
 y(:,2)=deval(soln,t,2); %Predator bierzemy druga kolumne
 y(:,3)=deval(soln,t,3);
 t1 = linspace(0,10,100);
 z(:,1)=deval(soln2,t1,1) %Prey bierzemy pierwsza kolumne
 z(:,2)=deval(soln2,t1,2); %Predator bierzemy druga kolumne
 z(:,3)=deval(soln2,t1,3);
 t2 = linspace(0,10,100);
 k(:,1)=deval(soln3,t2,1) %Prey bierzemy pierwsza kolumne
 k(:,2)=deval(soln3,t2,2); %Predator bierzemy druga kolumne
 k(:,3)=deval(soln3,t2,3);
 %plot(t,y(:,2),'g')
% hold on
 %plot(0:11,s_mezczyzni,'r-o')

 %legend('samotni mezczyzni za pomoc¹ modelu','rzeczywsite dane','Location','northwest')
 %xlabel('czas w latach');
 %ylabel('liczebnoœæ populacji*10^6');
 %hold on
 %plot(t,y(:,2),'g')
 hold on
 plot(t,y(:,2),'r')
 hold on
 plot(t,z(:,2),'b')
 hold on
 plot(t,k(:,2),'g')
 hold on
 plot(0:11,s_mezczyzni,'k-o')
 hold on
% plot(0:11,s_mezczyzni,'g-o')
 %hold on
 %plot(0:11,s_mezczyzni,'r-o')
 %hold on
 xlabel('czas w latach');
 ylabel('liczebnosc populacji samotnych mezczyzn*10^6')
 %,'samotni mezczyzni za pomoc¹ modelu' 'samotni mezczyzni-rzeczywiste dane',
 legend('M(s_f,f_m)=2*s_f*f_m/(s_f+f_m)','M(s_f,f_m)=sqrt(s_f,f_m)','M(s_f,f_m)=min(s_f,f_m)','rzeczywiste dane','Location','northwest')
end
function dxdt = f2(t,x)
 dxdt = [0;0;0];
 b_f=0.52; u_m=0.02; sigma=0.25;u_f=0.01; b_m=0.48; %wspolczynnik rozwodow sigma
% b_f=1.0; u_m=0.000000001; sigma=0.4;u_f=0.2; b_m=0.9;
 dxdt(1) = (b_f+u_m+sigma)*x(3)-u_f*x(1)-2*x(1)*x(2)/(x(1)+x(2))%sqrt(x(1)*x(2));%2*x(1)*x(2)/(x(1)+x(2));
 dxdt(2) = (b_m+u_f+sigma)*x(3)-u_m*x(2)-2*x(1)*x(2)/(x(1)+x(2))%sqrt(x(1)*x(2));%2*x(1)*x(2)/(x(1)+x(2));
 dxdt(3) =-(u_m+u_f+sigma)*x(3)+2*x(1)*x(2)/(x(1)+x(2))%sqrt(x(1)*x(2));%2*x(1)*x(2)/(x(1)+x(2));
end
 
function dxdt = f5(t,x)
 dxdt = [0;0;0];
 b_f=0.52; u_m=0.02; sigma=0.25;u_f=0.01; b_m=0.48; %wspolczynnik rozwodow sigma
% b_f=1.0; u_m=0.000000001; sigma=0.4;u_f=0.2; b_m=0.9;
 dxdt(1) = (b_f+u_m+sigma)*x(3)-u_f*x(1)-sqrt(x(1)*x(2));%2*x(1)*x(2)/(x(1)+x(2));
 dxdt(2) = (b_m+u_f+sigma)*x(3)-u_m*x(2)-sqrt(x(1)*x(2));%2*x(1)*x(2)/(x(1)+x(2));
 dxdt(3) =-(u_m+u_f+sigma)*x(3)+sqrt(x(1)*x(2));%2*x(1)*x(2)/(x(1)+x(2));
end
 function dxdt = f7(t,x)
 dxdt = [0;0;0];
 b_f=0.52; u_m=0.02; sigma=0.25;u_f=0.01; b_m=0.48; %wspolczynnik rozwodow sigma
% b_f=1.0; u_m=0.000000001; sigma=0.4;u_f=0.2; b_m=0.9;
 dxdt(1) = (b_f+u_m+sigma)*x(3)-u_f*x(1)-min(x(1),x(2));%2*x(1)*x(2)/(x(1)+x(2));
 dxdt(2) = (b_m+u_f+sigma)*x(3)-u_m*x(2)-min(x(1),x(2));%2*x(1)*x(2)/(x(1)+x(2));
 dxdt(3) =-(u_m+u_f+sigma)*x(3)+min(x(1),x(2));%2*x(1)*x(2)/(x(1)+x(2));
 end