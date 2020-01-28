t = linspace(0,11,60);
 populacja=[38.422346 38.426809 38.437239 38.483957 38.502396 38.533299 38.525670 38.186860 38.153389 38.135876 38.115641 38.132277 ];
 y0=38.422346;%rok 2006
 ile_urodzin=0.000382257;%382257
 jednostka_czasu=1; %1 rok
 pojemnosc=55;
 r=ile_urodzin/jednostka_czasu;
 n=[];
 for i=1:length(t)
 n(i)=1/(1/pojemnosc+(1/y0-1/pojemnosc).*exp(-ile_urodzin*t(i)))
 end
 %for i=1:12
  %   n(i)=y0*exp(ile_urodzin*t(i))
 %end
 plot(t,n,'b')
 hold on
 grid on
 plot([0:11],populacja,'r-o')
 hold on
 xlabel('czas w latach');
 ylabel('liczebnosc populacji*10^6');
 legend('populacja za pomocš modelu','rzeczywsite dane','Location','southwest')
