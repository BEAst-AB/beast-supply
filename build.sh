#!/bin/sh

PROJECT=$(dirname $(readlink -f "$0"))
echo $PROJECT

# Delete target folder if found
if [ -e $PROJECT/target ]; then
    docker run --rm -i -v $PROJECT:/src alpine:3.6 rm -rf /src/target
fi

# Transform the files in source dir to syntax.
echo "Transforming files from source to syntax"
# Invoice
docker run --rm -i -v $PROJECT:/src --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-invoice.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-invoice.xml UblBaseUrl=https://raw.githubusercontent.com/OpenPEPPOL/peppol-bis-invoice-3/master/structure/syntax/ UblDocBaseUrl=https://docs.peppol.eu/poacc/billing/3.0/syntax/ubl-invoice UblXmlReferenceFile=ubl-invoice.xml -ext:on --allow-external-functions:on
# Order
docker run --rm -i -v $PROJECT:/src --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-order.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-order.xml UblBaseUrl=https://raw.githubusercontent.com/OpenPEPPOL/poacc-upgrade-3/master/structure/syntax/ UblDocBaseUrl=https://docs.peppol.eu/poacc/upgrade-3/syntax/Order UblXmlReferenceFile=ubl-order.xml -ext:on --allow-external-functions:on
# Order response
docker run --rm -i -v $PROJECT:/src --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-order-response.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-order-response.xml UblBaseUrl=https://raw.githubusercontent.com/OpenPEPPOL/poacc-upgrade-3/master/structure/syntax/ UblDocBaseUrl=https://docs.peppol.eu/poacc/upgrade-3/syntax/OrderResponse/ UblXmlReferenceFile=ubl-order-response.xml -ext:on --allow-external-functions:on
# Despatch advice
docker run --rm -i -v $PROJECT:/src --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-despatch-advice.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-despatch-advice.xml UblBaseUrl=https://raw.githubusercontent.com/OpenPEPPOL/poacc-upgrade-3/master/structure/syntax/ UblDocBaseUrl=https://docs.peppol.eu/poacc/upgrade-3/syntax/DespatchAdvice/ UblXmlReferenceFile=ubl-despatch-advice.xml -ext:on --allow-external-functions:on
# Advanced Despatch advice
docker run --rm -i -v $PROJECT:/src --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-advanced-despatch-advice.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-advanced-despatch-advice.xml UblBaseUrl=https://raw.githubusercontent.com/OpenPEPPOL/poacc-upgrade-3/master/structure/syntax/ UblDocBaseUrl=https://docs.peppol.eu/poacc/upgrade-3/syntax/DespatchAdvice/ UblXmlReferenceFile=ubl-despatch-advice.xml -ext:on --allow-external-functions:on
# Catalogue
docker run --rm -i -v $PROJECT:/src --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-catalogue.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-catalogue.xml UblBaseUrl=https://raw.githubusercontent.com/OpenPEPPOL/poacc-upgrade-3/master/structure/syntax/ UblDocBaseUrl=https://docs.peppol.eu/poacc/upgrade-3/syntax/Catalogue/ UblXmlReferenceFile=ubl-catalogue.xml -ext:on --allow-external-functions:on
# Despatch Advice Response
docker run --rm -i -v $PROJECT:/src --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-despatch-advice-response.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-despatch-advice-response.xml UblBaseUrl=https://raw.githubusercontent.com/OpenPEPPOL/poacc-upgrade-3/master/structure/syntax/ UblDocBaseUrl=https://docs.peppol.eu/poacc/upgrade-3/syntax/MLR/ UblXmlReferenceFile=ubl-mlr.xml -ext:on --allow-external-functions:on
# Order agreement
docker run --rm -i -v $PROJECT:/src --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-orderagreement.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-orderagreement.xml UblBaseUrl=https://raw.githubusercontent.com/OpenPEPPOL/poacc-upgrade-3/master/structure/syntax/ UblDocBaseUrl=https://docs.peppol.eu/poacc/upgrade-3/syntax/OrderAgreement/ UblXmlReferenceFile=ubl-orderagreement.xml -ext:on --allow-external-functions:on
# Weight statement
docker run --rm -i -v $PROJECT:/src --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Transform -s:/src/structure/source/ubl-weight-statement.xml -xsl:/src/tools/UBLInstance-To-StructureXML.xsl -o:/src/structure/syntax/ubl-weight-statement.xml UblBaseUrl=https://raw.githubusercontent.com/OpenPEPPOL/poacc-upgrade-3/master/structure/syntax/ UblDocBaseUrl=https://docs.peppol.eu/poacc/upgrade-3/syntax/DespatchAdvice/ UblXmlReferenceFile=ubl-despatch-advice.xml -ext:on --allow-external-functions:on

# Copying generated files back to Git
docker cp $PROJECT:/structure/source/ubl-mlr.xml ./ubl-mlr2.xml
echo "7"
docker run --rm -v $PROJECT:/src alpine sh -c "ls > /src/file.txt"
echo "8"
docker run --rm $PROJECT:/src alpine "cat /src/file.txt"
echo "9"
docker run --rm -v $PROJECT:/src alpine:latest sh -c "ls > /src/file.txt" \
  alpine "cat /src/file.txt"
echo "10"
ls
echo "11"
docker run -v $(pwd):/var/opt/project bash:latest \
  bash -c "ls /var/opt/project"                         

echo "Finished copy"

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

# Guides
docker run --rm -i -v $PROJECT:/documents -v $PROJECT/target:/target difi/asciidoctor

# Fix ownership
docker run --rm -i -v $PROJECT:/src alpine:3.6 chown -R $(id -g $USER).$(id -g $USER) /src/target
