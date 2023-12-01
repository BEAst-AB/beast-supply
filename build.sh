#!/bin/sh

PROJECT=$(dirname $(readlink -f "$0"))

POACCBASEURL="https://raw.githubusercontent.com/OpenPEPPOL/poacc-upgrade-3/master/structure/syntax/"
echo $POACCBASEURL

LOGISTICSBASEURL="https://raw.githubusercontent.com/OpenPEPPOL/logistics-bis/qa/structure/syntax/"
echo $LOGISTICSBASEURL

# Delete target folder if found
if [ -e $PROJECT/target ]; then
    docker run --rm -i -v $PROJECT:/src alpine:3.6 rm -rf /src/target
fi

# Transform the files in source dir to syntax.
echo "Transforming files from source to syntax"
echo "Generating documentation: Invoice"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-invoice.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-invoice.xml UblBaseUrl=https://raw.githubusercontent.com/OpenPEPPOL/peppol-bis-invoice-3/master/structure/syntax/ UblDocBaseUrl="" UblXmlReferenceFile=ubl-invoice.xml -ext:on --allow-external-functions:on
echo "Generating documentation: Order"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-order.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-order.xml UblBaseUrl=$POACCBASEURL UblDocBaseUrl=$POACCBASEURL UblXmlReferenceFile=ubl-order.xml -ext:on --allow-external-functions:on
echo "Generating documentation: Order response"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-order-response.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-order-response.xml UblBaseUrl=$POACCBASEURL UblDocBaseUrl="" UblXmlReferenceFile=ubl-order-response.xml -ext:on --allow-external-functions:on
echo "Generating documentation: Order agreement"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-orderagreement.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-orderagreement.xml UblBaseUrl=$POACCBASEURL UblDocBaseUrl="" UblXmlReferenceFile=ubl-orderagreement.xml -ext:on --allow-external-functions:on
echo "Generating documentation: Catalogue"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-catalogue.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-catalogue.xml UblBaseUrl=$POACCBASEURL UblDocBaseUrl="" UblXmlReferenceFile=ubl-catalogue.xml -ext:on --allow-external-functions:on
echo "Generating documentation: Advanced Despatch advice"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-advanced-despatch-advice.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-advanced-despatch-advice.xml UblBaseUrl=$LOGISTICSBASEURL UblDocBaseUrl="" UblXmlReferenceFile=ubl-advanced-despatch-advice.xml -ext:on --allow-external-functions:on
echo "Generating documentation: Weight statement"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-weight-statement.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-weight-statement.xml UblBaseUrl=$LOGISTICSBASEURL UblDocBaseUrl="" UblXmlReferenceFile=ubl-weight-statement.xml -ext:on --allow-external-functions:on
echo "Generating documentation: Transport execution plan request"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-transport-execution-plan-request.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-transport-execution-plan-request.xml UblBaseUrl=$LOGISTICSBASEURL UblDocBaseUrl="" UblXmlReferenceFile=ubl-transport-execution-plan-request.xml -ext:on --allow-external-functions:on
echo "Generating documentation: Transport execution plan"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-transport-execution-plan.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-transport-execution-plan.xml UblBaseUrl=$LOGISTICSBASEURL UblDocBaseUrl="" UblXmlReferenceFile=ubl-transport-execution-plan.xml -ext:on --allow-external-functions:on
echo "Generating documentation: Waybill"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-waybill.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-waybill.xml UblBaseUrl=$LOGISTICSBASEURL UblDocBaseUrl="" UblXmlReferenceFile=ubl-waybill.xml -ext:on --allow-external-functions:on
echo "Generating documentation: Transportation Status Request"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-transportation-status-request.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-transportation-status-request.xml  UblBaseUrl=$LOGISTICSBASEURL UblDocBaseUrl="" UblXmlReferenceFile=ubl-transportation-status-request.xml -ext:on --allow-external-functions:on
echo "Generating documentation: Transportation Status"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-transportation-status.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-transportation-status.xml UblBaseUrl=$LOGISTICSBASEURL UblDocBaseUrl="" UblXmlReferenceFile=ubl-transportation-status.xml -ext:on --allow-external-functions:on
echo "Generating documentation: Receipt Advice"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-receipt-advice.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-receipt-advice.xml UblBaseUrl=$LOGISTICSBASEURL UblDocBaseUrl="" UblXmlReferenceFile=ubl-receipt-advice.xml -ext:on --allow-external-functions:on


