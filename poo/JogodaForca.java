package Jogo;
// Importaçoes do que vai precisar
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Random;
// Class do jogo
public class JogodaForca {

	public static void main(String[] args) {
		// Lista de palavras para serem descobertas
		String[] palavras = {"marcus", "forca", "programcao"};
		// Uso do random para escolher uma palavra aleatoria
		Random random = new Random();
		String PalavraEscolhida = palavras[random.nextInt(palavras.length)];
		// Converter a palavra escolhida
		char[] palavraArray = new char[PalavraEscolhida.length()];
		for (int i = 0; i < PalavraEscolhida.length(); i++) {
			palavraArray[i] = '_';
		}
		
		// Armazenar letras já tentandas
		ArrayList<Character> letrasTentadas = new ArrayList<>();
		int tentativas = 6;
		
		Scanner scanner = new Scanner (System.in);
		while (tentativas > 0) {
			System.out.println("Palavra: " + String.valueOf(palavraArray));
			System.out.println("Tentativas restantes: " + tentativas);
			System.out.print("Letras já tentadas: ");
			System.out.println(letrasTentadas);
			
			System.out.print("Digite uma letra: ");
			char letra = scanner.next().charAt(0);
			
			if (letrasTentadas.contains(letra)) {
				System.out.println("Você ja tentou essa letra.");
				continue;
			}
			letrasTentadas.add(letra);
			boolean acertou = false;
			for (int i = 0; i < PalavraEscolhida.length(); i++) {
				if (PalavraEscolhida.charAt(i) == letra) {
					palavraArray[i] = letra;
					acertou = true;
				}
			}
			
			if (!acertou) {
				tentativas--;
				System.out.println("A letra " + letra + " não está na palavra. ");
				
			}
			
			if (String.valueOf(palavraArray).equals(PalavraEscolhida)) {
				System.out.println("Parabéns! Você adivinhou a palavra: " + PalavraEscolhida);
				break;
			}	
		}
		
		if (tentativas == 0) {
			System.out.println("Você perdeu! A palavra era: " + PalavraEscolhida);
			
		}
		
		scanner.close();
	}

}
