<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="content-type" content="text/html;charset=UTF-8">
  <style type="text/css">
    <%@ include file="css/Header.css" %>
    <%@ include file="css/accueil.css" %>
    <%@ include file="css/profil.css" %>
    <%@ include file="css/menuDeroulant.css" %>
    <%@ include file="css/boutique.css" %>
    <%@ include file="css/connexion.css" %>
  </style>
  <title>Connexion</title>
</head>
<body>
<!-- Page de depart de notre site web qui suivant nos identifiant va nous diriger vers differentes pages  -->
<div class="box">
  <form class="formBloc" action="/signin" method="POST">
    <h3><strong>Identifiez</strong>-vous</h3>
    <div class="formGroupe">
      <label for="utilisateur">Utilisateur</label>
      <input type="text" name="identifiant" id="utilisateur" required maxlength="16">
    </div>
    <div class="formGroupe">
      <label for="mdp">Mot de passe</label>
      <input type="password" name="mdp" id="mdp" required maxlength="16">
    </div>
    <div class="formGroupe">
      <input type="submit" value="LOGIN" class="buttonSub">
    </div>
  </form>
</div>
<!--
<script src="js/formulaire.js"></script>
-->
</body>
</html>