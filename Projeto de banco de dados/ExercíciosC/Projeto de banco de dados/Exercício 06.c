#include <stdio.h>

int main() {
    int notas[3][3]; // Matriz 3x3, ex: 3 linhas e 3 colunas.
    int *p = &notas[0][0]; // endere�o d primeiro do elemento.
    int soma = 0; // vari�vel para acumular a soma da diagonal principal

    for (int i = 0; i < 9; i++) { // for para preencher as 9 posi��es do vetor.
        printf("Digite a nota [%d][%d]: ", i/3, i%3); // d� a linha (ex: 0/3=0 = linha 0, 4/3=1 = linha 1), i%3 d� a coluna (resto da divis�o).
        scanf("%d", (p+i)); // scan para armazenar.
    }

    printf("\nNotas:\n");
    for (int i = 0; i < 9; i++) {
        printf("%d ", *(p+i)); // Mostrar o valor da posi��o i.
        if ((i+1) % 3 == 0) printf("\n"); // Quebra a linha, formando a matriz 3x3, a cada 3 elementos.
    }

    for (int i = 0; i < 3; i++) {
        soma += *(p + i*3 + i);
    }

    printf("\nSoma da diagonal principal: %d\n", soma);
    return 0;
}

