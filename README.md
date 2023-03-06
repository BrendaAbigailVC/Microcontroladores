# Microcontroladores
## **Practica 2**
#### Integrantes:
- Garcia Delgado Miguel Etzel
- Jiménez Barrera Jorge Francisco
- Lara Cruz Jessica 
- Valdes Crisanto Brenda Abigail
#

En esta practica se hace la implementacion de un programa codificado en lenguaje ensamblador ARMV7
Se crearan cinco funciones en  el programa las cueles son :

* userInput: Función que realiza una llamada al sistema para la lectura de una cádena de caracteres. Recibe como argumentos el espacio de memoria donde será guardado y la cantidad de bytes que podrán ser leídos. Regresa la cantidad de caracteres que poseé la cadena.

* asciiInt: Función que convierte una cadena de caracteres a un entero sin signo. Recibe como argumentos el espacio de memoria donde se encuentra la cadena de caracteres y la cantidad de caracteres que poseé. Regresa el número entero correspondiente.

* arrayAdd: Función que suma los elementos de un arreglo. Recibe como argumento la direccion de memoria donde inicia el arreglo. Regresa el resultado de la suma.

* intAscii: Función que convierte un entero sin signo a una cadena de caracteres. Recibe como argumentos la dirección de memoria de la suma de los elementos del arreglo y el espacio de memoria donde se guardará la cadena de caracteres. Regresa la cantidad de caracteres que poseé la cadena.

* userOutput: Función que realiza una llamada al sistema para la escritura de una cádena de caracteres. Recibe como argumentos el espacio de memoria donde se encuentra la cadena de caracteres y la cantidad de caracteres que poseé. No regresa nada.

#
Compilación
*  Ensamble:  arm-as Practica.s -o Partica.o
*  Enlace: arm-gcc Practica.o -o Practica.elf -static 
*  Ejecución: arm-run Practica.elf 

#
Marcos de las funciones implementadas:

![image](https://user-images.githubusercontent.com/110583656/223008277-65319ca2-b229-46eb-a2b5-bc126f191f46.png)

![image](https://user-images.githubusercontent.com/110583656/223007699-febc7ab7-5286-417a-abf7-f5f40d741579.png)

![image](https://user-images.githubusercontent.com/110583656/223007765-4d915c90-a07b-40ba-b4e6-e1fccfd6f304.png)

![image](https://user-images.githubusercontent.com/110583656/223007823-fe1e485f-0c98-49e8-a0fb-3dee4530699c.png)

![image](https://user-images.githubusercontent.com/110583656/223007883-63b45c48-4739-4bfb-834a-47d4cd2abd1b.png)



