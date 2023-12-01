<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Define parameters for input files and output file -->
  <xsl:param name="localFile"/>
  <xsl:param name="externalFile"/>

	<xsl:variable name="varLocalFile" select="document($localFile)"/>
	<xsl:variable name="varExternalFile" select="document($externalFile)"/>

  <!-- Define the root template -->
  <xsl:template match="/">
    <xsl:apply-templates select="$varExternalFile"/>
  </xsl:template>

  <!-- Copy everything as is from the source document -->
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Override values from the local document if available -->
  <xsl:template match="//*[text() and not(ancestor-or-self::ProcessingInstruction)]">
    <xsl:variable name="localValue" select="document($localFile)//*[name() = name(current())]/text()"/>
    <xsl:choose>
      <xsl:when test="$localValue">
        <xsl:value-of select="$localValue"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="@* | node()"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
