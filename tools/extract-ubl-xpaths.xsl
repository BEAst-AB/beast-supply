<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" 
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2">
	
	<xsl:output method="html" indent="yes"/>
	
	<xsl:template match="/">
		<table>
			<tr>
				<th>Element Name</th>
				<th>XPath</th>
			</tr>
			<xsl:apply-templates select="//ubl:* | //@*"/>
		</table>
	</xsl:template>
	
	<xsl:template match="* | @*">
		<tr>
			<td>
			<xsl:choose>
				<xsl:when test="self::attribute()">
					<xsl:value-of select="concat('@', name(.))"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="name(.)"/>
				</xsl:otherwise>
			</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="self::attribute()">
						<xsl:value-of select="concat('/', string-join((ancestor-or-self::*[not(self::text())])/ name(.), '/'))"/>
						<xsl:value-of select="concat('/', name(.))"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('/', string-join((ancestor-or-self::*[not(self::text())])/ name(.), '/'))"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<xsl:apply-templates select="*"/>
	</xsl:template>
	
</xsl:stylesheet>
