#!/bin/sh
 
PROJECT=$(dirname $(readlink -f "$0"))

POACCBASEURL="https://raw.githubusercontent.com/OpenPEPPOL/poacc-upgrade-3/2025-Q2/structure/syntax/"
echo $POACCBASEURL

LOGISTICSBASEURL="https://raw.githubusercontent.com/OpenPEPPOL/logistics-bis/main/structure/syntax/"
echo $LOGISTICSBASEURL
 
# Delete target folder if found
if [ -e $PROJECT/target ]; then
    docker run --rm -i -v $PROJECT:/src alpine:3.6 rm -rf /src/target
fi

echo "Pulling klakegg/saxon container"
docker pull klakegg/saxon:9.8.0-7

echo "Pulling atomgraph/saxon container"
docker pull atomgraph/saxon

# Transform the files in source dir to syntax.
echo "Generating documentation: Invoice"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:https://raw.githubusercontent.com/OpenPEPPOL/peppol-bis-invoice-3/2025-Q2/structure/syntax/ubl-invoice.xml \
    -xsl:/src/tools/create-syntax.xsl \
    -o:/src/structure/syntax/ubl-invoice.xml \
    varOverrideSample=/src/structure/source/ubl-invoice.xml -ext:on --allow-external-functions:on

echo "Generating documentation: Order"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-order_poacc_temp_fix.xml \
    -xsl:/src/tools/create-syntax.xsl \
    -o:/src/structure/syntax/ubl-order.xml \
    varOverrideSample=/src/structure/source/ubl-order.xml -ext:on --allow-external-functions:on

echo "Generating documentation: Order response"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:$POACCBASEURL/ubl-order-response.xml \
    -xsl:/src/tools/create-syntax.xsl \
    -o:/src/structure/syntax/ubl-order-response.xml \
    varOverrideSample=/src/structure/source/ubl-order-response.xml -ext:on --allow-external-functions:on

echo "Generating documentation: Order agreement"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-orderagreement_poacc_temp_fix.xml \
    -xsl:/src/tools/create-syntax.xsl \
    -o:/src/structure/syntax/ubl-orderagreement.xml \
    varOverrideSample=/src/structure/source/ubl-orderagreement.xml -ext:on --allow-external-functions:on

echo "Generating documentation: Catalogue"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-catalogue_poacc_temp_fix.xml \
    -xsl:/src/tools/create-syntax.xsl \
    -o:/src/structure/syntax/ubl-catalogue.xml \
    varOverrideSample=/src/structure/source/ubl-catalogue.xml -ext:on --allow-external-functions:on
    
echo "Generating documentation: Catalogue-response"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:$POACCBASEURL/ubl-catalogue-response.xml \
    -xsl:/src/tools/create-syntax.xsl \
    -o:/src/structure/syntax/ubl-catalogue-response.xml \
    varOverrideSample=/src/structure/source/ubl-catalogue-response.xml -ext:on --allow-external-functions:on

echo "Generating documentation: Advanced Despatch advice"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:$LOGISTICSBASEURL/ubl-advanced-despatch-advice.xml \
    -xsl:/src/tools/create-syntax.xsl \
    -o:/src/structure/syntax/ubl-advanced-despatch-advice.xml \
     varOverrideSample=/src/structure/source/ubl-advanced-despatch-advice.xml -ext:on --allow-external-functions:on

echo "Generating documentation: Weight statement"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:$LOGISTICSBASEURL/ubl-weight-statement.xml \
    -xsl:/src/tools/create-syntax.xsl \
    -o:/src/structure/syntax/ubl-weight-statement.xml \
    varOverrideSample=/src/structure/source/ubl-weight-statement.xml -ext:on --allow-external-functions:on

echo "Generating documentation: Transport execution plan request"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:$LOGISTICSBASEURL/ubl-transport-execution-plan-request.xml \
    -xsl:/src/tools/create-syntax.xsl \
    -o:/src/structure/syntax/ubl-transport-execution-plan-request.xml \
    varOverrideSample=/src/structure/source/ubl-transport-execution-plan-request.xml -ext:on --allow-external-functions:on

echo "Generating documentation: Transport execution plan"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:$LOGISTICSBASEURL/ubl-transport-execution-plan.xml \
    -xsl:/src/tools/create-syntax.xsl \
    -o:/src/structure/syntax/ubl-transport-execution-plan.xml \
    varOverrideSample=/src/structure/source/ubl-transport-execution-plan.xml -ext:on --allow-external-functions:on

