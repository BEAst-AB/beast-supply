<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:fn="http://www.w3.org/2005/xpath-functions"
                              xmlns:synstr="urn:fdc:difi.no:2017:vefa:structure-1"
                              xmlns="urn:fdc:difi.no:2017:vefa:structure-1"
                              xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2"
                              xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                              xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                              exclude-result-prefixes="xsl fn ubl cac cbc synstr">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:param name="varOverrideSample"/>
  <xsl:variable name="varOverrideSampleXml" select="document($varOverrideSample)"/>
  <xsl:template match="comment()|processing-instruction()|/">
    <xsl:copy>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  <!--xsl:template match="synstr:Document">
    <xsl:element name="{name()}">
      <xsl:apply-templates select="@*|node()"/>
    </xsl:element>
  </xsl:template-->
  <xsl:template match="synstr:Element">
    <xsl:variable name="varDocXPath">
      <xsl:for-each select="ancestor-or-self::*">
        <xsl:choose>
          <xsl:when test="fn:name(.)='Structure'">
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>/</xsl:text>
            <xsl:value-of select="synstr:Term"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
      <!--xsl:text>/processing-instruction('DescriptionAddFirst')</xsl:text-->
    </xsl:variable>
    <xsl:variable name="varDocNode">
      <xsl:evaluate xpath="$varDocXPath" context-item="$varOverrideSampleXml" />
    </xsl:variable>
    <!--xsl:message>
      Doc Xpath: <xsl:value-of select="$varDocXPath"/>
    </xsl:message-->
    <xsl:element name="{name()}">
      <xsl:apply-templates select="@*"/>
        <xsl:choose>
          <xsl:when test="$varDocNode!='' and not(empty($varDocNode))">
            <xsl:apply-templates select="synstr:Term"/>
            <xsl:apply-templates select="synstr:Name"/>
            <xsl:variable name="varDocNode_Description" select="$varDocNode/*/processing-instruction('Description')"/>
            <xsl:variable name="varDocNode_DescriptionAddFirst" select="$varDocNode/child::*/processing-instruction('DescriptionAddFirst')"/>
            <xsl:variable name="varDocNode_DescriptionAddLast" select="$varDocNode/child::*/processing-instruction('DescriptionAddLast')"/>
            <xsl:variable name="varDocNode_DataType" select="$varDocNode/child::*/processing-instruction('DataType')"/>
            <xsl:variable name="varDocNode_BusinessTerm" select="$varDocNode/child::*/processing-instruction('BusinessTerm')"/>
            <xsl:variable name="varDocNode_Rule" select="$varDocNode/child::*/processing-instruction('Rule')"/>
            <xsl:variable name="varDocNode_CodeList" select="$varDocNode/child::*/processing-instruction('CodeList')"/>
            <xsl:variable name="varDocNode_Example" select="$varDocNode/child::*/processing-instruction('Example')"/>
            <xsl:if test="$varDocNode_Description!='' and not(empty($varDocNode_Description))">
              <!--xsl:message>
                Doc Xpath: <xsl:value-of select="$varDocXPath"/>
                Description: <xsl:value-of select="$varDocNode_Description"/>
              </xsl:message-->
              <Description>
                <xsl:value-of select="$varDocNode_Description"/>
              </Description>
            </xsl:if>
            <xsl:if test="$varDocNode_DescriptionAddFirst!='' and not(empty($varDocNode_DescriptionAddFirst))">
              <!--xsl:message>
                Doc Xpath: <xsl:value-of select="$varDocXPath"/>
                DescriptionAddFirst: <xsl:value-of select="$varDocNode_DescriptionAddFirst"/>
              </xsl:message-->
              <Description>
                BEAst: <xsl:value-of select="$varDocNode_DescriptionAddFirst"/>
                <xsl:if test="synstr:Description != ''">
                  <xsl:value-of select="concat(' Peppol: ', synstr:Description)"/>
                </xsl:if>
              </Description>
            </xsl:if>
            <xsl:if test="$varDocNode_DescriptionAddLast!='' and not(empty($varDocNode_DescriptionAddLast))">
              <!--xsl:message>
                Doc Xpath: <xsl:value-of select="$varDocXPath"/>
                DescriptionAddLast: <xsl:value-of select="$varDocNode_DescriptionAddLast"/>
              </xsl:message-->
              <Description>
                <xsl:if test="synstr:Description != ''">
                  <xsl:value-of select="concat('Peppol: ', synstr:Description, ' BEAst: ')"/>
                </xsl:if>
                <xsl:value-of select="$varDocNode_DescriptionAddLast"/>
              </Description>
            </xsl:if>
            <xsl:if test="$varDocNode_DataType!='' and not(empty($varDocNode_DataType))">
              <!--xsl:message>
                Doc Xpath: <xsl:value-of select="$varDocXPath"/>
                DataType: <xsl:value-of select="$varDocNode_DataType"/>
              </xsl:message-->
              <DataType>
                <xsl:value-of select="$varDocNode_DataType"/>
              </DataType>
            </xsl:if>
            <xsl:if test="$varDocNode_BusinessTerm!='' and not(empty($varDocNode_BusinessTerm))">
              <!--xsl:message>
                Doc Xpath: <xsl:value-of select="$varDocXPath"/>
              </xsl:message-->
                <xsl:for-each select="$varDocNode_BusinessTerm">
                  <!--xsl:message>
  				  BusinessTerm: <xsl:value-of select="."/>
				  </xsl:message-->
                  <Reference type="BUSINESS_TERM">
                    <xsl:value-of select="."/>
                  </Reference>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="$varDocNode_Rule!='' and not(empty($varDocNode_Rule))">
              <!--xsl:message>
                Doc Xpath: <xsl:value-of select="$varDocXPath"/>
              </xsl:message-->
                <xsl:for-each select="$varDocNode_Rule">
                  <!--xsl:message>
                  Rule: <xsl:value-of select="."/>
				  </xsl:message-->
                  <Reference type="RULE">
                    <xsl:value-of select="."/>
                  </Reference>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="$varDocNode_CodeList!='' and not(empty($varDocNode_CodeList))">
              <!--xsl:message>
                Doc Xpath: <xsl:value-of select="$varDocXPath"/>
              </xsl:message-->
                <xsl:for-each select="$varDocNode_CodeList">
                  <!--xsl:message>
                  CodeList: <xsl:value-of select="."/>
				  </xsl:message-->
                  <Reference type="CODE_LIST">
                    <xsl:value-of select="."/>
                  </Reference>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="$varDocNode_Example!='' and not(empty($varDocNode_Example))">
              <!--xsl:message>
                Doc Xpath: <xsl:value-of select="$varDocXPath"/>
              </xsl:message-->
                <xsl:for-each select="$varDocNode_Example">
                  <!--xsl:message>
                  Example: <xsl:value-of select="."/>
				  </xsl:message-->
                  <Value type="EXAMPLE">
                    <xsl:value-of select="."/>
                  </Value>
                </xsl:for-each>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="node()"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="synstr:Attribute"/>
        <xsl:apply-templates select="synstr:Element"/>
      <!--xsl:apply-templates select="@*|node()"/-->
    </xsl:element>
  </xsl:template>
  <!--xsl:template match="/">
    <xsl:message>
      varOverrideSample: <xsl:value-of select="$varOverrideSample"/>
    </xsl:message>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:template-->
  <xsl:template match="*">
    <xsl:element name="{name()}">
      <xsl:apply-templates select="@*|node()"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="@*">
    <xsl:attribute name="{name()}">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
</xsl:stylesheet>