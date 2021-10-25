function [theta1,vo1]=valores(theta,vo,finalxauto)
theta1=0;
vo1=0;
theta = 45;                      %Valor del ángulo elegido por nosotros
va = 36;                         %Valor de la velocidad inicial del carro elegido por nosotros     
xa = 1000;                       %Valor de la posición inicial del carro en x elegido por nosotros 
ya = 0;                          %Valor de la posición inicial del carro en y elegido por nosotros   
pasos = 1000;                    %Número de pasos que queremos graficar elegido por nosotros   
masa = 230;                      %Valor de la masa del misil elegida por nosotros 
xo = 0;                          %Valor de la posición inicial del misil en x elegido por nosotros 
yo = 0;                           %Valor de la posición inicial del misil en y elegido por nosotros
g= 9.81;                        %Valor constante de la gravedad


while xvar==finalxauto
   for i=-24.5:0.5:25
    theta1 = theta1+(theta*(i*0.1));
    vo1 = vo1+(vo*(i*0.1)); 
    [xvar,yvar]=parabola(tmax,vo1,xo,yo,theta1,masa,pasos,0.052)
   end
   theta1=theta1(end)
   vo1=vo1(end)
   
end
