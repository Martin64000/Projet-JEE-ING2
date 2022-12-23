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
    <title>Gestion mangas</title>
  </head>
  <body>
    <%@ include file="menu.jsp" %>
    <h2 class="h2">Modification des mangas</h2>

    <form action="/update/<c:out value='${sessionScope.updateMangas.get().id}'/>?id=true" method="post" onsubmit="return validateForm()">
      <label for="title">Titre:</label><br>
      <input type="text" id="title" name="title" placeholder="<c:out value='${sessionScope.updateMangas.get().title}'/>" required><br>
      <label for="author">Auteur:</label><br>
      <input type="text" id="author" name="author" placeholder="<c:out value='${sessionScope.updateMangas.get().author}'/>" required><br>
      <label for="number">Numéro de tome:</label><br>
      <input type="number" id="number" name="number" min="1" placeholder="<c:out value='${sessionScope.updateMangas.get().number}'/>" required><br>
      <label for="gender">Genre:</label><br>
      <select id="gender" name="gender" required>
        <option value="">Sélectionnez un genre</option>
        <option value="Shonnen">Shonnen</option>
        <option value="Seinen">Seinen</option>
        <option value="Shojo">Shojo</option>
        <option value="Seijin">Seijin</option>
        <option value="Furyo">Furyo</option>
      </select><br>
      <label for="editor">Editeur :</label><br>
      <input id="editor" name="editor" placeholder="<c:out value='${sessionScope.updateMangas.get().editor}'/>" required><br><br>
      <input type="submit" value="Modifier le manga">
    </form>

    <script>
      function validateForm() {
        // Obtenir les valeurs des champs de formulaire
        var title = document.getElementById("title").value;
        var author = document.getElementById("author").value;
        var volume = document.getElementById("volume").value;
        var genre = document.getElementById("genre").value;

        // Vérifier si les champs sont valides
        if (title === "") {
          alert("Veuillez entrer un titre valide.");
          return false;
        }
        if (author === "") {
          alert("Veuillez entrer un auteur valide.");
          return false;
        }
        if (volume === "") {
          alert("Veuillez entrer un numéro de tome valide.");
          return false;
        }
        if (genre === "") {
          alert("Veuillez sélectionner un genre.");
          return false;
        }

        // Si tous les champs sont valides, soumettre le formulaire
        return true;
      }
    </script>

  </body>
</html>