<%@ page pageEncoding="UTF-8" %>
<%@ include file="taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="stylesheet" type="text/css" href="css/Header.css">
  <link rel="stylesheet" type="text/css" href="css/accueil.css">
  <link rel="stylesheet" type="text/css" href="css/profil.css">
  <link rel="stylesheet" type="text/css" href="css/menuDeroulant.css">
  <title>Test</title>
</head>
<body>
  <%@ include file="menu.jsp" %>
  <h2 class="h2">Liste des mangas</h2>
  <table>
    <thead>
      <tr>
        <th>Titre</th>
        <th>Auteur</th>
        <th>Tome</th>
        <th>Genre</th>
        <th>Editeur</th>
      </tr>
    </thead>
    <tbody>
      <c:if test="${pageScope.mangas} == null " var="booleen">
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
        </tr>
      </c:forEach>
    </tbody>
  </table>
</body>
</html>