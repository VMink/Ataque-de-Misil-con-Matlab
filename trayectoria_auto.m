function [xauto, yauto,finalxauto]=trayectoria_auto(va, tmax,xa,ya, pasos, k)
%Función para calcular la trayectoria de un automovil% 

tmin = 0;                               %tiempo inicial 0
masa= 2000;                             %masa del carro, aproximación que nosotros pusimos

deltax = (tmax-tmin)/pasos;             %calculamos por cuanto aumentará cada punto dividiendo el tiempo entre los pasos
ya= 0;                                  %posición constante en y, ya que el carro únicamente se mueve en el eje horizontal
x = xa;                                 %posición inicial en eje horizontal
x1 = va;                                %velocidad inicial en eje horizontal
x2 = (-k*x1)/masa;                      %aceleración en eje horizontal

yauto=(ya);                             %posición en eje vertical
xauto=(x);                              %posición en eje horizontal 

for i = 2:pasos                         %calculo de posición, velocidad y aceleración en cada punto 
    format shortg
    ya = 0;

    x = x + (x1*deltax);
    x1 = x1 + (x2*deltax);
    x2 =(-k*x1)/masa;

    yauto=[yauto,ya];                   %posición en eje vertical
    xauto=[xauto,x];                    %posición en eje horizontal
    
end 
    finalxauto=xauto(end)

end