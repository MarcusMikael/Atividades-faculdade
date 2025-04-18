// Violação do SRP:

class Pedido { 
    public void adicionarItem(String item) { 
        System.out.println("Item adicionado: " + item); 
    } 
 
    public void calcularTotal() { 
        System.out.println("Calculando total..."); 
    } 
 
    public void gerarNotaFiscal() { 
        System.out.println("Nota Fiscal gerada."); 
    } 
 
    public void salvarNoBanco() { 
        System.out.println("Pedido salvo no banco de dados."); 
    } 
}