# Generate mapping documents.
echo "Generating mapping documents: Invoice"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/syntax/ubl-invoice.xml -xsl:/src/tools/create-mapping-document.xsl -o:/src/rules/mapping/Invoice.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Order"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/syntax/ubl-order.xml -xsl:/src/tools/create-mapping-document.xsl -o:/src/rules/mapping/Order.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Order response"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/syntax/ubl-order-response.xml -xsl:/src/tools/create-mapping-document.xsl -o:/src/rules/mapping/OrderResponse.xml  -ext:on --allow-external-functions:on
echo "Generating mapping documents: Order agreement"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/syntax/ubl-orderagreement.xml -xsl:/src/tools/create-mapping-document.xsl -o:/src/rules/mapping/Orderagreement.xml -ext:on --allow-external-functions:on
#echo ""Generating mapping documents: Catalogue"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/syntax/ubl-catalogue.xml -xsl:/src/tools/create-mapping-document.xsl -o:/src/rules/mapping/Catalogue.xml  -ext:on --allow-external-functions:on
echo "Generating mapping documents: Advanced Despatch advice"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/syntax/ubl-advanced-despatch-advice.xml -xsl:/src/tools/create-mapping-document.xsl -o:/src/rules/mapping/AdvancedDespatchAdvice.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Weight statement"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/syntax/ubl-weight-statement.xml -xsl:/src/tools/create-mapping-document.xsl -o:/src/rules/mapping/WeightStatement.xml  -ext:on --allow-external-functions:on
echo "Generating mapping documents: Transport execution plan request"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/syntax/ubl-transport-execution-plan-request.xml -xsl:/src/tools/create-mapping-document.xsl -o:/src/rules/mapping/TransportExecutionPlanRequest.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Transport execution plan"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/syntax/ubl-transport-execution-plan.xml -xsl:/src/tools/create-mapping-document.xsl -o:/src/rules/mapping/TransportExecutionPlan.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Waybill"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/syntax/ubl-waybill.xml -xsl:/src/tools/create-mapping-document.xsl -o:/src/rules/mapping/Waybill.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Transportation Status Request"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/syntax/ubl-transportation-status-request.xml -xsl:/src/tools/create-mapping-document.xsl -o:/src/rules/mapping/TransportationStatusRequest.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Transportation Status"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/syntax/ubl-transportation-status.xml -xsl:/src/tools/create-mapping-document.xsl -o:/src/rules/mapping/TransportationStatus.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Receipt Advice"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/syntax/ubl-receipt-advice.xml -xsl:/src/tools/create-mapping-document.xsl -o:/src/rules/mapping/ReceiptAdvice.xml -ext:on --allow-external-functions:on

echo "Pulling atomgraph/saxon container"
docker pull atomgraph/saxon

# Create examples based on documentation.
echo "Generating example: Advanced Despatch advice"
# docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
#     -s:/src/structure/source/ubl-advanced-despatch-advice.xml \
  #   -xsl:/src/tools/create-example.xsl \
    # -o:/src/rules/examples/AdvancedDespatchAdvice_Example_Full.xml \
    # overrideFile=src/structure/source/ubl-advanced-despatch-advice.xml -ext:on --allow-external-functions:on
echo "Generating example: Weight statement"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target klakegg/saxon xslt -s:/src/structure/source/ubl-weight-statement.xml -xsl:/src/tools/create-example.xsl -o:/src/rules/examples/WeightStatement_Example_Full.xml  -ext:on --allow-external-functions:on
echo "Generating example: Transport execution plan request"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:latest -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-transport-execution-plan-request.xml -xsl:/src/tools/remove-pi.xsl -o:/src/rules/examples/TransportExecutionPlanRequest_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Transport execution plan"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-transport-execution-plan.xml -xsl:/src/tools/remove-pi.xsl -o:/src/rules/examples/TransportExecutionPlan_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Waybill"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.9.1-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-waybill.xml -xsl:/src/tools/remove-pi.xsl -o:/src/rules/examples/Waybill_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Transportation Status Request "
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.9.1-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-transportation-status-request.xml -xsl:/src/tools/remove-pi.xsl -o:/src/rules/examples/TransportationStatusRequest_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Transportation Status"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.9.1-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-transportation-status.xml -xsl:/src/tools/remove-pi.xsl -o:/src/rules/examples/TransportationStatus_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Receipt Advice"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.9.1-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-receipt-advice.xml -xsl:/src/tools/remove-pi.xsl -o:/src/rules/examples/ReceiptAdvice_Example_Full.xml  -ext:on --allow-external-functions:on

# Structure
docker run --rm -i \
    -v $PROJECT:/src \
    -v $PROJECT/target:/target \
    difi/vefa-structure:0.6.1

# Testing validation rules
docker run --rm -i -v $PROJECT:/src anskaffelser/validator:2.1.0 build -x -t -n eu.peppol.poacc.upgrade.v3 -a rules -target target/validator-test /src

# Schematron
for sch in $PROJECT/rules/sch/*.sch; do
    docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/schematron:/target klakegg/schematron prepare /src/rules/sch/$(basename $sch) /target/$(basename $sch)
done
docker run --rm -i -v $PROJECT/target/site/files:/src alpine:3.6 rm -rf /src/Schematron.zip
docker run --rm -i -v $PROJECT/target/schematron:/src -v $PROJECT/target/site/files:/target -w /src kramos/alpine-zip -r /target/Schematron.zip .

# Example files
docker run --rm -i -v $PROJECT/target/site/files:/src alpine:3.6 rm -rf /src/Examples.zip
docker run --rm -i -v $PROJECT/rules/examples:/src -v $PROJECT/target/site/files:/target -w /src kramos/alpine-zip -r /target/Examples.zip .

# Mapping files
docker run --rm -i -v $PROJECT/target/site/files:/src alpine:3.6 rm -rf /src/Mapping.zip
docker run --rm -i -v $PROJECT/rules/mapping:/src -v $PROJECT/target/site/files:/target -w /src kramos/alpine-zip -r /target/Mapping.zip .

# Guides
docker run --rm -i -v $PROJECT:/documents -v $PROJECT/target:/target difi/asciidoctor

# Fix ownership
docker run --rm -i -v $PROJECT:/src alpine:3.6 chown -R $(id -g $USER).$(id -g $USER) /src/target
