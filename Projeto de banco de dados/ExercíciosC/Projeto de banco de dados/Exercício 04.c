#include <stdio.h>
#include <stdlib.h>

int main() {
    int x, soma = 0; // x para quardar a quantidade de funcionarios
    printf("Quantos funcionarios? ");
    scanf("%d", &x);

    int *horas = (int*) malloc(x * sizeof(int));
// malloc reserva 'n * sizeof(int)' bytes na memória
    for (int i = 0; i < x; i++) {
        printf("Horas do funcionario %d: ", i+1);
        scanf("%d", (horas + i));  // *(horas + i) acessa o valor armazenado naquela posição
        soma += *(horas + i); // acumula o total de horas
    }

    printf("\nTotal de horas no mes: %d\n", soma);

    free(horas); // Libera a memória que foi alocada dinamicamente
    return 0;
}

