// See https://aka.ms/new-console-template for more information
Console.WriteLine("Hello, World!");


int idade = 10;

Incrementar(idade);
Console.WriteLine("Após o método" + idade);

IncrementarReferencial(ref idade);
Console.WriteLine("Após o método" + idade);

void Incrementar(int idade) 
{
    idade = idade + 1;
    Console.WriteLine("Incremento por valor: " + idade);
}

void IncrementarReferencial(ref int idade) 
{
    idade = idade + 1;
    Console.WriteLine("Incremento por referencia: " + idade);
}

