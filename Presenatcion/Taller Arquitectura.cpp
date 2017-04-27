/*
1 Hacer un programa que calcule la multiplicación de dos enteros sin signo usando solo
sumas.
2 Realice un programa que calcule la potencia de dos números enteros sin signo
realizando llamados a la función desarrollada en el punto 1.
3 Realice un programa que calcule un polinomio de grado n, en donde los coeficientes
del polinomio se encuentran almacenados en un vector k de n+1 posiciones, de la
siguientes forma:
En donde el ki se encuentra en la posición k[i] del vector k.
4 Realice un programa que calcule el factorial de un número entero sin signo
5 Realice un programa calcule la división entera entre dos números enteros.


NOTA: ?Recuerde que se deben realizar llamados a funciones para cada punto y se deben usar
sumas sucesivas y restas sucesivas donde sea necesario. Adicionalmente crear un repositorio
puede ser en github en donde colocará cada uno de los códigos fuente solicitados. Deberá
agregar al profesor como colaborador para realizar el proceso de revisión. El taller deberá ser
enviado antes de las 6 de la tarde del día martes 7 de Febrero. No usar recursión.*/
#include <stdlib.h>
#include <iostream>

using namespace std;

int MultiSuma(int a, int b)
{
    int aux=a;
    for(int i=1; i<b;i++){
            a=a+aux;
            }
            return a;
}

int PotenSuma(int a,int b)
{  int resultado,aux=a;
    for(int i=1;i<b;i++){
           aux=MultiSuma(aux,a);
           resultado=aux;    
    }
    return resultado;
}

void Menu(){
     cout<<"\t\nMENU DEL PROGRAMA ";
     cout<<"\n1. Multiplicar dos numeros ";
     cout<<"\n2.Elevear un numero a una potencia  ";
     cout<<"\n3.polinomio de grado n ";
     cout<<"\n4.Salir ";
     }
 int vector[] = {1,2,3,4,5,6,7,8,9};  
 int funcionPolinomio(int k[],int Valorx,int grado)
 {  int gradoaux=grado-1,resultado=0;
     for(int i=0;i<grado;i++){
            resultado=resultado+ MultiSuma(k[i],PotenSuma(Valorx,gradoaux));
             gradoaux--;
             }
             return resultado;
 }
 

int main()
{
    int opcion,a,b,c,d;
    do{
        Menu();
        cin>>opcion;
        switch(opcion){
            
            case(1):
                   cout<<"\nIngrese un numero  :";
            cin>>a;
            cout<<"Ingrese otro  numero  :";
            cin>>b;
            c=MultiSuma(a,b);
             cout<<"El resultado es..."<<c;
             break;
             case (2):
             cout<<"Ingrese un numero  :";
            cin>>a;
            cout<<"Ingrese otro  numero  :";
            cin>>b;
            c=PotenSuma(a,b);
             cout<<"El resultado es..."<<c;
             break;
             case (3):
            cout<<"Ingrese el valor de x  :";
            cin>>a;
            cout<<"ingrese el grado del polinomio :";
            cin>>b;
            c=funcionPolinomio(vector,a,b);
            cout<<"El resultado es..."<<c;
            break;
             default:
                     break;
                 }
        /*int a,b,c=0;
        cout<<"Ingrese un numero  :";
        cin>>a;
        cout<<"Ingrese otro  numero  :";
        cin>>b;
        c=MultiSuma(a,b);
        c=PotenSuma(a,b);
        cout<<"El resultado es..."<<c;*/
    }while(opcion=!4);
    system("pause");
    return 0;
    
}

