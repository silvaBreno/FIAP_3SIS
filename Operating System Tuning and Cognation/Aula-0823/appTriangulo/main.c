#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
#include <windows.h>
#include "triangulo.h"

#define FALSE   0
#define TRUE    1

typedef void (*Triangulo)(struct stTriangulo *);

int main()
{
    int triangulo = TRUE;
    char tipo[17];
    setlocale(LC_ALL, "");
    Triangulo _Triangulo;
    HINSTANCE hInstLibrary = LoadLibrary("dllTriangulo.dll");

    if (hInstLibrary)
    {
        _Triangulo = (Triangulo)GetProcAddress(hInstLibrary, "Triangulo");

        if (_Triangulo)
        {
            struct stTriangulo appTriangulo;
            appTriangulo.lado1 = 6;
            appTriangulo.lado2 = 8;
            appTriangulo.lado3 = 10;
            _Triangulo(&appTriangulo);

            switch (appTriangulo.tipo)
            {
            case NAO_EH_TRI:
                triangulo = FALSE;
                break;

            case ESCALENO:
                strcpy(tipo, "escaleno");
                break;

            case ISOSCELES:
                strcpy(tipo, "is�sceles");
                break;

            case EQUILATERO:
                strcpy(tipo, "equil�tero");
                break;

            default:
                triangulo = FALSE;
                break;
            }

            if (triangulo == TRUE)
            {
                printf("tri�ngulo: %s\n", tipo);
                printf("per�metro= %d\n", appTriangulo.perimetro);
                printf("semiper�metro= %4.1f\n", appTriangulo.semiperimetro);
                printf("�rea= %4.1f\n" , appTriangulo.area);
            }
        }

        FreeLibrary(hInstLibrary);
    }
    else
    {
        printf("ERRO ao carregar a DLL!\n");
    }

    return (0);
}
