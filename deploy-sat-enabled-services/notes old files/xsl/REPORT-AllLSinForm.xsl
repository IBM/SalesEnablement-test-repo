<?xml version="1.0"?>
<!-- Copyright IBM Corp. 2002, 2012  All Rights Reserved.              -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:dxl='http://www.lotus.com/dxl'>
<xsl:output method='html'/>
<xsl:strip-space elements='*'/>

<xsl:template match='dxl:form'>
	<!-- The header for the page -->
	<HTML>
	<HEAD>
	<TITLE> Extract LotusScript code for Domino Design Elements </TITLE>
	<LINK rel='stylesheet' type='text/css' href='drstyles.css' title='Style'/>
	</HEAD>
		<BODY>
		<H1 align="left">
		<xsl:text> Form: </xsl:text>
		<xsl:value-of select='@name'/>
		</H1>

		<H2>
		<xsl:text> LotusScript </xsl:text>
		</H2>

		<xsl:choose>
			<xsl:when test='.//dxl:lotusscript'>
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<p>
				<PRE CLASS='Event'> <xsl:text> No LotusScript found!</xsl:text> </PRE>
				</p>
			</xsl:otherwise>
		</xsl:choose>
		<CENTER><HR/></CENTER>
		</BODY>
		</HTML>
</xsl:template>

<xsl:template match='dxl:lotusscript'>
        <H3>
	<xsl:choose>
		<xsl:when test='../@section'>
			<xsl:value-of select='../@section'/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select='../@event'/>
		</xsl:otherwise>
	</xsl:choose>
        </H3>
 	<p>
	<PRE CLASS='Event'> <xsl:value-of select='.'/> </PRE>
	</p>
</xsl:template>

<!-- Match all text that has not yet been picked up by the templates, and discard it. -->
<xsl:template match="text()">
</xsl:template>

</xsl:stylesheet>
