close all
clear all
clc

% Cargar imagen de muestra y definir dimensiones
load Tele;
Filas = 214;
Columnas = 684;

% Cargar imagen original y mostrarla
im1 = imread('Fil_Tele.png');
figure(1); imshow(im1); impixelinfo;

% Reconstruir imagen a partir del vector "Tele"
k = 1;
for i = 1:Filas
   for j = 1:Columnas
       reconstruccion(i,j) = Tele(k);
       k = k + 1;
   end
end

% Mostrar imagen reconstruida
figure(2); imshow(reconstruccion); impixelinfo;

% Aplicar Umbralización de Otsu
Ifin = reconstruccion;
Umbral = graythresh(Ifin) * 255;        
[f,c] = size(Ifin);
for i = 1:f
    for j = 1:c
        if Ifin(i,j) < Umbral
            Ifin(i,j) = 0;
        else
            Ifin(i,j) = 255;
        end
    end
end

% Mostrar imagen umbralizada
figure(3); imshow(Ifin); impixelinfo;

% Calcular umbral a partir del promedio de píxeles en la fila central
for i = (Filas/2):(Filas/2)
    for j = 1:c
        vector(j) = Ifin(i,j);
    end
end
Promedio = (sum(vector)/length(vector));
umbral = round(Promedio);

% Aplicar umbralización a la imagen
Ifin = reconstruccion;
[f,c] = size(Ifin);
for i = 1:f
    for j = 1:c
        if Ifin(i,j) < umbral
            Ifin(i,j) = 0;
        else
            Ifin(i,j) = 255;
        end
    end
end

% Mostrar imagen umbralizada
figure(4); imshow(Ifin); impixelinfo;

% Calcular gradientes en x e y
xx = im2double(Ifin);
[f,c] = size(Ifin);
xf = zeros(f,c);
xc = zeros(f,c);
contorno = zeros(f,c);
for i = 1:f-1
    for j = 1:c
        xf(i,j) = (abs(xx(i+1,j) - xx(i,j)));
    end
end
for i = 1:f
    for j = 1:c-1
        xc(i,j) = (abs((xx(i,j+1) - xx(i,j))));
    end
end

% Mostrar gradientes en x e y
figure(5); imshow(xf); impixelinfo;
figure(6); imshow(xc); impixelinfo;

% Calcular el contorno sumando gradientes en x e y
for i = 1:f
    for j = 1:c-1
        contorno(i,j) = xf(i,j) + xc(i,j);
    end
end

% Redondear contorno y mostrar imagen resultante
resultante = round(contorno);
figure(7); imshow(resultante); impixelinfo;
