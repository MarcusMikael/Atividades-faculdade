#include <stdio.h>

int main() {
    float precos[5]; // Float para valores decimais.
    float *p; // Ponteiro para percorrer o vetor
    int i;

    // Leitura dos preços
    printf("Digite os precos de 5 produtos:\n");
    for (i = 0; i < 5; i++) { // for para percorrer
        printf("Produto %d: R$ ", i + 1);
        scanf("%f", &precos[i]); // Lê e armazena o preco
    }

    // ponteiros para mostrar os preços e os descontos
    printf("\nPrecos e descontos:\n");
    p = precos;

    for (i = 0; i < 5; i++) {
        printf("Produto %d: Precos sem desconto = R$ %.2f | Com 10%% de desconto = R$ %.2f\n",
               i + 1, *(p + i), *(p + i) * 0.9);
    }

    return 0;
}

