package calculadora.bhaskara;
import java.util.Scanner;

public class Bhaskara {

	public static void main(String[] args) {
		Scanner scanner = new Scanner (System.in);
		
		// Coletar valores de a,b e c
		System.out.print("Valor de a: ");
		double a = scanner.nextDouble();
		
		System.out.print("Valor de b: ");
		double b = scanner.nextDouble();
		
		System.out.print("Valor de c: ");
		double c = scanner.nextDouble();
		
		double valorDelta = (b * b) - (4 * a * c);
		
		// Verificar se existe raízes reais
		if (valorDelta < 0) {
			System.out.println("Não possui raízes reais");
		} else {
			double x1 = (-b + Math.sqrt(valorDelta)) / (2 * a);
			double x2 = (-b - Math.sqrt(valorDelta)) / (2 * a);
			
			// Exibir resultados de x1 e x2
			System.out.println(" X1 = " + x1);
			System.out.println(" X2 = " + x2);			
		}
		
		scanner.close();
	}

}
