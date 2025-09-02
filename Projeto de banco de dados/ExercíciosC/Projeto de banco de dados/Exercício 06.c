#include <stdio.h>

int main() {
    int notas[3][3]; // Matriz 3x3, ex: 3 linhas e 3 colunas.
    int *p = &notas[0][0]; // endereço d primeiro do elemento.
    int soma = 0; // variável para acumular a soma da diagonal principal

    for (int i = 0; i < 9; i++) { // for para preencher as 9 posições do vetor.
        printf("Digite a nota [%d][%d]: ", i/3, i%3); // dá a linha (ex: 0/3=0 = linha 0, 4/3=1 = linha 1), i%3 dá a coluna (resto da divisão).
        scanf("%d", (p+i)); // scan para armazenar.
    }

    printf("\nNotas:\n");
    for (int i = 0; i < 9; i++) {
        printf("%d ", *(p+i)); // Mostrar o valor da posição i.
        if ((i+1) % 3 == 0) printf("\n"); // Quebra a linha, formando a matriz 3x3, a cada 3 elementos.
    }

    for (int i = 0; i < 3; i++) {
        soma += *(p + i*3 + i);
    }

    printf("\nSoma da diagonal principal: %d\n", soma);
    return 0;
}

