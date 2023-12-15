<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:synstr="urn:fdc:difi.no:2017:vefa:structure-1"
	xmlns="urn:fdc:difi.no:2017:vefa:structure-1"
	exclude-result-prefixes="xsl fn synstr">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:param name="varOverrideSample"/>
	<xsl:variable name="varOverrideSampleXml" select="document($varOverrideSample)"/>
	<xsl:template match="comment()|processing-instruction()|/">
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="synstr:Element">
		<!--xsl:variable name="varDocXPath">
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
    </xsl:variable-->
		<xsl:variable name="varDocXPath2">
			<xsl:for-each select="ancestor-or-self::*">
				<xsl:choose>
					<xsl:when test="fn:name(.)='Structure'">
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>/</xsl:text>
						<xsl:variable name="xpathTerm" select="synstr:Term"/>
						<xsl:variable name="xpathTermNsPrefix" select="substring-before(synstr:Term, ':')"/>
						<xsl:variable name="xpathTermNs" select="/synstr:Structure/synstr:Namespace[@prefix=$xpathTermNsPrefix]"/>
						<xsl:value-of select="replace( $xpathTerm, concat($xpathTermNsPrefix, ':'), concat('Q{', $xpathTermNs, '}') )"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="varOverrideNode">
			<xsl:evaluate xpath="$varDocXPath2" context-item="$varOverrideSampleXml"/>
		</xsl:variable>
		<xsl:element name="{name()}">
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="synstr:Term"/>
			<xsl:apply-templates select="synstr:Name"/>
			<xsl:variable name="varOverrideNode_Description" select="$varOverrideNode/*/processing-instruction('Description')"/>
			<xsl:variable name="varOverrideNode_DescriptionAddFirst" select="$varOverrideNode/child::*/processing-instruction('DescriptionAddFirst')"/>
			<xsl:variable name="varOverrideNode_DescriptionAddLast" select="$varOverrideNode/child::*/processing-instruction('DescriptionAddLast')"/>
			<xsl:variable name="varOverrideNode_DataType" select="$varOverrideNode/child::*/processing-instruction('DataType')"/>
			<xsl:variable name="varOverrideNode_BusinessTerm" select="$varOverrideNode/child::*/processing-instruction('BusinessTerm')"/>
			<xsl:variable name="varOverrideNode_Rule" select="$varOverrideNode/child::*/processing-instruction('Rule')"/>
			<xsl:variable name="varOverrideNode_CodeList" select="$varOverrideNode/child::*/processing-instruction('CodeList')"/>
			<xsl:variable name="varOverrideNode_ValueType" select="$varOverrideNode/child::*/processing-instruction('ValueType')"/>
			<xsl:variable name="varOverrideNode_Value" select="$varOverrideNode/child::*/child::text()[1]"/>
			<!--xsl:if test="$varDocXPath = '/ubl:Order/cac:AdditionalDocumentReference/cbc:ID' or $varDocXPath = '/ubl:Order/cac:AdditionalDocumentReference'">
			<xsl:message>
			  XPath: <xsl:value-of select="$varDocXPath"/>
			  Value: <xsl:value-of select="$varOverrideNode_Value"/>
			</xsl:message>
          </xsl:if-->
			<xsl:choose>
				<xsl:when test="$varOverrideNode_Description!='' and not(empty($varOverrideNode_Description))">
					<Description>
						<xsl:value-of select="$varOverrideNode_Description"/>
					</Description>
				</xsl:when>
				<xsl:when test="$varOverrideNode_DescriptionAddFirst!='' and not(empty($varOverrideNode_DescriptionAddFirst))">
					<Description>
						BEAst: <xsl:value-of select="$varOverrideNode_DescriptionAddFirst"/>
						<xsl:if test="synstr:Description != ''">
							<xsl:value-of select="concat(' Peppol: ', synstr:Description)"/>
						</xsl:if>
					</Description>
				</xsl:when>
				<xsl:when test="$varOverrideNode_DescriptionAddLast!='' and not(empty($varOverrideNode_DescriptionAddLast))">
					<Description>
						<xsl:if test="synstr:Description != ''">
							<xsl:value-of select="concat('Peppol: ', synstr:Description, ' BEAst: ')"/>
						</xsl:if>
						<xsl:value-of select="$varOverrideNode_DescriptionAddLast"/>
					</Description>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="synstr:Description"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$varOverrideNode_DataType!='' and not(empty($varOverrideNode_DataType))">
					<DataType>
						<xsl:value-of select="$varOverrideNode_DataType"/>
					</DataType>
				</xsl:when>
				<xsl:otherwise>
					<xsl:copy-of select="synstr:DataType"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$varOverrideNode_BusinessTerm!='' and not(empty($varOverrideNode_BusinessTerm))">
					<xsl:for-each select="$varOverrideNode_BusinessTerm">
						<Reference type="BUSINESS_TERM">
							<xsl:value-of select="."/>
						</Reference>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:copy-of select="synstr:Reference[@type='BUSINESS_TERM']"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$varOverrideNode_Rule!='' and not(empty($varOverrideNode_Rule))">
					<xsl:for-each select="$varOverrideNode_Rule">
						<Reference type="RULE">
							<xsl:value-of select="."/>
						</Reference>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:copy-of select="synstr:Reference[@type='RULE']"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$varOverrideNode_CodeList!='' and not(empty($varOverrideNode_CodeList))">
					<xsl:for-each select="$varOverrideNode_CodeList">
						<Reference type="CODE_LIST">
							<xsl:value-of select="."/>
						</Reference>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:copy-of select="synstr:Reference[@type='CODE_LIST']"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<!--xsl:when test="normalize-space($varOverrideNode_Value)!='' and not(empty(normalize-space($varOverrideNode_Value)))"-->
				<xsl:when test="normalize-space($varOverrideNode_Value)!=''">
					<Value>
						<xsl:choose>
							<xsl:when test="$varOverrideNode_ValueType!=''">
								<xsl:attribute name="type">
									<xsl:value-of select="normalize-space($varOverrideNode_ValueType)"/>
								</xsl:attribute>
							</xsl:when>
							<xsl:when test="synstr:Value/@type!=''">
								<xsl:attribute name="type">
									<xsl:value-of select="synstr:Value/@type"/>
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="type">
									<xsl:value-of select="'EXAMPLE'"/>
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="normalize-space($varOverrideNode_Value)"/>
					</Value>
				</xsl:when>
				<!--xsl:when test="not(empty(synstr:Value))">
                <xsl:copy-of select="synstr:Value"/>
              </xsl:when-->
				<xsl:otherwise>
					<xsl:copy-of select="synstr:Value"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="synstr:Attribute"/>
			<xsl:apply-templates select="synstr:Element"/>
		</xsl:element>
	</xsl:template>
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