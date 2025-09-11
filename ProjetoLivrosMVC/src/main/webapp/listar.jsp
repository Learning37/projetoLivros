<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Livro" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Livros</title>
    <link rel="stylesheet" type="text/css" href="css/estiloIndex.css">
    <style>
        .lista-livros {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            margin-top: 30px;
        }
        .livro-card {
            background-color: #fff;
            padding: 20px;
            width: 80%;
            max-width: 600px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .livro-card h2 {
            margin: 0 0 10px 0;
            color: #2c3e50;
        }
        .livro-card p {
            margin: 5px 0;
        }
        .botoes-livro {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
        .botoes-livro a {
            text-decoration: none;
            color: white;
            background-color: #3498db;
            padding: 8px 15px;
            border-radius: 5px;
            transition: 0.3s;
        }
        .botoes-livro a:hover {
            background-color: #2980b9;
        }
        .voltar {
    		display: inline-block;
    		margin-top: 20px;
    		padding: 10px 20px;
    		background-color: #27ae60;
    		color: white;
    		border-radius: 5px;
    		text-decoration: none;
		}
		.voltar:hover {
    		background-color: #1e8449;
		}
    </style>
</head>
<body>
    <h1>📚 Lista de Livros</h1>

    <div class="lista-livros">
        <%
            List<Livro> livros = (List<Livro>) request.getAttribute("livros");
            if (livros != null && !livros.isEmpty()) {
                for (Livro livro : livros) {
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
   				onclick="return confirm('Tem certeza que deseja excluir este livro?');">&#x1F5D1; Excluir</a>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <p>Nenhum livro cadastrado.</p>
        <%
            }
        %>
    </div>

    <div style="text-align:center; margin-bottom:15px;">
        <a href="index.jsp" class="voltar"> &#x21A9; Voltar ao menu</a>
    </div>
</body>
</html>
