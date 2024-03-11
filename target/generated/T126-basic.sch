<?xml version="1.0" encoding="UTF-8" standalone="yes"?><pattern xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:ns2="http://www.schematron-quickfix.com/validator/process"><let name="cleas" value="tokenize('0002 0007 0009 0037 0060 0088 0096 0097 0106 0130 0135 0142 0151 0183 0184 0188 0190 0191 0192 0193 0195 0196 0198 0199 0200 0201 0202 0204 0208 0209 0210 0211 0212 0213 0215 0216 0218 0221 0230 9901 9910 9913 9914 9915 9918 9919 9920 9922 9923 9924 9925 9926 9927 9928 9929 9930 9931 9932 9933 9934 9935 9936 9937 9938 9939 9940 9941 9942 9943 9944 9945 9946 9947 9948 9949 9950 9951 9952 9953 9957 9959', '\s')"/><let name="clISO3166" value="tokenize('AD AE AF AG AI AL AM AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BJ BL BM BN BO BQ BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CW CX CY CZ DE DJ DK DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RE RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR SS ST SV SX SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS YE YT ZA ZM ZW 1A XI', '\s')"/><let name="clTransportationStatusTypeCode" value="tokenize('3 4', '\s')"/><let name="clTransportEventTypeCode" value="tokenize('1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 44 45 46 47 48 49 50 51 53 54 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 161 162 163 164 165 166 167 168 169 170 171 172 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 218 219 220 222 224 225 227 228 229 231 232 233 234 235 236 238 239 240 241 242 243 247 248 250 251 253 254 255 256 258 260 265 266 267 269 270 271 272 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287 288 291 292 295 297 298 299 300 301 302 306 307 308 309 310 311 312 313 314 315 316 317 318 319 320 321 322 323 324 325 326 327 328 329 330 331 332 333 334 335 336 337 338 339 340 341 342 343 344 345 346 347 348 349 350 351 352 353 354 355 356 357 358 359 360 361 362 363 364 365 366 367 368 369 370', '\s')"/><let name="clICD" value="tokenize('0002 0003 0004 0005 0006 0007 0008 0009 0010 0011 0012 0013 0014 0015 0016 0017 0018 0019 0020 0021 0022 0023 0024 0025 0026 0027 0028 0029 0030 0031 0032 0033 0034 0035 0036 0037 0038 0039 0040 0041 0042 0043 0044 0045 0046 0047 0048 0049 0050 0051 0052 0053 0054 0055 0056 0057 0058 0059 0060 0061 0062 0063 0064 0065 0066 0067 0068 0069 0070 0071 0072 0073 0074 0075 0076 0077 0078 0079 0080 0081 0082 0083 0084 0085 0086 0087 0088 0089 0090 0091 0093 0094 0095 0096 0097 0098 0099 0100 0101 0102 0104 0105 0106 0107 0108 0109 0110 0111 0112 0113 0114 0115 0116 0117 0118 0119 0120 0121 0122 0123 0124 0125 0126 0127 0128 0129 0130 0131 0132 0133 0134 0135 0136 0137 0138 0139 0140 0141 0142 0143 0144 0145 0146 0147 0148 0149 0150 0151 0152 0153 0154 0155 0156 0157 0158 0159 0160 0161 0162 0163 0164 0165 0166 0167 0168 0169 0170 0171 0172 0173 0174 0175 0176 0177 0178 0179 0180 0183 0184 0185 0186 0187 0188 0189 0190 0191 0192 0193 0194 0195 0196 0197 0198 0199 0200 0201 0202 0203 0204 0205 0206 0207 0208 0209 0210 0211 0212 0213 0214 0215 0216 0217 0218 0219 0220 0221 0222 0223 0224 0225 0226 0227 0228 0229 0230', '\s')"/><rule context="/ubl:TransportationStatusRequest"><assert test="cbc:CustomizationID" flag="fatal" id="PEPPOL-T126-B00101">Element 'cbc:CustomizationID' MUST be provided.</assert><assert test="cbc:ProfileID" flag="fatal" id="PEPPOL-T126-B00102">Element 'cbc:ProfileID' MUST be provided.</assert><assert test="cbc:ID" flag="fatal" id="PEPPOL-T126-B00103">Element 'cbc:ID' MUST be provided.</assert><assert test="cbc:IssueDate" flag="fatal" id="PEPPOL-T126-B00104">Element 'cbc:IssueDate' MUST be provided.</assert><assert test="cbc:IssueTime" flag="fatal" id="PEPPOL-T126-B00105">Element 'cbc:IssueTime' MUST be provided.</assert><assert test="cbc:ShippingOrderID" flag="fatal" id="PEPPOL-T126-B00106">Element 'cbc:ShippingOrderID' MUST be provided.</assert><assert test="cbc:TransportationStatusTypeCode" flag="fatal" id="PEPPOL-T126-B00107">Element 'cbc:TransportationStatusTypeCode' MUST be provided.</assert><assert test="cac:SenderParty" flag="fatal" id="PEPPOL-T126-B00108">Element 'cac:SenderParty' MUST be provided.</assert><assert test="cac:ReceiverParty" flag="fatal" id="PEPPOL-T126-B00109">Element 'cac:ReceiverParty' MUST be provided.</assert><assert test="not(@*:schemaLocation)" flag="fatal" id="PEPPOL-T126-B00110">Document MUST not contain schema location.</assert></rule><rule context="/ubl:TransportationStatusRequest/cbc:CustomizationID"/><rule context="/ubl:TransportationStatusRequest/cbc:ProfileID"/><rule context="/ubl:TransportationStatusRequest/cbc:ID"/><rule context="/ubl:TransportationStatusRequest/cbc:IssueDate"/><rule context="/ubl:TransportationStatusRequest/cbc:IssueTime"/><rule context="/ubl:TransportationStatusRequest/cbc:ShippingOrderID"><assert test="@schemeID" flag="fatal" id="PEPPOL-T126-B00701">Attribute 'schemeID' MUST be present.</assert></rule><rule context="/ubl:TransportationStatusRequest/cbc:TransportationStatusTypeCode"><assert test="(some $code in $clTransportationStatusTypeCode satisfies $code = normalize-space(text()))" flag="fatal" id="PEPPOL-T126-B00901">Value MUST be part of code list 'Transportation Status Type Code (openPEPPOL)'.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty"><assert test="cbc:EndpointID" flag="fatal" id="PEPPOL-T126-B01001">Element 'cbc:EndpointID' MUST be provided.</assert><assert test="cac:PartyLegalEntity" flag="fatal" id="PEPPOL-T126-B01002">Element 'cac:PartyLegalEntity' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cbc:EndpointID"><assert test="@schemeID" flag="fatal" id="PEPPOL-T126-B01101">Attribute 'schemeID' MUST be present.</assert><assert test="not(@schemeID) or (some $code in $cleas satisfies $code = @schemeID)" flag="fatal" id="PEPPOL-T126-B01102">Value MUST be part of code list 'Electronic Address Scheme (EAS)'.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyIdentification"><assert test="cbc:ID" flag="fatal" id="PEPPOL-T126-B01301">Element 'cbc:ID' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyIdentification/cbc:ID"><assert test="@schemeID" flag="fatal" id="PEPPOL-T126-B01401">Attribute 'schemeID' MUST be present.</assert><assert test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)" flag="fatal" id="PEPPOL-T126-B01402">Value MUST be part of code list 'ISO 6523 ICD list'.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyName"><assert test="cbc:Name" flag="fatal" id="PEPPOL-T126-B01601">Element 'cbc:Name' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyName/cbc:Name"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PostalAddress"><assert test="cac:Country" flag="fatal" id="PEPPOL-T126-B01801">Element 'cac:Country' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PostalAddress/cbc:StreetName"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PostalAddress/cbc:AdditionalStreetName"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PostalAddress/cbc:CityName"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PostalAddress/cbc:PostalZone"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PostalAddress/cbc:CountrySubentity"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PostalAddress/cac:AddressLine"><assert test="cbc:Line" flag="fatal" id="PEPPOL-T126-B02401">Element 'cbc:Line' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PostalAddress/cac:AddressLine/cbc:Line"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PostalAddress/cac:Country"><assert test="cbc:IdentificationCode" flag="fatal" id="PEPPOL-T126-B02601">Element 'cbc:IdentificationCode' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode"><assert test="(some $code in $clISO3166 satisfies $code = normalize-space(text()))" flag="fatal" id="PEPPOL-T126-B02701">Value MUST be part of code list 'Country codes (ISO 3166-1:Alpha2)'.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PostalAddress/cac:Country/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B02602">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PostalAddress/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B01802">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyTaxScheme"><assert test="cbc:CompanyID" flag="fatal" id="PEPPOL-T126-B02801">Element 'cbc:CompanyID' MUST be provided.</assert><assert test="cac:TaxScheme" flag="fatal" id="PEPPOL-T126-B02802">Element 'cac:TaxScheme' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyTaxScheme/cbc:CompanyID"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyTaxScheme/cac:TaxScheme"><assert test="cbc:ID" flag="fatal" id="PEPPOL-T126-B03001">Element 'cbc:ID' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyTaxScheme/cac:TaxScheme/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B03002">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyTaxScheme/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B02803">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyLegalEntity"><assert test="cbc:RegistrationName" flag="fatal" id="PEPPOL-T126-B03201">Element 'cbc:RegistrationName' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyLegalEntity/cbc:RegistrationName"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyLegalEntity/cbc:CompanyID"><assert test="@schemeID" flag="fatal" id="PEPPOL-T126-B03401">Attribute 'schemeID' MUST be present.</assert><assert test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)" flag="fatal" id="PEPPOL-T126-B03402">Value MUST be part of code list 'ISO 6523 ICD list'.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyLegalEntity/cac:RegistrationAddress"><assert test="cac:Country" flag="fatal" id="PEPPOL-T126-B03601">Element 'cac:Country' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country"><assert test="cbc:IdentificationCode" flag="fatal" id="PEPPOL-T126-B03801">Element 'cbc:IdentificationCode' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode"><assert test="(some $code in $clISO3166 satisfies $code = normalize-space(text()))" flag="fatal" id="PEPPOL-T126-B03901">Value MUST be part of code list 'Country codes (ISO 3166-1:Alpha2)'.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B03802">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyLegalEntity/cac:RegistrationAddress/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B03602">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:PartyLegalEntity/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B03202">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:Contact"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:Contact/cbc:Name"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:Contact/cbc:Telephone"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:Contact/cbc:ElectronicMail"/><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/cac:Contact/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B04001">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:SenderParty/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B01003">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty"><assert test="cbc:EndpointID" flag="fatal" id="PEPPOL-T126-B04401">Element 'cbc:EndpointID' MUST be provided.</assert><assert test="cac:PartyLegalEntity" flag="fatal" id="PEPPOL-T126-B04402">Element 'cac:PartyLegalEntity' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cbc:EndpointID"><assert test="@schemeID" flag="fatal" id="PEPPOL-T126-B04501">Attribute 'schemeID' MUST be present.</assert><assert test="not(@schemeID) or (some $code in $cleas satisfies $code = @schemeID)" flag="fatal" id="PEPPOL-T126-B04502">Value MUST be part of code list 'Electronic Address Scheme (EAS)'.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyIdentification"><assert test="cbc:ID" flag="fatal" id="PEPPOL-T126-B04701">Element 'cbc:ID' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyIdentification/cbc:ID"><assert test="@schemeID" flag="fatal" id="PEPPOL-T126-B04801">Attribute 'schemeID' MUST be present.</assert><assert test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)" flag="fatal" id="PEPPOL-T126-B04802">Value MUST be part of code list 'ISO 6523 ICD list'.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyName"><assert test="cbc:Name" flag="fatal" id="PEPPOL-T126-B05001">Element 'cbc:Name' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyName/cbc:Name"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PostalAddress"><assert test="cac:Country" flag="fatal" id="PEPPOL-T126-B05201">Element 'cac:Country' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PostalAddress/cbc:StreetName"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PostalAddress/cbc:AdditionalStreetName"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PostalAddress/cbc:CityName"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PostalAddress/cbc:PostalZone"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PostalAddress/cbc:CountrySubentity"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PostalAddress/cac:AddressLine"><assert test="cbc:Line" flag="fatal" id="PEPPOL-T126-B05801">Element 'cbc:Line' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PostalAddress/cac:AddressLine/cbc:Line"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PostalAddress/cac:Country"><assert test="cbc:IdentificationCode" flag="fatal" id="PEPPOL-T126-B06001">Element 'cbc:IdentificationCode' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode"><assert test="(some $code in $clISO3166 satisfies $code = normalize-space(text()))" flag="fatal" id="PEPPOL-T126-B06101">Value MUST be part of code list 'Country codes (ISO 3166-1:Alpha2)'.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PostalAddress/cac:Country/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B06002">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PostalAddress/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B05202">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyTaxScheme"><assert test="cbc:CompanyID" flag="fatal" id="PEPPOL-T126-B06201">Element 'cbc:CompanyID' MUST be provided.</assert><assert test="cac:TaxScheme" flag="fatal" id="PEPPOL-T126-B06202">Element 'cac:TaxScheme' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyTaxScheme/cbc:CompanyID"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyTaxScheme/cac:TaxScheme"><assert test="cbc:ID" flag="fatal" id="PEPPOL-T126-B06401">Element 'cbc:ID' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyTaxScheme/cac:TaxScheme/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B06402">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyTaxScheme/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B06203">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyLegalEntity"><assert test="cbc:RegistrationName" flag="fatal" id="PEPPOL-T126-B06601">Element 'cbc:RegistrationName' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyLegalEntity/cbc:RegistrationName"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID"><assert test="@schemeID" flag="fatal" id="PEPPOL-T126-B06801">Attribute 'schemeID' MUST be present.</assert><assert test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)" flag="fatal" id="PEPPOL-T126-B06802">Value MUST be part of code list 'ISO 6523 ICD list'.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress"><assert test="cac:Country" flag="fatal" id="PEPPOL-T126-B07001">Element 'cac:Country' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country"><assert test="cbc:IdentificationCode" flag="fatal" id="PEPPOL-T126-B07201">Element 'cbc:IdentificationCode' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode"><assert test="(some $code in $clISO3166 satisfies $code = normalize-space(text()))" flag="fatal" id="PEPPOL-T126-B07301">Value MUST be part of code list 'Country codes (ISO 3166-1:Alpha2)'.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B07202">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B07002">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:PartyLegalEntity/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B06602">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:Contact"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:Contact/cbc:Name"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:Contact/cbc:Telephone"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:Contact/cbc:ElectronicMail"/><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/cac:Contact/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B07401">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:ReceiverParty/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B04403">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:TransportExecutionPlanDocumentReference"><assert test="cbc:ID" flag="fatal" id="PEPPOL-T126-B07801">Element 'cbc:ID' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:TransportExecutionPlanDocumentReference/cbc:ID"/><rule context="/ubl:TransportationStatusRequest/cac:TransportExecutionPlanDocumentReference/cbc:IssueDate"/><rule context="/ubl:TransportationStatusRequest/cac:TransportExecutionPlanDocumentReference/cbc:IssueTime"/><rule context="/ubl:TransportationStatusRequest/cac:TransportExecutionPlanDocumentReference/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B07802">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:Consignment"><assert test="cbc:ID" flag="fatal" id="PEPPOL-T126-B08201">Element 'cbc:ID' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:Consignment/cbc:ID"/><rule context="/ubl:TransportationStatusRequest/cac:Consignment/cac:TransportEvent"/><rule context="/ubl:TransportationStatusRequest/cac:Consignment/cac:TransportEvent/cbc:IdentificationID"/><rule context="/ubl:TransportationStatusRequest/cac:Consignment/cac:TransportEvent/cbc:TransportEventTypeCode"><assert test="(some $code in $clTransportEventTypeCode satisfies $code = normalize-space(text()))" flag="fatal" id="PEPPOL-T126-B08601">Value MUST be part of code list 'Transport Event Type Code (openPEPPOL)'.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:Consignment/cac:TransportEvent/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B08401">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:Consignment/cac:TransportHandlingUnit"><assert test="cbc:ID" flag="fatal" id="PEPPOL-T126-B08701">Element 'cbc:ID' MUST be provided.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:Consignment/cac:TransportHandlingUnit/cbc:ID"><assert test="@schemeID" flag="fatal" id="PEPPOL-T126-B08801">Attribute 'schemeID' MUST be present.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:Consignment/cac:TransportHandlingUnit/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B08702">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/cac:Consignment/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B08202">Document MUST NOT contain elements not part of the data model.</assert></rule><rule context="/ubl:TransportationStatusRequest/*"><assert test="false()" flag="fatal" id="PEPPOL-T126-B00111">Document MUST NOT contain elements not part of the data model.</assert></rule></pattern>