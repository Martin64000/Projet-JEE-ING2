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
  <title>Nos mangas</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<h2 class="h2">Liste des mangas</h2>
<table class="table">
  <thead>
  <tr>
    <th>Titre</th>
    <th>Auteur</th>
    <th>Tome</th>
    <th>Genre</th>
    <th>Editeur</th>
    <th>Ajouter</th>
  </tr>
  </thead>
  <tbody>
  <c:if test="${sessionScope.mangas.size() == 0}" var="booleen">
    <tr>
      <td colspan="3">Aucun mangas en base de données</td>
    </tr>
  </c:if>
  <c:forEach items="${sessionScope.mangas}" var="m">
    <tr>
      <td><span> <c:out value="${m.title}"/> </span></td>
      <td><span> <c:out value="${m.author}"/> </span></td>
      <td><span> <c:out value="${m.number}"/> </span></td>
      <td><span> <c:out value="${m.gender}"/> </span></td>
      <td><span> <c:out value="${m.editor}"/> </span></td>
      <td><span> <a href="/addToCart/<c:out value='${sessionScope.user.id}'/>/<c:out value='${m.id}'/>"><button>Ajouter au panier</button></a></span></td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>