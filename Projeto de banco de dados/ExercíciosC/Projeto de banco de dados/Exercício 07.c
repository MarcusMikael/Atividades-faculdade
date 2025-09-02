#include <stdio.h>

int main() {
    int pontos[4][4]; // Matriz 4x4
    int *p = &pontos[0][0];
    int pares=0, impares=0; // Funciona como o contador
	int somaJog[4]={0}, somaSet[4]={0}; // Vetores para acumular a soma

    // entrada
    for (int i = 0; i < 16; i++) { // for para prencher a matriz.
        printf("Digite pontos [%d][%d]: ", i/4, i%4); // linha/coluna
        scanf("%d", (p+i));
    }

    // mostrar matriz + contagem pares/impares
    printf("\nMatriz de pontos:\n");
    
    for (int i = 0; i < 16; i++) {
        printf("%d ", *(p+i)); // Mostrar cada valor da matriz.
        if (*(p+i) % 2 == 0) pares++; else impares++; // Faz a verificação com o if e else para separar em pares e impares.
        somaJog[i/4] += *(p+i); // Soma os pontos dos jogadores (linha)
        somaSet[i%4] += *(p+i); // Soma os pontos do set (coluna)
        if ((i+1)%4==0) printf("\n"); // Quebra de linha para formatar a matriz, a cada 4 valores
    }

    printf("\nPares: %d | Impares: %d\n", pares, impares); // Mostra a contagem de pontos

    // jogador com maior pontuação
    int maxJog = 0;
    
    for (int i = 1; i < 4; i++) 
        if (somaJog[i] > somaJog[maxJog]) maxJog = i; // verifica o jogador ocm mais pontos.

    printf("Jogador com maior pontuacao: %d (total %d)\n", maxJog+1, somaJog[maxJog]);

    // set mais disputado
    int maxSet = 0;
    
    for (int i = 1; i < 4; i++)
        if (somaSet[i] > somaSet[maxSet]) maxSet = i;

    printf("Set mais disputado: %d (total %d)\n", maxSet+1, somaSet[maxSet]);

    // média por jogador
    for (int i = 0; i < 4; i++) {
        printf("Media jogador %d: %.2f\n", i+1, somaJog[i]/4.0); // Vai calcular a media de pontos dividindo pelos sets.
    }

    // jogador mais regular
    int regular=0, menorDif=9999;
    
    for (int i=0; i<4; i++){
        int maior=pontos[i][0], menor=pontos[i][0];
        
        // maior e menor pontuação do jogador
        for(int j=1; j<4; j++){
            if (pontos[i][j]>maior) maior=pontos[i][j];
            if (pontos[i][j]<menor) menor=pontos[i][j];
        }
        // diferença entro o maior e o menor (pontuação)
        int dif=maior-menor;
        if (dif<menorDif){
            menorDif=dif;
            regular=i;
        }
    }
    printf("Jogador mais regular: %d\n", regular+1);

    return 0;
}

