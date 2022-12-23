<%@ page pageEncoding="UTF-8" %>
<%@ include file="taglibs.jsp" %>
<!DOCTYPE html>
<html lang="FR">
<head>
  <meta charset="UTF-8">
  <style type="text/css">
    <%@ include file="css/Header.css" %>
    <%@ include file="css/accueil.css" %>
    <%@ include file="css/profil.css" %>
    <%@ include file="css/menuDeroulant.css" %>
    <%@ include file="css/boutique.css" %>
    <%@ include file="css/formulaire.css"%>
  </style>
  <title>Nous contacter</title>
</head>
<body>
  <%@ include file="menu.jsp"%>
<!--Bannière du site-->
<nav class="page_central">
  <div class="box">
    <form action="/form" class="formBloc" method="GET">
      <h3><strong>Contactez-nous</strong></h3>
      <div class="formGroupe" id="animeFixe">
        <label>Date du contact</label>
        <input type="date" name="date" required maxlength="16">
      </div>
      <div class="formGroupe">
        <label>Nom</label>
        <input type="text" name="nom" required maxlength="16">
      </div>
      <div class="formGroupe">
        <label>Prénom</label>
        <input type="text" name="prenom" required maxlength="16">
      </div>
      <div class="formGroupe" id="animeFixe">
        <label>Date de Naissance</label>
        <input type="date" name="date" required maxlength="16">
      </div>
      <div class="formGroupe">
        <label>E-mail</label>
        <input type="email" pattern=".+@cy-tech.fr" name="email" required maxlength="32">
      </div>
      <div class="formGroupe">
        <label>Genre</label>
        <input type="text" name="genre" required maxlength="16">
      </div>
      <div class="formGroupe">
        <label>Fonction</label>
        <input type="text" name="fonction" required maxlength="16">
      </div>
      <div class="formGroupe">
        <label>Sujet</label>
        <input type="text" name="sujet" required maxlength="16">
      </div>
      <div class="formGroupe">
        <label>Contenu</label>
        <input type="text" name="fonction" required maxlength="16">
      </div>
      <div class="formGroupe">
        <input type="submit" value="Envoyer le formulaire" onclick="popUp()" class="buttonSub">
      </div>
    </form>
  </div>
</nav>

<script>
  <%@ include file="js/formulaire.js"%>
  async function popUp() {
    alert("Merci pour votre réponse ! Nous vous tiendrons informé quant à votre demande");
  }
</script>
</body>
</html>