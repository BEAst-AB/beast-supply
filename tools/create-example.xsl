<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:synstr="urn:fdc:difi.no:2017:vefa:structure-1"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	exclude-result-prefixes="xsl fn synstr">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="synstr:Structure">
		<xsl:apply-templates select="synstr:Document"/>
	</xsl:template>
	<xsl:template match="synstr:Document">
		<xsl:variable name="xpathTermNsPrefix" select="substring-before(synstr:Term, ':')"/>
		<xsl:choose>
			<xsl:when test="$xpathTermNsPrefix != ''">
				<xsl:variable name="xpathTermWithoutNsPrefix" select="substring-after(synstr:Term, concat($xpathTermNsPrefix, ':'))"/>
				<xsl:variable name="xpathTermNs" select="/synstr:Structure/synstr:Namespace[@prefix=$xpathTermNsPrefix]"/>
				<xsl:element name="{$xpathTermWithoutNsPrefix}" namespace="{$xpathTermNs}">
					<xsl:for-each select="/synstr:Structure/synstr:Namespace[@prefix!=$xpathTermNsPrefix]">
						<xsl:namespace name="{@prefix}" select="."/>
					</xsl:for-each>
					<xsl:apply-templates select="synstr:Attribute"/>
					<xsl:apply-templates select="synstr:Element"/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="{synstr:Term}">
					<xsl:for-each select="../synstr:Namespace">
						<xsl:namespace name="{@prefix}" select="."/>
					</xsl:for-each>
					<xsl:apply-templates select="synstr:Attribute"/>
					<xsl:apply-templates select="synstr:Element"/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="synstr:Element">
		<xsl:element name="{synstr:Term}">
			<xsl:apply-templates select="synstr:Attribute"/>
			<xsl:value-of select="synstr:Value"/>
			<xsl:apply-templates select="synstr:Element"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="synstr:Attribute">
		<xsl:attribute name="{synstr:Term}">
			<xsl:value-of select="normalize-space(synstr:Value)"/>
		</xsl:attribute>
	</xsl:template>
</xsl:stylesheet>