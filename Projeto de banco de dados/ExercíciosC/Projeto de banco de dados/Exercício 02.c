#include <stdio.h>
int main () {
	int idade;
	int *p = &idade;
	
	
	printf("Digite sua idade: ");
	scanf("%d", &idade);
	
	printf("Sua idade e: %d\n", *p);
	printf("O endereço da idade e: %p\n", p);
	
	return 0;
}
