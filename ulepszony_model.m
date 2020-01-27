function prey2
 %Predator-prey Model
 clc;clear;
 %y0 = [38.1906 59.950];%warunki poczatkowe w chwili w 2004 populacja_pl populacja_uk
 %populacja_pl=[38.1906 38.1738 38.422346 38.426809 38.437239 38.483957 38.502396 38.533299 38.525670 38.186860 38.153389 ];
 %populacja_uk=[59.9504 60.4133 60.8271 61.3191 61.8238 62.2605 	62.222403 62.649014 63.073914 63.497831 63.921121];
 y0=[3.81906 5.9950];%warunki poczatkowe w chwili w 2004 populacja_pl populacja_uk
 populacja_pl=[3.81906 3.81738 3.8422346 3.8426809 3.8437239 3.8483957 3.8502396 3.8533299 3.8525670 3.8186860 3.8153389 ];
 populacja_uk=[5.99504 6.04133 6.08271 6.13191 6.18238 6.22605 	6.2222403 6.2649014 6.3073914 6.3497831 6.3921121];
 soln = ode23(@f2,[0 100],y0)%[jakie rowanania czas->start end ,warunki poczatkowe] ;
 t = linspace(0,100,30);
 y(:,1)=deval(soln,t,1); %Prey bierzemy pierwsza kolumne
 y(:,2)=deval(soln,t,2); %Predator bierzemy druga kolumne
 figure
% plot(t,y(:,1),'g',t,y(:,2),'r');
 plot(t,y(:,1),'r');
 hold on
 plot(t,y(:,2),'b');
 hold on;
 grid on;
 
 xlabel('czas w latach');
 ylabel('liczebnoœæ populacji *10^7');
  
 plot(0:10,populacja_pl,'r-o')
 hold on
 plot(0:10,populacja_uk,'b-*')
 hold on
 %hold off;
 
 %plot([0:10],populacja_pl,'-*')
 %plot([0:10],populacja_uk,'-o')
 legend('populacja Polski za pomoc¹ modelu','populacja UK za pomoc¹ modelu','rzeczywsite dane PL','rzeczywiste dane UK','Location','southeast')
 end
 %Predator-prey function
 function dxdt = f2(t,x)
 dxdt = [0;0];
 %p =1; q =1.0876524 ; r =1.04 ; s = 1;%wspolczynnik nardozin kobiet /smiertelnoci wspolczynnik narodizn mezczyzn/zgonow
%p =1; q =1.0876524 ; r =1 ; s = 1
 %a=0.35; b=0.1; c=0.7; d=0.6;   %rodzi sie 350 000 dzieci,migruje 100 000 pl, rodiz siê 700 000 dzieci umiera 600 000 ludzi
 % a=0.035; b=0.01; c=0.07; d=0.06 e= f=;
 rx=0.035; kx=5.5 ; ry=0.07; ky=7.5 ; alpha=0.01; beta=0;
 a=rx ;b=rx/kx; c=alpha*rx/kx; d=ry; e=ry/ky; f=beta*ry/ky;
 dxdt(1) = a*x(1)-b*x(1)*x(1)+c*x(1)*x(2);%opisujemy nasz uklad rownan rozncizkowych
 dxdt(2) = d*x(2)-e*x(2)*x(2)+f*x(2)*x(1);
 end
 %p³ci mêskiej	7,38 œmiertelnych/1000 ¿ywych
%p³ci ¿eñskiej	5,9 œmiertelnych/1000 ¿ywych
%104 dziewczynki na 100 chlopcow
%umiera 202150 mezczyzn 185859 kobiet 