echo "Generating documentation: Waybill"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:$LOGISTICSBASEURL/ubl-waybill.xml \
    -xsl:/src/tools/create-syntax.xsl \
    -o:/src/structure/syntax/ubl-waybill.xml \
    varOverrideSample=/src/structure/source/ubl-waybill.xml -ext:on --allow-external-functions:on

echo "Generating documentation: Transportation Status Request"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:$LOGISTICSBASEURL/ubl-transportation-status-request.xml \
    -xsl:/src/tools/create-syntax.xsl \
    -o:/src/structure/syntax/ubl-transportation-status-request.xml \
    varOverrideSample=/src/structure/source/ubl-transportation-status-request.xml -ext:on --allow-external-functions:on

echo "Generating documentation: Transportation Status"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:$LOGISTICSBASEURL/ubl-transportation-status.xml \
    -xsl:/src/tools/create-syntax.xsl \
    -o:/src/structure/syntax/ubl-transportation-status.xml \
    varOverrideSample=/src/structure/source/ubl-transportation-status.xml -ext:on --allow-external-functions:on

echo "Generating documentation: Receipt Advice"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:$LOGISTICSBASEURL/ubl-receipt-advice.xml \
    -xsl:/src/tools/create-syntax.xsl \
    -o:/src/structure/syntax/ubl-receipt-advice.xml \
    varOverrideSample=/src/structure/source/ubl-receipt-advice.xml -ext:on --allow-external-functions:on

# Generate mapping documents.
 echo "Generating mapping documents: Invoice"
 docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
     -s:/src/structure/syntax/ubl-invoice.xml \
     -xsl:/src/tools/create-mapping-document.xsl \
     -o:/src/rules/mapping/Invoice.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Order"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-order.xml \
    -xsl:/src/tools/create-mapping-document.xsl \
    -o:/src/rules/mapping/Order.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Order response"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-order-response.xml \
    -xsl:/src/tools/create-mapping-document.xsl \
    -o:/src/rules/mapping/OrderResponse.xml  -ext:on --allow-external-functions:on
echo "Generating mapping documents: Order agreement"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-orderagreement.xml \
    -xsl:/src/tools/create-mapping-document.xsl \
    -o:/src/rules/mapping/Orderagreement.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Catalogue"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-catalogue.xml \
    -xsl:/src/tools/create-mapping-document.xsl \
    -o:/src/rules/mapping/Catalogue.xml  -ext:on --allow-external-functions:on
    echo "Generating mapping documents: Catalogue-Response"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-catalogue-response.xml \
    -xsl:/src/tools/create-mapping-document.xsl \
    -o:/src/rules/mapping/Catalogue-response.xml  -ext:on --allow-external-functions:on

echo "Generating mapping documents: Advanced Despatch advice"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-advanced-despatch-advice.xml \
    -xsl:/src/tools/create-mapping-document.xsl \
    -o:/src/rules/mapping/AdvancedDespatchAdvice.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Weight statement"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-weight-statement.xml \
    -xsl:/src/tools/create-mapping-document.xsl \
    -o:/src/rules/mapping/WeightStatement.xml  -ext:on --allow-external-functions:on
echo "Generating mapping documents: Transport execution plan request"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-transport-execution-plan-request.xml \
    -xsl:/src/tools/create-mapping-document.xsl \
    -o:/src/rules/mapping/TransportExecutionPlanRequest.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Transport execution plan"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-transport-execution-plan.xml \
    -xsl:/src/tools/create-mapping-document.xsl \
    -o:/src/rules/mapping/TransportExecutionPlan.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Waybill"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-waybill.xml \
    -xsl:/src/tools/create-mapping-document.xsl \
    -o:/src/rules/mapping/Waybill.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Transportation Status Request"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-transportation-status-request.xml \
    -xsl:/src/tools/create-mapping-document.xsl \
    -o:/src/rules/mapping/TransportationStatusRequest.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Transportation Status"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-transportation-status.xml \
    -xsl:/src/tools/create-mapping-document.xsl \
    -o:/src/rules/mapping/TransportationStatus.xml -ext:on --allow-external-functions:on
echo "Generating mapping documents: Receipt Advice"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
    -s:/src/structure/syntax/ubl-receipt-advice.xml \
    -xsl:/src/tools/create-mapping-document.xsl \
    -o:/src/rules/mapping/ReceiptAdvice.xml -ext:on --allow-external-functions:on

