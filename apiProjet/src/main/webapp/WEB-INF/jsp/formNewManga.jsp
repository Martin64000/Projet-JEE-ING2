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
<h2 class="h2">Ajout d'un manga</h2>

<form action="/saveManga?id=true" method="post" onsubmit="return validateForm()">
  <label for="title">Titre :</label><br>
  <input type="text" id="title" name="title" required><br>
  <label for="author">Auteur :</label><br>
  <input type="text" id="author" name="author" required><br>
  <label for="number">Numéro de tome :</label><br>
  <input type="number" id="number" name="number" min="1" required><br>
  <label for="gender">Genre :</label><br>
  <select id="gender" name="gender" required>
    <option value="">Sélectionnez un genre</option>
    <option value="Shonnen">Shonnen</option>
    <option value="Seinen">Seinen</option>
    <option value="Shojo">Shojo</option>
    <option value="Seijin">Seijin</option>
    <option value="Furyo">Furyo</option>
  </select><br>
  <label for="editor">Editeur :</label><br>
  <input id="editor" name="editor" required><br>
  <label for="stock">Stock :</label><br>
  <input type="number" id="stock" name="stock" min="1" required><br><br>
  <input type="submit" value="Ajouter le manga">
</form>

<script>
  function validateForm() {
    // Obtenir les valeurs des champs de formulaire
    var title = document.getElementById("title").value;
    var author = document.getElementById("author").value;
    var volume = document.getElementById("volume").value;
    var genre = document.getElementById("genre").value;
    var editor = document.getElementById("editor").value;
    var stock = document.getElementById("stock").value;

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
    if (editor === "") {
      alert("Veuillez entrer un éditeur.");
      return false;
    }
    if (stock === "") {
      alert("Veuillez entrer un stock.");
      return false;
    }

    // Si tous les champs sont valides, soumettre le formulaire
    return true;
  }
</script>

</body>
</html>