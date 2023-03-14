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

<img width="238" alt="1" src="https://user-images.githubusercontent.com/109320578/224905897-cc3a08e6-b606-479f-af88-c833f3e59f07.png">

<img width="224" alt="2" src="https://user-images.githubusercontent.com/109320578/224905926-9b31c5ac-cb04-49a4-a269-fc9d84927338.png">

<img width="201" alt="3" src="https://user-images.githubusercontent.com/109320578/224905959-a4e4da01-0a7d-46a8-8d5c-8c16a9f81835.png">

<img width="209" alt="4" src="https://user-images.githubusercontent.com/109320578/224905969-e2a683b8-35bf-4f45-bdd5-45609c31d021.png">

<img width="234" alt="5" src="https://user-images.githubusercontent.com/109320578/224905992-72f69deb-949d-426a-99d3-6c4e182d34ed.png">

<img width="235" alt="6" src="https://user-images.githubusercontent.com/109320578/224906008-fbe61af9-6a50-431a-8ce1-a412c83dd193.png">



