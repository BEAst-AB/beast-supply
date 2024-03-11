<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        xmlns:u="utils"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xi="http://www.w3.org/2001/XInclude"
        schemaVersion="iso"
        queryBinding="xslt2">

    <title>Rules for PEPPOL Catalogue transaction 3.0</title>
    
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
       prefix="cbc"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
       prefix="cac"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2"
       prefix="ubl"/>
    <ns uri="http://www.w3.org/2001/XMLSchema" prefix="xs"/>
    <ns uri="utils" prefix="u"/>
    
    

    <function xmlns="http://www.w3.org/1999/XSL/Transform"
             name="u:gln"
             as="xs:boolean">
      <param name="val"/>
      <variable name="length" select="string-length($val) - 1"/>
      <variable name="digits"
                select="reverse(for $i in string-to-codepoints(substring($val, 0, $length + 1)) return $i - 48)"/>
      <variable name="weightedSum"
                select="sum(for $i in (0 to $length - 1) return $digits[$i + 1] * (1 + ((($i + 1) mod 2) * 2)))"/>
      <value-of select="(10 - ($weightedSum mod 10)) mod 10 = number(substring($val, $length + 1, 1))"/>
   </function>
    <function xmlns="http://www.w3.org/1999/XSL/Transform"
             name="u:slack"
             as="xs:boolean">
      <param name="exp" as="xs:decimal"/>
      <param name="val" as="xs:decimal"/>
      <param name="slack" as="xs:decimal"/>
      <value-of select="xs:decimal($exp + $slack) &gt;= $val and xs:decimal($exp - $slack) &lt;= $val"/>
   </function>
    <function xmlns="http://www.w3.org/1999/XSL/Transform"
             name="u:mod11"
             as="xs:boolean">
      <param name="val"/>
      <variable name="length" select="string-length($val) - 1"/>
      <variable name="digits"
                select="reverse(for $i in string-to-codepoints(substring($val, 0, $length + 1)) return $i - 48)"/>
      <variable name="weightedSum"
                select="sum(for $i in (0 to $length - 1) return $digits[$i + 1] * (($i mod 6) + 2))"/>
      <value-of select="number($val) &gt; 0 and (11 - ($weightedSum mod 11)) mod 11 = number(substring($val, $length + 1, 1))"/>
   </function>
	  <function xmlns="http://www.w3.org/1999/XSL/Transform"
             name="u:checkCodiceIPA"
             as="xs:boolean">
      <param name="arg" as="xs:string?"/>
      <variable name="allowed-characters">ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789</variable>
      <sequence select="if ( (string-length(translate($arg, $allowed-characters, '')) = 0) and (string-length($arg) = 6) ) then true() else false()"/>
  </function>
	  <function xmlns="http://www.w3.org/1999/XSL/Transform"
             name="u:addPIVA"
             as="xs:integer">
      <param name="arg" as="xs:string"/>
      <param name="pari" as="xs:integer"/>
      <variable name="tappo"
                select="if (not($arg castable as xsd:integer)) then 0 else 1"/>
      <variable name="mapper"
                select="if ($tappo = 0) then 0 else                    ( if ($pari = 1)                     then ( xs:integer(substring('0246813579', ( xs:integer(substring($arg,1,1)) +1 ) ,1)) )                     else ( xs:integer(substring($arg,1,1) ) )                   )"/>
      <sequence select="if ($tappo = 0) then $mapper else ( xs:integer($mapper) + u:addPIVA(substring(xs:string($arg),2), (if($pari=0) then 1 else 0) ) )"/>
  </function>
	  <function xmlns="http://www.w3.org/1999/XSL/Transform"
             name="u:checkCF"
             as="xs:boolean">
      <param name="arg" as="xs:string?"/>
      <sequence select="   if ( (string-length($arg) = 16) or (string-length($arg) = 11) )      then    (    if ((string-length($arg) = 16))     then    (     if (u:checkCF16($arg))      then     (      true()     )     else     (      false()     )    )    else    (     if(($arg castable as xsd:integer)) then true() else false()       )   )   else   (    false()   )   "/>
  </function>
	  <function xmlns="http://www.w3.org/1999/XSL/Transform"
             name="u:checkCF16"
             as="xs:boolean">
      <param name="arg" as="xs:string?"/>
      <variable name="allowed-characters">ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz</variable>
      <sequence select="     if (  (string-length(translate(substring($arg,1,6), $allowed-characters, '')) = 0) and         (substring($arg,7,2) castable as xsd:integer) and        (string-length(translate(substring($arg,9,1), $allowed-characters, '')) = 0) and        (substring($arg,10,2) castable as xsd:integer) and         (substring($arg,12,3) castable as xsd:string) and        (substring($arg,15,1) castable as xsd:integer) and         (string-length(translate(substring($arg,16,1), $allowed-characters, '')) = 0)      )      then true()     else false()     "/>
  </function>
	  <function xmlns="http://www.w3.org/1999/XSL/Transform"
             name="u:checkPIVA"
             as="xs:integer">
      <param name="arg" as="xs:string?"/>
      <sequence select="     if (not($arg castable as xsd:integer))       then 1      else ( u:addPIVA($arg,xs:integer(0)) mod 10 )"/>
  </function>
	  <function xmlns="http://www.w3.org/1999/XSL/Transform"
             name="u:checkPIVAseIT"
             as="xs:boolean">
      <param name="arg" as="xs:string"/>
      <variable name="paese" select="substring($arg,1,2)"/>
      <variable name="codice" select="substring($arg,3)"/>
      <sequence select="       if ( $paese = 'IT' or $paese = 'it' )    then    (     if ( ( string-length($codice) = 11 ) and ( if (u:checkPIVA($codice)!=0) then false() else true() ))     then      (      true()     )     else     (      false()     )    )    else    (     true()    )      "/>
  </function>
	  <function xmlns="http://www.w3.org/1999/XSL/Transform"
             name="u:mod97-0208"
             as="xs:boolean">
      <param name="val"/>
      <variable name="checkdigits" select="substring($val,9,2)"/>
      <variable name="calculated_digits"
                select="xs:string(97 - (xs:integer(substring($val,1,8)) mod 97))"/>
      <value-of select="number($checkdigits) = number($calculated_digits)"/>
  </function>
	  <function xmlns="http://www.w3.org/1999/XSL/Transform"
             name="u:abn"
             as="xs:boolean">
	     <param name="val"/>
	     <value-of select="( ((string-to-codepoints(substring($val,1,1)) - 49) * 10) + ((string-to-codepoints(substring($val,2,1)) - 48) * 1) + ((string-to-codepoints(substring($val,3,1)) - 48) * 3) + ((string-to-codepoints(substring($val,4,1)) - 48) * 5) + ((string-to-codepoints(substring($val,5,1)) - 48) * 7) + ((string-to-codepoints(substring($val,6,1)) - 48) * 9) + ((string-to-codepoints(substring($val,7,1)) - 48) * 11) + ((string-to-codepoints(substring($val,8,1)) - 48) * 13) + ((string-to-codepoints(substring($val,9,1)) - 48) * 15) + ((string-to-codepoints(substring($val,10,1)) - 48) * 17) + ((string-to-codepoints(substring($val,11,1)) - 48) * 19)) mod 89 = 0 "/>
   </function>
    

    <pattern>
 
		    <rule context="//*[not(*) and not(normalize-space())]">
			      <assert id="PEPPOL-COMMON-R001" test="false()" flag="fatal">Document MUST not contain empty elements.</assert>
		    </rule> 
   
   </pattern>
    <pattern>

	     <rule context="/*">
		       <assert id="PEPPOL-COMMON-R003"
                 test="not(@*:schemaLocation)"
                 flag="warning">Document SHOULD not contain schema location.</assert>

	     </rule>

	     <rule context="cbc:IssueDate | cbc:DueDate | cbc:TaxPointDate | cbc:StartDate | cbc:EndDate | cbc:ActualDeliveryDate">
		       <assert id="PEPPOL-COMMON-R030"
                 test="(string(.) castable as xs:date) and (string-length(.) = 10)"
                 flag="fatal">A date must be formatted YYYY-MM-DD.</assert>
	     </rule>

	
	     <rule context="cbc:EndpointID[@schemeID = '0088'] | cac:PartyIdentification/cbc:ID[@schemeID = '0088'] | cbc:CompanyID[@schemeID = '0088']">
		       <assert id="PEPPOL-COMMON-R040"
                 test="matches(normalize-space(), '^[0-9]+$') and u:gln(normalize-space())"
                 flag="fatal">GLN must have a valid format according to GS1 rules.</assert>
	     </rule>
	     <rule context="cbc:EndpointID[@schemeID = '0192'] | cac:PartyIdentification/cbc:ID[@schemeID = '0192'] | cbc:CompanyID[@schemeID = '0192']">
		       <assert id="PEPPOL-COMMON-R041"
                 test="matches(normalize-space(), '^[0-9]{9}$') and u:mod11(normalize-space())"
                 flag="fatal">Norwegian organization number MUST be stated in the correct format.</assert>
	     </rule>
	     <rule context="cbc:EndpointID[@schemeID = '0208'] | cac:PartyIdentification/cbc:ID[@schemeID = '0208'] | cbc:CompanyID[@schemeID = '0208']">
		       <assert id="PEPPOL-COMMON-R043"
                 test="matches(normalize-space(), '^[0-9]{10}$') and u:mod97-0208(normalize-space())"
                 flag="fatal">Belgian enterprise number MUST be stated in the correct format.</assert>
	     </rule>
	     <rule context="cbc:EndpointID[@schemeID = '0201'] | cac:PartyIdentification/cbc:ID[@schemeID = '0201'] | cbc:CompanyID[@schemeID = '0201']">
		       <assert id="PEPPOL-COMMON-R044"
                 test="u:checkCodiceIPA(normalize-space())"
                 flag="warning">IPA Code (Codice Univoco Unità Organizzativa) must be stated in the correct format</assert>
	     </rule>
	     <rule context="cbc:EndpointID[@schemeID = '0210'] | cac:PartyIdentification/cbc:ID[@schemeID = '0210'] | cbc:CompanyID[@schemeID = '0210']">
		       <assert id="PEPPOL-COMMON-R045"
                 test="u:checkCF(normalize-space())"
                 flag="warning">Tax Code (Codice Fiscale) must be stated in the correct format</assert>
	     </rule>
	     <rule context="cbc:EndpointID[@schemeID = '9907']">
		       <assert id="PEPPOL-COMMON-R046"
                 test="u:checkCF(normalize-space())"
                 flag="warning">Tax Code (Codice Fiscale) must be stated in the correct format</assert>
	     </rule>
	     <rule context="cbc:EndpointID[@schemeID = '0211'] | cac:PartyIdentification/cbc:ID[@schemeID = '0211'] | cbc:CompanyID[@schemeID = '0211']">
		       <assert id="PEPPOL-COMMON-R047"
                 test="u:checkPIVAseIT(normalize-space())"
                 flag="warning">Italian VAT Code (Partita Iva) must be stated in the correct format</assert>
	     </rule>
	     <rule context="cbc:EndpointID[@schemeID = '9906']">
		       <assert id="PEPPOL-COMMON-R048"
                 test="u:checkPIVAseIT(normalize-space())"
                 flag="warning">Italian VAT Code (Partita Iva) must be stated in the correct format</assert>
	     </rule>
	     <rule context="cbc:EndpointID[@schemeID = '0007'] | cac:PartyIdentification/cbc:ID[@schemeID = '0007'] | cbc:CompanyID[@schemeID = '0007']">
		       <assert id="PEPPOL-COMMON-R049"
                 test="string-length(normalize-space()) = 10 and string(number(normalize-space())) != 'NaN'"
                 flag="fatal">Swedish organization number MUST be stated in the correct format.</assert>
	     </rule>
	     <rule context="cbc:EndpointID[@schemeID = '0151'] | cac:PartyIdentification/cbc:ID[@schemeID = '0151'] | cbc:CompanyID[@schemeID = '0151']">
		       <assert id="PEPPOL-COMMON-R050"
                 test="matches(normalize-space(), '^[0-9]{11}$') and u:abn(normalize-space())"
                 flag="fatal">Australian Business Number (ABN) MUST be stated in the correct format.</assert>
	     </rule>
   </pattern>
    
    <pattern>
        
        <let name="CatalogueValidityStart"
           value="if(exists(/ubl:Catalogue/cac:ValidityPeriod/cbc:StartDate)) then number(translate(/ubl:Catalogue/cac:ValidityPeriod/cbc:StartDate,'-','')) else 0"/>
        <let name="CatalogueValidityEnd"
           value="if(exists(/ubl:Catalogue/cac:ValidityPeriod/cbc:EndDate)) then number(translate(/ubl:Catalogue/cac:ValidityPeriod/cbc:EndDate,'-','')) else 99999999"/>



      <rule context="cbc:ProfileID">
        <assert id="PEPPOL-T19-R017"
                 test="some $p in tokenize('urn:fdc:peppol.eu:poacc:bis:catalogue_only:3 urn:fdc:peppol.eu:poacc:bis:catalogue_wo_response:3', '\s') satisfies $p = normalize-space(.)"
                 flag="fatal">An order transaction SHALL use profile catalogue only or catalogue without response.</assert>
      </rule>

	     <rule context="cbc:CustomizationID">
			      <assert id="PEPPOL-T19-R018"
                 test="starts-with(normalize-space(.), 'urn:fdc:peppol.eu:poacc:trns:catalogue:3')"
                 flag="fatal">Specification identifier SHALL start with the value 'urn:fdc:peppol.eu:poacc:trns:catalogue:3'.</assert>
	     </rule>    
    
      <rule context="/ubl:Catalogue/cac:ValidityPeriod">
        <assert id="PEPPOL-T19-R001"
                 test="$CatalogueValidityEnd &gt;= $CatalogueValidityStart"
                 flag="fatal">A validity period end date SHALL be later or equal to a validity period start date</assert>
      </rule>

      <rule context="cac:SellerSupplierParty">
        <assert id="PEPPOL-T19-R004"
                 test="(cac:Party/cac:PartyName/cbc:Name) or (cac:Party/cac:PartyIdentification/cbc:ID)"
                 flag="fatal">A catalogue supplier SHALL contain the full name or an identifier</assert>
      </rule>

      <rule context="cac:ContractorCustomerParty">
        <assert id="PEPPOL-T19-R005"
                 test="(cac:Party/cac:PartyName/cbc:Name) or (cac:Party/cac:PartyIdentification/cbc:ID)"
                 flag="fatal">A catalogue customer SHALL contain the full name or an identifier</assert>
      </rule>

	
      <rule context="cac:CatalogueLine">
        
        <let name="CatalogueLineValidityStart"
              value="if(exists(cac:LineValidityPeriod/cbc:StartDate)) then number(translate(cac:LineValidityPeriod/cbc:StartDate,'-','')) else $CatalogueValidityStart"/>
        <let name="CatalogueLineValidityEnd"
              value="if(exists(cac:LineValidityPeriod/cbc:EndDate)) then number(translate(cac:LineValidityPeriod/cbc:EndDate,'-','')) else $CatalogueValidityEnd"/>
        
        <assert id="PEPPOL-T19-R008"
                 test="not(cbc:MaximumOrderQuantity) or number(cbc:MaximumOrderQuantity) &gt;= 0"
                 flag="fatal">Maximum quantity SHALL be greater than zero</assert>

        <assert id="PEPPOL-T19-R009"
                 test="not(cbc:MinimumOrderQuantity) or number(cbc:MinimumOrderQuantity) &gt;= 0"
                 flag="fatal">Minimum quantity SHALL be greater than zero</assert>

        <assert id="PEPPOL-T19-R010"
                 test="not(cbc:MaximumOrderQuantity) or not(cbc:MinimumOrderQuantity) or number(cbc:MaximumOrderQuantity) &gt;= number(cbc:MinimumOrderQuantity)"
                 flag="fatal">Maximum quantity SHALL be greater or equal to the Minimum quantity</assert>
               
        <assert id="PEPPOL-T19-R007"
                 test="($CatalogueLineValidityStart &gt;= $CatalogueValidityStart) and ($CatalogueLineValidityStart &lt;= $CatalogueValidityEnd)              and ($CatalogueLineValidityEnd &lt;= $CatalogueValidityEnd) and ($CatalogueLineValidityEnd &gt;= $CatalogueValidityStart)"
                 flag="fatal">Catalogue line validity period SHALL be within the range of the whole catalogue validity period</assert>
        <assert id="PEPPOL-T19-R013"
                 test="($CatalogueLineValidityStart &lt;= $CatalogueLineValidityEnd)"
                 flag="fatal">A line validity period end date SHALL be later or equal to the line validity period start date
        </assert>
      </rule>
    
      <rule context="cac:RequiredItemLocationQuantity">
        
        <let name="CatalogueLineValidityStart"
              value="if(exists(../cac:LineValidityPeriod/cbc:StartDate)) then number(translate(../cac:LineValidityPeriod/cbc:StartDate,'-','')) else $CatalogueValidityStart"/>
        <let name="CatalogueLineValidityEnd"
              value="if(exists(../cac:LineValidityPeriod/cbc:EndDate)) then number(translate(../cac:LineValidityPeriod/cbc:EndDate,'-','')) else $CatalogueValidityEnd"/>
        <let name="CataloguePriceValidityStart"
              value="if(exists(cac:Price/cac:ValidityPeriod/cbc:StartDate)) then number(translate(cac:Price/cac:ValidityPeriod/cbc:StartDate,'-','')) else $CatalogueLineValidityStart"/>
        <let name="CataloguePriceValidityEnd"
              value="if(exists(cac:Price/cac:ValidityPeriod/cbc:EndDate)) then number(translate(cac:Price/cac:ValidityPeriod/cbc:EndDate,'-','')) else $CatalogueLineValidityEnd"/>

        <assert id="PEPPOL-T19-R006"
                 test="number(cac:Price/cbc:PriceAmount) &gt;=0"
                 flag="fatal">Prices of items SHALL not be negative</assert>
        
        <assert id="PEPPOL-T19-R011"
                 test="($CataloguePriceValidityStart &gt;= $CatalogueLineValidityStart) and ($CataloguePriceValidityStart &lt;= $CatalogueLineValidityEnd)              and ($CataloguePriceValidityEnd &lt;= $CatalogueLineValidityEnd) and ($CataloguePriceValidityEnd &gt;= $CatalogueLineValidityStart)"
                 flag="fatal">Price validity start date SHALL be within the range of the catalogue line or catalogue validity period</assert>
        <assert id="PEPPOL-T19-R016"
                 test="($CataloguePriceValidityStart &lt;= $CataloguePriceValidityEnd)"
                 flag="fatal">A price validity period end date SHALL be later or equal to the price validity period start date
        </assert>
      </rule>

      <rule context="cac:ClassifiedTaxCategory">
        <assert id="PEPPOL-T19-R014"
                 test="cbc:Percent or (normalize-space(cbc:ID)='O')"
                 flag="fatal">Each Tax Category SHALL have a TAX category rate, except if the catalogue line is not subject to TAX.</assert>
        <assert id="PEPPOL-T19-R015"
                 test="not(normalize-space(cbc:ID)='S') or (cbc:Percent) &gt; 0"
                 flag="fatal">When TAX category code is "Standard rated" (S) the TAX rate SHALL be greater than zero.</assert>
      </rule>

      <rule context="cac:Item">
        <assert id="PEPPOL-T19-R012"
                 test="(cac:StandardItemIdentification/cbc:ID) or (cac:SellersItemIdentification/cbc:ID)"
                 flag="fatal">Each item in a Catalogue line SHALL be identifiable by either "item sellers identifier" or "item standard identifier"</assert>
      </rule>



   </pattern>

</schema>
