<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:fn="http://www.w3.org/2005/xpath-functions"
                              xmlns:synstr="urn:fdc:difi.no:2017:vefa:structure-1"
                              xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2"
                              xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                              xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                              exclude-result-prefixes="xsl fn ubl cac cbc synstr">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="synstr:Structure">
		<xsl:apply-templates select="synstr:Document"/>
	</xsl:template>
	<xsl:template match="synstr:Document">
		<xsl:element name="{synstr:Term}">
			<xsl:for-each select="../synstr:Namespace">
				<xsl:namespace name="{@prefix}" select="."/>
			</xsl:for-each>
			<xsl:apply-templates select="synstr:Element"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="synstr:Element">
		<xsl:element name="{synstr:Term}">
			<xsl:value-of select="synstr:Value"/>
			<xsl:apply-templates select="synstr:Element"/>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>