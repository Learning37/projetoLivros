<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Livro" %>
<%
    // Recupera o livro enviado pelo Servlet (pode ser null se for cadastro)
    Livro livro = (Livro) request.getAttribute("livro");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= (livro != null) ? "Editar Livro" : "Cadastrar Livro" %></title>
<link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>
<body>
	<h1><%= (livro != null) ? "&#x270F; Editar Livro" : "📖 Cadastrar Novo Livro" %></h1>

    <form action="LivroServlet" method="post">
    	<!-- Hidden ID para edição -->
        <input type="hidden" name="id" value="<%= (livro != null) ? livro.getId() : "" %>">
        
        <label for="titulo">Título:</label><br>
        <input type="text" id="titulo" name="titulo" value="<%= (livro != null) ? livro.getTitulo() : "" %>" required>
		<br><br>
		
        <label for="autor">Autor:</label><br>
        <input type="text" id="autor" name="autor" value="<%= (livro != null) ? livro.getAutor() : "" %>" required>
		<br><br>
		
        <label for="ano">Ano de Publicação:</label><br>
        <input type="number" id="ano" name="ano" value="<%= (livro != null) ? livro.getAno() : "" %>" required>
		<br><br>
		
        <label for="genero">Gênero:</label><br>
        <input type="text" id="genero" name="genero" value="<%= (livro != null) ? livro.getGenero() : "" %>">
		<br><br>
		
        <label for="sinopse">Sinopse:</label><br>
        <textarea id="sinopse" name="sinopse" rows="5" cols="40"><%= (livro != null) ? livro.getSinopse() : "" %></textarea>
        <br><br>

        <button type="submit" class="botaoForm"><%= (livro != null) ? "Atualizar" : "Cadastrar" %></button>
    </form>

    <br>
    <div style="text-align:center; margin-bottom:15px;">
    	<a href="index.jsp" class="botaoVoltar"> &#x21A9; Voltar ao menu</a>
    </div>
</body>
</html>