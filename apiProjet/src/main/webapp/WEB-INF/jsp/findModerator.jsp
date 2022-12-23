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
    <%@ include file="css/formulaire.css" %>
  </style>
  <title>Vos modérateurs</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<h2 class="h2">Liste des modérateurs</h2>
<table class="table">
  <thead>
  <tr>
    <th>Identifiant</th>
    <th>Role</th>
  </tr>
  </thead>
  <body>
  <c:if test="${sessionScope.searchModerator.size() == 0}" var="booleen">
    <tr>
      <td colspan="2">Aucun moderateur</td>
    </tr>
  </c:if>
  <c:forEach items="${sessionScope.searchModerator}" var="m">
    <tr>
      <td><span> <c:out value="${m.username}"/> </span></td>
      <td><span> <c:out value="${m.role.type}"/> </span></td>
    </tr>
  </c:forEach>
  </body>
</table>
</body>
</html>