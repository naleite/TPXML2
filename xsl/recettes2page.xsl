<?xml version="1.0" encoding="UTF-8"?>
<!--  fichier recettes2page.xsl -->
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output 
		indent="yes" 
		encoding="UTF-8"
		method="xml"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		media-type="text/html"
	/>
	<!--  liste de toutes les recettes (triées) 
			dans un seul fichier XHTML -->
	<xsl:template match="/">
		<html>
		<head>
			<title>RECETTES</title>
		<!--  on pourra ajouter une feuille de style CSS ici -->
		</head>
		<body>
		<xsl:apply-templates />
		</body>		
		</html>
	</xsl:template>
		
	<xsl:template match="recettes">
		 <h1>Recettes</h1>
		<!--  on pourra ouvrir cet apply-templates pour trier les recettes ici  -->
		
		 <xsl:apply-templates select="rubrique/recette" />
	</xsl:template>
				
	<xsl:template match="recette" >
	<!--  on pourra ajouter un attribut id sur cet élément div
		afin de créer ensuite un lien vers chaque recette -->
	    <div class="fiche">
			<h2><xsl:value-of select="nom"/></h2>
			<p><xsl:value-of select="temps/text()"/></p>
		<!--  on pourra considerer les ingrédients comme une liste (ul) -->
			<div class="ingrédients"><xsl:apply-templates select="ingrédients"/></div>
			<div class="préparation"><xsl:apply-templates select="préparation"/></div>
	   </div>
	</xsl:template>
		
	<xsl:template match="préparation|ingrédients">	
		<h3><xsl:value-of select="name()"/></h3>
		<xsl:apply-templates select="./item"/>
	</xsl:template>
		
	<xsl:template match="item">
		<!--  on pourra considerer les item comme des éléments d'une liste (li) -->
		<p><xsl:value-of select="./text()"/></p>
	</xsl:template>
	
</xsl:stylesheet>

