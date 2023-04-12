<?xml version="1.0" encoding="UTF-8"?>
<!-- Copyright IBM Corp. 2015  All Rights Reserved.                    -->
<xsl:stylesheet
	 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	 xmlns:java="http://xml.apache.org/xalan/java"
	 exclude-result-prefixes="java"
	 version="1.0"
>
	<xsl:output method="html" omit-xml-declaration="yes" encoding="UTF-8"/>
	<xsl:strip-space elements="*" />
	
	<!-- Parameter passed in externally -->
	<xsl:param name="fullHTML" select="'false'" />
	
	<xsl:template match="/" >
		<xsl:choose>
			<xsl:when test="$fullHTML='true'" >
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<html>
				<head>
				</head>
				<body>
				<table>
				<xsl:apply-templates/>
				</table>
				</body>
				</html>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="body" >
		<body>
		<table>
		<xsl:apply-templates/>
		</table>
		</body>
	</xsl:template>
	
	<xsl:template match="style" >
		<style type="text/css">
		<xsl:apply-templates/>
		</style>
	</xsl:template>
	
	<xsl:template match="script">
	</xsl:template>
	
	<xsl:template match="head" >
		<head>
		<xsl:apply-templates/>
		</head>
	</xsl:template>
	
	<xsl:template match="html" >
		<html dir='{@dir}'>
		<xsl:apply-templates/>
		</html>
	</xsl:template>
	
	<xsl:template match="h4|H4">
		<br />
		<xsl:apply-templates/>
		<br />
	</xsl:template>
	
	<xsl:template match="p|P">
		<br />
		<xsl:apply-templates/>
		<br />
	</xsl:template>
	
	<xsl:template match="u|U">
		<u>
		<xsl:apply-templates/>
		</u>
	</xsl:template>
	
	<xsl:template match="br|BR">
	    <!-- Defect 12057 -->
    	<xsl:choose>
			<xsl:when test="preceding-sibling::div[starts-with(@class,'other') or @class='myself'] or preceding-sibling::DIV[starts-with(@class,'other') or @class='myself']">
			</xsl:when>
			<xsl:otherwise>
		    <br/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="i|I">
		<i>
		<xsl:apply-templates/>
		</i>
	</xsl:template>
	
	<xsl:template match="b|B">
		<b>
		<xsl:apply-templates/>
		</b>
	</xsl:template>
	
	<xsl:template match="a|A">
		<a href='{@href}'>
		<xsl:apply-templates/>
		</a>
	</xsl:template>
	
	<xsl:template match="img|IMG">
		<xsl:text disable-output-escaping="yes"><![CDATA[<img src="]]></xsl:text><xsl:value-of select="@src" /><xsl:text disable-output-escaping="yes"><![CDATA[" alt="]]></xsl:text><xsl:value-of select="@alt" /><xsl:text disable-output-escaping="yes"><![CDATA[" />]]></xsl:text>
	</xsl:template>
	
	<xsl:template match="div|DIV">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="div[starts-with(@class,'datestamp')]">
		<tr>
		<td></td>
		<td class="showTimestamp tsDisplay" style="width:120px; white-space:nowrap" width="120px" nowrap="nowrap">
		<xsl:apply-templates />
		</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="div[@class='messageBlock']|DIV[@class='messageBlock']">
		<!-- Defect 12057 -->
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="nobr|NOBR">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="div[starts-with(@class,'other') or @class='myself']|DIV[starts-with(@class,'other') or @class='myself']">
		<!-- Defect 12057 -->
		<tr>
		<td class="{@class}" style="width:120px; white-space:nowrap" width="120px" nowrap="nowrap"><xsl:apply-templates /></td>
		<td></td>
		</tr>
	</xsl:template>
	
	<xsl:template match="div[starts-with(@class,'otherCont') or @class='myselfCont']|DIV[starts-with(@class,'otherCont') or @class='myselfCont']">
	    <!-- Defect 12057 -->
	    <tr>
		<td class="{@class}" style="width:120px; white-space:nowrap" width="120px" nowrap="nowrap"><xsl:apply-templates /></td>
	    <td></td>
	    </tr>
	</xsl:template>
	
	<!-- Handle system messages by sticking the message in the center column so they can wrap with regular messages -->
	<xsl:template match="span[@class='system']">
		<xsl:choose>
			<xsl:when test="preceding-sibling::div[@class='showTimestamp tsDisplay'] or preceding-sibling::DIV[@class='showTimestamp tsDisplay']">
				<!-- Defect 12057 -->
				<tr>
				<td class="{@class}" style="width:330px" width="330px"><xsl:apply-templates /></td>
				<xsl:apply-templates select="preceding-sibling::*[@class='showTimestamp tsDisplay']" mode="doit"/>
			    </tr>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="span[@class='left']">
		<span style='{@style}' class='{@class}'>
		<xsl:apply-templates/>
		</span>
	</xsl:template>
	
	<xsl:template match="span">
		<span style='{@style}'>
		<xsl:apply-templates/>
		</span>
	</xsl:template>
	
	<!-- Defect 12057 -->
	<xsl:template match="div[@class='message left' or @class='messageCont']|DIV[@class='message left' or @class='messageCont']">
		<tr>
		<td style="width:330px" width="330px"><xsl:apply-templates /></td>
		<xsl:choose>
			<xsl:when test="preceding-sibling::div[@class='showTimestamp tsDisplay'] or preceding-sibling::DIV[@class='showTimestamp tsDisplay']">
				<xsl:apply-templates select="preceding-sibling::*[@class='showTimestamp tsDisplay']" mode="doit"/>
			</xsl:when>
			<xsl:otherwise>
				<td><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text></td>
			</xsl:otherwise>
		</xsl:choose>
		</tr>
	</xsl:template>
	
	<xsl:template match="div[@class='showTimestamp tsDisplay']|DIV[@class='showTimestamp tsDisplay']">
	</xsl:template>
	
	<xsl:template match="div[@class='showTimestamp tsDisplay']|DIV[@class='showTimestamp tsDisplay']" mode="doit">
		<td class="{@class}" style="width:100px; white-space:nowrap" width="100px" nowrap="nowrap">
		<xsl:apply-templates />
		</td>
	</xsl:template>
</xsl:stylesheet> 
