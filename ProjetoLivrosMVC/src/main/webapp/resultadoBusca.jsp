<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Livro" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultados da Busca</title>
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>
<body>
    <h1>📚 Resultados da Busca</h1>

    <div class="lista-livros">
        <%
        	@SuppressWarnings("unchecked")
            List<Livro> resultados = (List<Livro>) request.getAttribute("resultados");
            if (resultados != null && !resultados.isEmpty()) {
                for (Livro livro : resultados) {
        %>
        <div class="livro-card">
            <h2><%= livro.getTitulo() %></h2>
            <p><strong>Autor:</strong> <%= livro.getAutor() %></p>
            <p><strong>Ano:</strong> <%= livro.getAno() %></p>
            <p><strong>Gênero:</strong> <%= livro.getGenero() %></p>
            <p><strong>Sinopse:</strong> <%= livro.getSinopse() %></p>
            <div class="botoes-livro">
                <a href="LivroServlet?acao=editar&id=<%= livro.getId() %>">&#x270F; Editar</a>
                <a href="LivroServlet?acao=excluir&id=<%= livro.getId() %>" 
                   onclick="return confirm('Tem certeza que deseja excluir este livro?');">
                   &#x1F5D1; Excluir
                </a>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <p>Nenhum livro encontrado para o termo pesquisado.</p>
        <%
            }
        %>
    </div>

    <div style="display:flex; justify-content:center; gap:15px; margin-top:25px;">
        <a href="buscar.jsp" class="botaoVoltar">&#x1F50D; Nova busca</a>
        <a href="index.jsp" class="botaoVoltar">&#x21A9; Voltar ao menu</a>
    </div>
</body>
</html>
