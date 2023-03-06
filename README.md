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

* userInput: La cual realiza una llamada al sistema por medio de los argumentos de read, para que el usuario pueda ingresar los elementos del arreglo.

* asciiInt: Función que recibe un caracter (número en Ascii) y lo convierete a un entero restandole '0'.

* arrayAdd: Hará la suma de los elementos de un arreglo con un tamaño de 5, donde la suma de dichos valores se guadara en una variable result.

* intAscii: Función que recibe un entero a traves de la variable result y lo pasa a un caracter (Ascii) sumandole '0'.

* userOutput: Realiza una llamada el sistema por medio de los argumentos de write, para que se imprima en la terminal una vez que ya fue pasado de entero a ascii.

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



