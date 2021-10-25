%Trayectorias

%Elige que variables usar

theta = 45;                      %Valor del ángulo elegido por nosotros
va = 36;                         %Valor de la velocidad inicial del carro elegido por nosotros     
xa = 1000;                       %Valor de la posición inicial del carro en x elegido por nosotros 
ya = 0;                          %Valor de la posición inicial del carro en y elegido por nosotros   
pasos = 1000;                    %Número de pasos que queremos graficar elegido por nosotros   
masa = 230;                      %Valor de la masa del misil elegida por nosotros 
xo = 0;                          %Valor de la posición inicial del misil en x elegido por nosotros 
yo = 0;                           %Valor de la posición inicial del misil en y elegido por nosotros
g= 9.81;                        %Valor constante de la gravedad

%Calcular vo

theta= theta*pi/180;                                              %Convertimos grados a radianes
[vo]=vm(va,xa,theta);                                          %Se llama a la función vm que calculará la velocidad inicial del sistema

tmax= (2/g)*(vo*sin(theta));                                      %Se calcula el tiempo en que los objetos terminarán su trayectoria

%trayectoria auto 
[xauto, yauto,finalxauto]=trayectoria_auto(va, tmax,xa,ya,pasos,0);           %Se llama a la función trayectoria_auto que calculara el desplazamiento del carro

%trayectoria misil sin fricción 
[xsol, ysol,deltat]=parabola(tmax,vo,xo,yo,theta,masa,pasos,0);           %Se llama a la función parabola que calculara el desplazamiento del misil sin resistencia del aire k=0
finalxsol=xsol(end)
%trayectoria misil con fricción 
[xcon, ycon, deltat]=parabola(tmax,vo,xo,yo,theta,masa,pasos,0.052);       %Se llama a la función parabola que calculara el desplazamiento del misil con resistencia del aire k=0.052
finalxcon=xcon(end)
%OPTIMIZACIÓN
theta1=0;
vo1=0;
deltat;
f1=finalxauto+2
f2=finalxauto-2

for i=1:1000:1000
   theta1 = theta1+(theta*(i*0.1));
   vo1 = vo1+(vo*(i*0.1)); 
   [xvar,yvar]=parabola(tmax,vo1,xo,yo,theta1,masa,pasos,0.052);
   if xvar<=f1 & xvar>=f2
    theta1=theta1(end)
    vo1=vo1(end)
   break
   end
end



figure(1)                                                          % Se grafican la 3 trayectorias, auto = negro, parabola sin k= azul, parabola con k= rojo
hold on
plot(xauto,yauto, 'k', 'LineWidth', 2);
plot(xsol,ysol, 'b', 'LineWidth', 1.25);
plot(xcon,ycon, 'r', 'LineWidth', 1.25);
legend({'Trayectoria auto','Sin fricción','Con fricción'},'Location','northeast');
