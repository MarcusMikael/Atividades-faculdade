package revisão;
import java.util.Scanner;
import java.util.ArrayList;
public class Main {
	
	
	// Aluno: Marcus Mikael Rodrigues Vieira

	public static void main(String[] args) {
				// Questão 01 
		/*Scanner scanner = new Scanner(System.in);
		System.out.println("Digite seu nome: ");
		String nome = scanner.nextLine();
		
		System.out.println("Digite sua idade: ");
		int idade = scanner.nextInt();
		
		System.out.println("Digite sua altura: ");
		double altura = scanner.nextDouble();
		
		System.out.println("Digite seu sexo: ");
		char sexo = scanner.next().charAt(0);
				
				//int idade =	25;
				//double altura = 1.75;
				//char sexo = 'M';
				//String nome = "João";
		
		        System.out.println("Nome: " + nome);
				System.out.println("Idade: " + idade + " Anos");
				System.out.println("Altura: " + altura);
				System.out.println("Sexo: " + sexo);
				
				scanner.close();*/		
				
				// Questão 02
				
				/*Scanner scanner = new Scanner(System.in);
				System.out.println("Digite sua idade: ");
				int idade = scanner.nextInt();
				
				if (idade >= 18) {
					System.out.println("Voçê pode dirigir.");
				} else {
						System.out.println("Voçê não pode dirigir!");
						
						scanner.close();
					}*/
				
				// Questão 03
				/*Scanner scanner = new Scanner(System.in);
				System.out.println("Digite um numero de 1 a 7: ");
				int numero = scanner.nextInt();
				
				switch(numero) {
				case 1:
					System.out.println("Dia da semana: Domingo");
					break;
				case 2:
					System.out.println("Dia da semana: Segunda-feira");
					break;
				case 3:
					System.out.println("Dia da semana: Terça-feira");
					break;
				case 4:
					System.out.println("Dia da semana: Quarta-feira");
					break;
				case 5:
					System.out.println("Dia da semana: Quinta-feira");
					break;
				case 6:
					System.out.println("Dia da semana: Sexta-feira");
					break;
				case 7:
					System.out.println("Dia da semana: Sábado");
					break;
					default:
						System.out.println("Opção inválida");
					
					scanner.close();
				}*/
				
				// Questão 04
				/*Scanner scanner = new Scanner(System.in);
				System.out.println("Digite o valor de X: ");
				int x = scanner.nextInt();
				System.out.println("Digite o valor de Y: ");
				int y = scanner.nextInt();
				
				for ( int i = x; i <= y; i++)
				{ 
					if (i % 2 == 0) {
						System.out.println(i);
					}
				}
				scanner.close();*/
				
				// Questão 05
				/*Scanner scanner = new Scanner(System.in);
				System.out.println("Digite o valor de X: ");
				int x = scanner.nextInt();
				System.out.println("Digite o valor de Y: ");
				int y = scanner.nextInt();
				
				int soma = 0;
				while (x <= y) {
					soma += x;
					x++;
				}
				System.out.println("Soma: " + soma);
				scanner.close();*/
				
				// Questão 06
				
		/*int[] numeros = {10, 5, 8, 20, 3};
        int maioresQue7 = 0;

        System.out.println("Números maiores que 7:");

        for (int num : numeros) {
            if (num > 7) {
                System.out.println(num);

                if (num % 2 == 0) {
                    maioresQue7++; 
                }
            }
        }

        System.out.println("Quantidade de números pares maiores que 7: " + maioresQue7);*/
  
				
				// Questão 07
				
		/*String[] frutas = {"Maçã", "Banana", "Laranja", "Abacaxi", "Melancia"};

        for (String fruta : frutas) {
            switch (fruta) {
                case "Maçã":
                case "Melancia":
                    System.out.println("Frutas Vermelhas: " + fruta);
                    break;
                case "Banana":
                    System.out.println("Frutas Amarelas: " + fruta);
                    break;
                case "Laranja":
                    System.out.println("Fruta Cítrica: " + fruta);
                    break;
                default:
                    System.out.println("Outras Frutas: " + fruta);
                    break;
            }
        }*/
		
		//Questão 08
		
		/*ArrayList<Integer> numeros = new ArrayList<>();
		numeros.add(12);
		numeros.add(9);
		numeros.add(7);
		numeros.add(20);
		numeros.add(25);
		
		int maioresQue10 = 0;
		int multiplosDe5 = 0;
		
		for(int numero: numeros) {
			if(numero > 10) {
				maioresQue10 += numero;
			}
			if (numero % 5 == 0) {
				multiplosDe5++;
			} 		
		}
		System.out.println("Soma dos números maiores que 10: " + maioresQue10);
		System.out.println("Contagem dos números múltiplos de 5: " + multiplosDe5);*/
		
		// Questão  09
		
		 /*ArrayList<String> alunos = new ArrayList<>();
		 alunos.add("Ana");
		 alunos.add("Roberto");
		 alunos.add("Luiza");
		 alunos.add("João");
		 
		 int i = 0;
		 
		 while (i < alunos.size()) {
			 String nome = alunos.get(i);
			 if (nome.length() > 5) {
				 System.out.println("Nomes com mais de 5 letras: " + nome);
			 }
			 i++;
			 
		 }*/
		
		// Questão 10
		
		/* ArrayList<Integer> notasAlunos = new ArrayList<>();
	        notasAlunos.add(90);
	        notasAlunos.add(70);
	        notasAlunos.add(50);
	        notasAlunos.add(40);

	        for (int notas : notasAlunos) {

	            if (notas >= 90) {
	                System.out.println("Nota: " + notas + " - Aprovado com excelência");
	            } else if (notas >= 70) {
	                System.out.println("Nota: " + notas + " - Aprovado");
	            } else if (notas >= 50) {
	                System.out.println("Nota: " + notas + " - Recuperação");
	            } else {
	                System.out.println("Nota: " + notas + " - Reprovado");
	            }
	        }
	    }
	}*/
	}
}
		