# Create examples based on documentation.
echo "Generating example: Invoice"
 docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
     -s:/src/structure/syntax/ubl-invoice.xml \
     -xsl:/src/tools/create-example.xsl \
     -o:/src/rules/examples/Invoice_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Order"
 docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
     -s:/src/structure/syntax/ubl-order.xml \
     -xsl:/src/tools/create-example.xsl \
     -o:/src/rules/examples/Order_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Order response"
 docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
     -s:/src/structure/syntax/ubl-order-response.xml \
     -xsl:/src/tools/create-example.xsl \
     -o:/src/rules/examples/Order_Response_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Order agreement"
 docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
     -s:/src/structure/syntax/ubl-orderagreement.xml \
     -xsl:/src/tools/create-example.xsl \
     -o:/src/rules/examples/Order_Agreement_Example_Full.xml -ext:on --allow-external-functions:on
     echo "Generating example: Catalogue"
 docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
     -s:/src/structure/syntax/ubl-catalogue.xml \
     -xsl:/src/tools/create-example.xsl \
     -o:/src/rules/examples/Catalogue_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Catalogue Response"
 docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
     -s:/src/structure/syntax/ubl-catalogue-response.xml \
     -xsl:/src/tools/create-example.xsl \
     -o:/src/rules/examples/Catalogue_Response_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Advanced Despatch advice"
 docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target atomgraph/saxon \
     -s:/src/structure/syntax/ubl-advanced-despatch-advice.xml \
     -xsl:/src/tools/create-example.xsl \
     -o:/src/rules/examples/AdvancedDespatchAdvice_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Weight statement"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform \
    -s:/src/structure/syntax/ubl-weight-statement.xml \
    -xsl:/src/tools/create-example.xsl \
    -o:/src/rules/examples/WeightStatement_Example_Full.xml  -ext:on --allow-external-functions:on
echo "Generating example: Transport execution plan request"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform \
    -s:/src/structure/syntax/ubl-transport-execution-plan-request.xml \
    -xsl:/src/tools/create-example.xsl \
    -o:/src/rules/examples/TransportExecutionPlanRequest_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Transport execution plan"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform \
    -s:/src/structure/syntax/ubl-transport-execution-plan.xml \
    -xsl:/src/tools/create-example.xsl \
    -o:/src/rules/examples/TransportExecutionPlan_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Waybill"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform \
    -s:/src/structure/syntax/ubl-waybill.xml \
    -xsl:/src/tools/create-example.xsl \
    -o:/src/rules/examples/Waybill_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Transportation Status Request "
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform \
    -s:/src/structure/syntax/ubl-transportation-status-request.xml \
    -xsl:/src/tools/create-example.xsl \
    -o:/src/rules/examples/TransportationStatusRequest_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Transportation Status"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform \
    -s:/src/structure/syntax/ubl-transportation-status.xml \
    -xsl:/src/tools/create-example.xsl \
    -o:/src/rules/examples/TransportationStatus_Example_Full.xml -ext:on --allow-external-functions:on
echo "Generating example: Receipt Advice"
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform \
    -s:/src/structure/syntax/ubl-receipt-advice.xml \
    -xsl:/src/tools/create-example.xsl \
    -o:/src/rules/examples/ReceiptAdvice_Example_Full.xml  -ext:on --allow-external-functions:on


echo "Generating structure"
docker run --rm -i \
    -v $PROJECT:/src \
    -v $PROJECT/target:/target \
    difi/vefa-structure:0.6.1

echo "Testing validation rules"
docker run --rm -i -v $PROJECT:/src anskaffelser/validator:2.1.0 build -x -t -n eu.peppol.poacc.upgrade.v3 -a rules -target target/validator-test /src

# Removing old zip files and creating new ones
docker run --rm -i \
  -v $PROJECT/target/site/files:/files \
  -v $PROJECT/target/schematron:/schematron \
  -v $PROJECT/rules/examples:/examples \
  -v $PROJECT/rules/mapping:/mapping \
  -w /tmp \
  alpine:latest sh -c '
    apk add --no-cache zip
    rm -rf /files/Schematron.zip
    cd /schematron && zip -r /files/BEAstSchematron.zip .
    echo "Example files"
    rm -rf /files/Examples.zip
    cd /examples && zip -r /files/Examples.zip .
    echo "Mapping files"
    rm -rf /files/Mapping.zip
    cd /mapping && zip -r /files/Mapping.zip .
  '

echo "Generating guides"
docker run --rm -i -v $PROJECT:/documents -v $PROJECT/target:/target difi/asciidoctor

echo "Fix ownership"
docker run --rm -i -v $PROJECT:/src alpine:3.6 chown -R $(id -g $USER).$(id -g $USER) /src/target