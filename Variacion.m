function [xop,yop]=Variacion(tmax,vo1,xo,yo,theta1,masa,pasos,k)


%FUNCION PARABOLA NORMAL SOLO QUE TIENE ALTERADOS LOS PARAMETROS 
%DE THETA Y VO
tmin = 0;                                %nuestra trayectoria inicia en el tiempo 0
g = 9.81;                                %valor de la gravedad que es una constante
deltat = (tmax-tmin)/pasos;              %calculamos por cuanto aumentará cada punto dividiendo el tiempo entre los pasos

y = yo;                                  %posición inicial en eje vertical
y1 = vo1*sin(theta1);                      %velocidad inicial en eje vertical
y2 = (-masa*g-k*y1)/masa;                %aceleración en eje vertical

x = xo;                                  %posición inicial en eje horizontal
x1 = vo1*cos(theta1);                      %velocidad inicial en eje horizontal
x2 = (-k*x1)/masa;                       %aceleración en eje horizontal

xop=[x];                                %posición en eje horizontal     
yop=[y];                                %posición en eje vertical

for i = 2:pasos                       %calculo de posición, velocidad y aceleración en cada punto 
    format shortg
    if y >=0 
    y2 =(-masa*g-k*y1)/masa;
    y1 = y1+ (y2*deltat);
    y = y + (y1*deltat);
    
    x2 =(-k*x1)/masa;
    x1 = x1 + (x2*deltat);
    x = x + (x1*deltat);
    
    else
        x=x; 
        y=0;
        
        break
    end 
 
  xop=[xop,x];                 %posición en eje horizontal  
  yop=[yop,y];                %posición en eje vertical
end
   
    
end



    
    


