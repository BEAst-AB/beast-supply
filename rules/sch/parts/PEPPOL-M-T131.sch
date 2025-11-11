<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">

	<rule context="ubl:WasteMovement/cac:SenderParty">
		<assert id="PEPPOL-T131-R031" test="cac:PartyName or cac:PartyIdentification" 
				flag="fatal"> [PEPPOL-T131-R031] Party must include either a party name or a party identification.</assert>
	</rule>
	<rule context="ubl:WasteMovement/cac:ReceiverParty">
		<assert id="PEPPOL-T131-R032" test="cac:PartyName or cac:PartyIdentification" 
				flag="fatal"> [PEPPOL-T131-R032] Party must include either a party name or a party identification.</assert>
	</rule>


</pattern>

