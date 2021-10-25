function vectores()
    cantidad = input("Ingrese cantidad de puntos a graficar: ");
    vectorX = [];
    vectorY = [];
    for x = 1:cantidad
        fprintf("PUNTO")
        puntoX = input("Dime coordenada en X: ");
        puntoY = input("Dime coordenada en Y: ");
        if puntoX > 0
            vectorX(x) = puntoX;
        else
            fprintf("ERROR EL PUNTO NO ES POSITIVO")
        end
        if puntoY > 0
            vectorY(x) = puntoX;
        else
            fprintf("ERROR EL PUNTO NO ES POSITIVO")
        end
    end
    vectorX
    vectorY
end