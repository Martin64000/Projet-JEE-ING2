<%@ page pageEncoding="UTF-8" %>
<%@ include file="taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <style type="text/css">
        <%@ include file="css/Header.css" %>
        <%@ include file="css/accueil.css" %>
        <%@ include file="css/profil.css" %>
        <%@ include file="css/menuDeroulant.css" %>
        <%@ include file="css/boutique.css" %>
    </style>
    <title>Votre panier</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<h2 class="h2">Voici votre panier</h2>

<table>
    <thead>
    <tr>
        <th>Titre</th>
        <th>Auteur</th>
        <th>Tome</th>
        <th>Genre</th>
        <th>Editeur</th>
        <th>Supprimer</th>
    </tr>
    </thead>
    <tbody>
        <c:if test="${sessionScope.panier.size() == 0}" var="booleen">
            <tr>
                <td colspan="6">Votre panier est vide</td>
            </tr>
        </c:if>
        <c:forEach items="${sessionScope.panier}" var="m" varStatus="test">
            <tr>
                <td><span> <c:out value="${m.title}"/> </span></td>
                <td><span> <c:out value="${m.author}"/> </span></td>
                <td><span> <c:out value="${m.number}"/> </span></td>
                <td><span> <c:out value="${m.gender}"/> </span></td>
                <td><span> <c:out value="${m.editor}"/> </span></td>
                <td><span> <a href="/deleteFromCart/<c:out value='${sessionScope.user.id}'/>/<c:out value='${test.index}'/>"><button>Supprimer le produit</button></a> </span></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>