<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"/>
	<xsl:strip-space elements="*"/>
	
	<!-- Remove processing instructions -->
	<xsl:template match="//processing-instruction()"/>
	
	<!-- Remove values within XML elements -->
	<xsl:template match="text()">
		<xsl:value-of select="''"/>
	</xsl:template>
	
	<!-- Remove text content within attributes -->
	<xsl:template match="@*">
		<xsl:attribute name="{name()}">
			<xsl:value-of select="''"/>
		</xsl:attribute>
	</xsl:template>
	
	<!-- Format XML to have end tags on the same line -->
	<xsl:template match="*">
		<xsl:param name="indent" select="''" />
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:choose>
				<xsl:when test="count(child::*) = 0">
					<xsl:text disable-output-escaping="yes">&#xA;</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&#xA;</xsl:text>
					<xsl:apply-templates select="child::*">
						<xsl:with-param name="indent" select="concat($indent, '  ')" />
					</xsl:apply-templates>
					<xsl:value-of select="concat($indent, '&#xA;')" disable-output-escaping="yes"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
