#include <stdio.h>

int main() {
	int cofrinho = 100;
	int *p = &cofrinho; // Declara��o para o ponteiro
	
	printf("Valor do cofrinho: %d \n", *p);
	printf("Endereco do cofrinho: %p \n", p );
	
	return 0;
}
