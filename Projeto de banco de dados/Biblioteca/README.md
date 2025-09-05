# 📚 Sistema de Biblioteca – SQL

Este projeto implementa um **sistema de biblioteca** utilizando PostgreSQL, com **procedures, views e functions** para automatizar operações e facilitar consultas.  

---

## 🔎 Conceitos utilizados

### ✅ Procedures
São blocos de código armazenados no banco que podem executar várias instruções SQL.  
Foram usadas aqui para:  
- **Cadastrar usuários** (`cadastrar_usuario`)  
- **Cadastrar livros** (`cadastrar_livro`)  
- **Registrar devoluções** (`registrar_devolucao`)  
- **Excluir usuários e seus empréstimos** (`excluir_usuario`)  

---

### ✅ Views
São **consultas salvas** que funcionam como tabelas virtuais.  
Foram usadas aqui para:  
- `livros_com_autores`: mostra livros e seus respectivos autores  
- `usuarios_com_emprestimos`: lista usuários com os livros emprestados  
- `emprestimos_em_aberto`: exibe apenas empréstimos não devolvidos  
- `historico_emprestimo`: histórico de todos os empréstimos realizados  
- `qtd_emprestimos_por_usuario`: total de empréstimos por usuário  
- `livros_mais_recentes`: livros publicados após 1950  
- `usuarios_com_mais_de_um_emprestimo`: identifica usuários que fizeram mais de um empréstimo  

---

### ✅ Functions
São funções que **retornam valores** a partir de regras no banco.  
Foram usadas aqui para:  
- `autor_do_livro(p_id)`: retorna o autor de um livro  
- `livro_emprestado(p_id)`: verifica se o livro está emprestado ou disponível  
- `usuario_com_atraso(p_id)`: verifica se o usuário possui livros atrasados  
- `total_gasto_usuario(p_id)`: soma os valores gastos pelo usuário em empréstimos  

---

## ⚙️ Execução do Projeto

### 🔧 Requisitos
- Banco de dados: **PostgreSQL**  
- Ferramenta recomendada: **pgAdmin**  

### 📌 Ordem de execução dos scripts
1. Criar as tabelas (`autor`, `livro`, `usuario`, `emprestimo`)  
2. Inserir os dados iniciais (autores, livros, usuários e empréstimos)  
3. Criar as **procedures**  
4. Criar as **views**  
5. Criar as **functions**  
6. Testar os exemplos de chamadas (`CALL` e `SELECT`)  

---

## 🗂️ Estrutura do Projeto

📂 sistema-biblioteca
┣ 📜 biblioteca.sql → Contém todas as tabelas, inserts, procedures, views e functions
┣ 📜 README.md → Explicação do projeto e instruções
┗ 📜 biblioteca.drawio.pdf → Diagrama do banco de dados

---

## 🖼️ DER – Diagrama Entidade Relacionamento

O diagrama mostra as entidades Autor, Livro, Usuário e Empréstimo, bem como seus relacionamentos.
