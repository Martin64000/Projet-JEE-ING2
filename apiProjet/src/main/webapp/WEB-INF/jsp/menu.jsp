<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<c:if test="${sessionScope.user.id == null}" var="booleen">
	<c:redirect url="/signin"/>
</c:if>


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
			<li><a href="/">Accueil</a></li>
			<li><a href="/mangas">Notre Boutique </a>
				<ul class="SousMenu" >
					<li><a href="/mangas">Mangas</a></li>
					<li><a href="/searchMangas">Rechercher un manga</a></li>
				</ul>
			</li>
			<li><a href="/cart/<c:out value='${sessionScope.user.id}'/>?id=true">Votre Panier</a></li>
			<c:if test="${sessionScope.user.role.type == 'Moderator'}" var = "booleen">
				<li><a href="/caracteristiques">Gestion des caractéristiques produits</a></li>
				<li><a href="/stocks">Gestion des stocks</a></li>
			</c:if>
			<c:if test="${sessionScope.user.role.type == 'Administrator'}" var = "booleen">
				<li><a href="/listModerator">Gestion des modérateurs</a></li>
			</c:if>
			<li><a href="/form">Nous contacter</a></li>
		</ul>
	</nav>
	<div id="banner2"></div>
</header>