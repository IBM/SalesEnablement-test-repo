<?xml version="1.0" encoding="UTF-8"?>
<!-- Copyright IBM Corp. 2015  All Rights Reserved.                    -->
<xsl:stylesheet
	 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	 xmlns:java="http://xml.apache.org/xalan/java"
	 exclude-result-prefixes="java"
	 version="1.0"
>
	<xsl:output method="text" omit-xml-declaration="yes" encoding="UTF-8"/>
	<xsl:strip-space elements="*" />
	
	<!-- Parameter passed in externally containing the provider ID to use -->
	<xsl:param name="chatTransfer" />
	
	<xsl:template match="/html" >
		<xsl:apply-templates />
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>
	
	<xsl:template match="head" >
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="meta">
		<xsl:choose>
			<xsl:when test="@name='sametime:creationTime'" >
				<xsl:text>&#xa;!started at </xsl:text>
				<xsl:value-of select="@content"/>
			</xsl:when>
			<xsl:when test="@name='sametime:initiator'" >
				<xsl:text>&#xa;!initiated by </xsl:text>
				<xsl:value-of select="@content"/>
				<xsl:text>&#xa;</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="body|BODY" >
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="h4|H4" >
		<xsl:text>&#xa;</xsl:text>
		<xsl:apply-templates />
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>
	
	<xsl:template match="p|P" >
		<xsl:text>&#xa;</xsl:text>
		<xsl:apply-templates />
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>
	
	<xsl:template match="br" >
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>
	
	<xsl:template match="table|TABLE" >
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="tbody|TBODY" >
		<xsl:apply-templates/>
	</xsl:template>
		
	<xsl:template match="span|SPAN">	
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="b|B">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="i|I">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="u|U">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="a|A">
		<xsl:variable name="contents"><xsl:apply-templates /></xsl:variable>
		<xsl:choose>
		<xsl:when test="$chatTransfer = 'true'">
			<xsl:text><![CDATA[&lt;a href="]]></xsl:text><xsl:value-of select="@href" />
			<xsl:if test="@title != ''" >
				<xsl:text><![CDATA[" title="]]></xsl:text><xsl:value-of select="@title" />
			</xsl:if>
			<xsl:text><![CDATA["&gt;]]></xsl:text><xsl:value-of select="$contents" /><xsl:text><![CDATA[&lt;/a&gt;]]></xsl:text>
		</xsl:when>
		<xsl:when test="$contents = @href or concat('http://' , $contents) = @href">
		<xsl:value-of select="$contents" />
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="$contents" /><xsl:value-of select="concat(' (', @href, ') ')" />
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- SPR #LJWG87495R - duplicate this xsl:template block with the next as some JVMs can't handle the combined match statement -->
	<xsl:template match="div[@class='messageBlock']|DIV[@class='messageBlock']" >
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="tr|TR" >
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="td|div|DIV">
		<xsl:choose>
			<xsl:when test="@class='datestamp dsDisplay'" >
				<xsl:text>&#xa;</xsl:text>
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="@class='showTimestamp tsDisplay'" >
				<xsl:text>&#xa;</xsl:text>
				<xsl:apply-templates/>

				<!-- SPR #YRLN8LFA3J - only add the ": " if there is an actual timestamp value -->
				<xsl:if test="nobr != ''">
					<xsl:text>: </xsl:text>
				</xsl:if>

			</xsl:when>
			<xsl:when test="@class='myself' or @class='myselfCont'" >
				<xsl:call-template name="getFullName">
					<xsl:with-param name="title" select="@title" />
				</xsl:call-template>
				<xsl:text>: </xsl:text>
			</xsl:when>
			<xsl:when test="starts-with(@class,'other')" >
				<xsl:call-template name="getFullName">
					<xsl:with-param name="title" select="@title" />
				</xsl:call-template>
				<xsl:text>: </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="getFullName">
		<xsl:param name="title" />
		<xsl:call-template name="stringToLastIndexOf">
			<xsl:with-param name="string" select="$title" />
			<xsl:with-param name="char" select="'['"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="stringToLastIndexOf">
		<xsl:param name="string" />
		<xsl:param name="prevString" />
		<xsl:param name="char" />
		<xsl:choose>
			<xsl:when test="contains($string, $char)">
				<xsl:variable name="previous">
					<xsl:if test="$prevString != ''">
						<xsl:value-of select="concat($prevString, $char)" />
					</xsl:if>
				</xsl:variable>
				<xsl:call-template name="stringToLastIndexOf">
					<xsl:with-param name="string" select="substring-after($string, $char)" />
					<xsl:with-param name="prevString" select="concat($previous, substring-before($string, $char))" />
					<xsl:with-param name="char" select="$char" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="normalize-space($prevString)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="nobr|NOBR">
		<xsl:if test="parent::DIV[@class='showTimestamp tsDisplay'] or parent::div[@class='showTimestamp tsDisplay']">
			<xsl:value-of select="." />
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="img|IMG">
		<xsl:choose>
		<xsl:when test="$chatTransfer = 'true'">
		<xsl:text><![CDATA[&lt;img src="]]></xsl:text><xsl:value-of select="@src" /><xsl:text><![CDATA[" keybrd="]]></xsl:text><xsl:value-of select="@keybrd" /><xsl:text><![CDATA[" /&gt; ]]></xsl:text>
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@keybrd" />
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*">
	</xsl:template>

</xsl:stylesheet> 
