<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:fn="http://www.w3.org/2005/xpath-functions"
				xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2"
				xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
				exclude-result-prefixes="xsl fn">

	<xsl:param name="overrideFile"/>

	<xsl:variable name="varOverrideFile" select="document($overrideFile)"/>

	<xsl:output method="xml" indent="yes"/>
	<xsl:strip-space elements="*"/>

	<!-- Remove processing instructions -->
	<xsl:template match="//processing-instruction()"/>

	<!-- Format XML to have end tags on the same line -->
	<xsl:template match="*">
		<xsl:param name="indent" select="''" />
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:variable name="varElementXPath">
				<xsl:for-each select="ancestor-or-self::*">
					<xsl:text>/</xsl:text>
					<xsl:value-of select="fn:name(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="varElementOverrideValue">
				<xsl:evaluate xpath="$varElementXPath" context-item="$varOverrideFile" />
			</xsl:variable>

			<xsl:choose>
				<xsl:when test="count(child::*) = 0">
					<xsl:choose>
						<xsl:when test="normalize-space($varElementOverrideValue) != ''">
							<xsl:value-of select="normalize-space($varElementOverrideValue)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(text())" disable-output-escaping="yes"/>
						</xsl:otherwise>
					</xsl:choose>
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