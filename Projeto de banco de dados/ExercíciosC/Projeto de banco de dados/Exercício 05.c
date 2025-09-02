#include <stdio.h>

int main() {
    float notas[6];
    float *p = notas;

    for (int i = 0; i < 6; i++) {
        printf("Nota do aluno %d: ", i+1);
        scanf("%f", (p+i)); // %f por ser float.
    }

    printf("\nNotas invertidas:\n");
    for (int i = 5; i >= 0; i--) { // Int i = 5 para começar da ultima nota.
        printf("%.2f ", *(p+i));
    }

    return 0;
}

