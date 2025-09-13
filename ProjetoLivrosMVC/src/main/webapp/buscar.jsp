<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buscar Livro</title>
<link rel="stylesheet"  href="css/estilo.css">
</head>
<body>
	<h1>🔍 Buscar Livro</h1>
    
    <form action="LivroServlet" method="get">
        <label for="termo">Título ou Autor:</label><br>
        <input type="text" id="termo" name="termo" required>
        
        	<div style="text-align:center; margin-top:20px;">
        		<button type="submit" class="botaoForm" >Pesquisar</button>
        	</div>
        <input type="hidden" name="acao" value="buscar">
    </form>
    
    <br>
    <div style="text-align:center; margin-bottom:15px;">
        <a href="index.jsp" class="botaoVoltar"> &#x21A9; Voltar ao menu</a>
    </div>
</body>
</html>