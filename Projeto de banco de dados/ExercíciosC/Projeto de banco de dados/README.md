# 📌 Trabalho – Ponteiros em C

Este repositório contém a resolução de uma lista de exercícios sobre ponteiros em C, feita para a disciplina de **Estrutura de Dados**.

---

## 🔎 O que são ponteiros?

Em C, um ponteiro é uma variável que armazena o endereço de memória de outra variável.  
Com eles podemos:

- acessar diretamente valores na memória;
- manipular vetores e matrizes de forma eficiente;
- trabalhar com estruturas dinâmicas (como listas, filas e pilhas).

### Exemplo simples

```c
int x = 10;     // variável comum
int *p = &x;    // ponteiro guarda o endereço de x

printf("%d\n", *p); // mostra 10 (valor de x)
📂 Estrutura do projeto
ex1.c → Cofrinho (variável inteira e ponteiro)

ex2.c → Idade do aluno (entrada do usuário e ponteiro)

ex3.c → Preços de produtos (vetor, laço e desconto)

ex4.c → Horas trabalhadas (vetor dinâmico com malloc)

ex5.c → Notas de alunos (inversão de vetor com ponteiro)

ex6.c → Matriz 3x3 de notas (acesso e soma da diagonal)

ex7.c → Partida de vôlei (matriz 4x4 e estatísticas)

🛠 Como compilar
Cada exercício é independente. Para compilar:

bash
Copiar código
gcc ex1.c -o ex1
./ex1
(Substitua ex1 pelo número do exercício desejado.)

👨‍🏫 Autor
Marcus Mikael Rodrigues Vieira
Disciplina: Estrutura de Dados
Professor: Anderson Costa
