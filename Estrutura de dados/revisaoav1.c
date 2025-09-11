# include <stdio.h>
# include <stdlib.h>
// 1 exercicio
/*int main () {
	int cofrinho = 100;
	int *p = &cofrinho;
	
	
	printf("Valor guardado do cofrinho = %d\n ", *p);
	printf("Endereco onde esta armazenado = %p\n ", p);
	
	return 0;
}*/
// 2 exercicio
/*int main() {
	
	int idade;
	int *p = &idade;
	
	printf("Digite sua idade: ");
	scanf("%d", &idade);
	
	printf("Sua idade e: %d\n ", *p);
	printf("O endereco da variavel idade e: %p\n ", p);
	
	return 0;
}*/

/*int main() {
	
	float v[5];
	float *p = &v;
	
	printf("Digite o preco de 5 produtos: \n");
	for(int i = 0; i < 5; i++){
		printf("Valor do produto %d: ", i+1);
		scanf("%f", &v[i]);
	}
	printf("\n Valores reais dos Produtos \n");
	for (int i = 0; i < 5; i++){
		printf("Valor final do produto %d: %.1f\n ", i+1, *(p+i));
	}
	
	
	return 0;
}*/


/*int main() {
	
	int n, total = 0;
	int *p;
	
	printf("Quantos funcionarios: \n");
	scanf("%d", &n);
	
	p = (int*) malloc(n * sizeof(int));
	if (p == NULL) {
		printf("Erro de alocacao");
		return 1;
	}
// Preencher os vetores

for(int i = 0; i < n; i++){
	printf("Horas do funcionario %d: ", i+1);
	scanf("%d", (p+i));
}

for (int i = 0; i < n; i++){
	total += *(p+i);
}

printf("Total de horas trabalhadas: %d\n ", total);	

free (p);
	return 0;
}*/


/*int main() {
	
	float v[6];
	float *p = &v;
	
	printf("Digite 6 notas: \n");
	for (int i = 0; i < 6; i++){
		printf("Nota %d\n", i+1);
		scanf("%f", (p+i));
	}
	
	printf("\nNotas invertidas:\n");
    for (int i = 5; i >= 0; i--) { // Int i = 5 para começar da ultima nota.
        printf("%.1f ", *(p+i));
    }
	
	
	return 0;
}*/

/*int main () {
	float v[3][3];
	float *p = &v;
	
	printf("Digite as notas: ");
	for (int i = 0; i < 9; i++){
		printf("Digite a nota %d\n:", i+1);
		scanf("%.1f", &v[i],)
	}
	
	
	
	
	return 0;
}*/



//                          ALOCAÇÕES DE MEMORIA 


/*int main() {
	
	int n;
	int *p;
	
	printf("Digite a quantidade de jogadores: ");
    scanf("%d", &n);
	
	p = (int*) malloc(n * sizeof(int));
	if (p == NULL) {
		printf("Erro ao alocar memoria \n");
		return 1;
	}
	
	for (int i = 0; i < n; i++){
		printf("Pontuacao do jogado %d\n", i+1);
		scanf("%d", &p[i]);
	}
	
	int max = p[0], min = p[0], soma = 0;
	for (int i = 0; i < n; i++){
		if (p[i] > max) max = p[i];
		if (p[i] < min) min = p[i];
		soma += p[i];
	}
	
	printf("\n Pontuação Maxima: %d\n", max);
	printf("\n Pontuacao Minima: %d\n", min);
	printf("\n Media das pontuacoes: %.2f\n", (float)soma / n);
	
	free(p); // Liberacao memoria;
	
	return 0;
	
}*/

/*int main() {
    int v;       // quantidade de livros TEM que ser int
    float *p;

    printf("Digite a quantidade de livros: ");
    scanf("%d", &v);

    p = (float*) malloc(v * sizeof(float));
    if (p == NULL) {
        printf("Erro ao alocar memoria\n");
        return 1;
    }

    // Preencher vetor
    for (int i = 0; i < v; i++) {
        printf("Digite o preco do livro %d: ", i + 1);
        scanf("%f", &p[i]);
    }

    // Calcular soma
    float soma = 0;
    for (int i = 0; i < v; i++) {
        soma += p[i];
    }

    float media = soma / v;

    printf("\n--- Resultados ---\n");
    printf("Valor total da compra: R$ %.2f\n", soma);
    printf("Valor medio por livro: R$ %.2f\n", media);

    // Liberar memoria
    free(p);

    return 0;
}*/

#include <stdio.h>
#include <stdlib.h>

/*int main() {
    int n;
    int *p;

    printf("Digite a quantidade de personagens da partida: ");
    scanf("%d", &n);

    p = (int*) malloc(n * sizeof(int));
    if (p == NULL) {
        printf("Erro ao alocar memoria\n");
        return 1;
    }

    // Ler vidas dos personagens
    for (int i = 0; i < n; i++) {
        printf("Quantidade de vida do personagem %d: ", i + 1);
        scanf("%d", &p[i]);
    }

    // Calcular soma
    int soma = 0;
    for (int i = 0; i < n; i++) {
        soma += p[i];
    }

    // Média real
    float media = (float) soma / n;

    // Exibir resultados
    printf("\n--- Resultados ---\n");
    printf("Total de vidas: %d\n", soma);
    printf("Media de vidas por personagem: %.2f\n", media);

    free(p);
    return 0;
}*/


int main() {
	
	int n;
	float *p;
	
	printf("Quantos niveis o jogador completou?");
	scanf("%d", &n);
	
	p = (float*) malloc(n * sizeof(float));
	if (p == NULL) {
		printf("Erro ao alocar memoria");
	}
	
	for (int i = 0; i < n; i++){
		printf("Tempo de cada nivel %d: ", i+1);
		scanf("%f", &p[i]);
	}
	
	float maisRapido = p[0];
	float maisLento = p[0];
	float soma = p[0];
	
	for (int i = 1; i < n; i++) {
        if (p[i] < maisRapido) maisRapido = p[i];
        if (p[i] > maisLento)  maisLento  = p[i];
        soma += p[i];
    }

    float media = soma / n;

    // Resultados
    printf("\n--- Resultados ---\n");
    printf("Nivel mais rapido: %.2f minutos\n", maisRapido);
    printf("Nivel mais lento : %.2f minutos\n", maisLento);
    printf("Tempo medio por nivel: %.2f minutos\n", media);

    free(p);
	
	return 0;
}
