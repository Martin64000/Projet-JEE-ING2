<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<header>
	<c:if test="${sessionScope.user.id == null}" var="booleen">
		<a href="/signin" >
			<button class="connectButton">
				<span class="connectSpan">Se Connecter</span>
			</button>
		</a>
	</c:if>
	<c:if test="${sessionScope.user.id != null}" var="booleen">
		<a href="/signin" >
			<button class="connectButton">
				<span class="connectSpan">Se Déconnecter</span>
			</button>
		</a>
	</c:if>
	<div id="banner1"><h2>Librairie Ohara</h2></div>
	<nav class="CentralMenu">
		<ul class="MenuDeroulant">
			<li><a href="/?id=true">Accueil</a></li>
			<li><a href="/mangas?id=true">Notre Boutique </a>
				<ul class="SousMenu" >
					<li><a href="/mangas?id=true">Mangas</a></li>
					<li><a href="/searchMangas?id=true">Rechercher un manga</a></li>
				</ul>
			</li>
			<li><a href="/cart/<c:out value='${sessionScope.user.id}'/>?id=true">Votre Panier</a></li>
			<c:if test="${sessionScope.user.role.type != 'User'}" var = "booleen">
				<li><a href="/caracteristiques?id=true">Gestion des caractéristiques produits</a></li>
				<li><a href="/stocks?id=true">Gestion des stocks</a></li>
			</c:if>
			<li><a href="/form?id=true">Nous contacter</a></li>
		</ul>
	</nav>
	<div id="banner2"></div>
</header>