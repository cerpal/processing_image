# processing_image

Este código procesa una imagen "Fil_Tele.png" mediante varios pasos. Primero se carga un archivo de datos "Tele.mat" que contiene un vector con los valores de los píxeles de la imagen. Luego se reconstruye la imagen a partir del vector y se muestra en una figura.

A continuación, se aplica un método de umbralización de Otsu para binarizar la imagen. Se calcula el umbral de Otsu y se utiliza para convertir los valores de los píxeles a 0 o 255.

Después, se calcula el promedio de los valores de los píxeles de la fila del medio de la imagen binarizada. Este promedio se utiliza como umbral para binarizar la imagen de nuevo, eliminando el ruido de la imagen.

A continuación, se calculan las diferencias entre píxeles adyacentes en filas y columnas y se suman. Esto produce una imagen que destaca los contornos en la imagen.

Por último, se muestra la imagen resultante con los contornos destacados.