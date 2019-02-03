#!/bin/bash
set -e
set -x

TEMPLATE=$1
OUTPUT=$2
INPUT=$3

[ -f swagger-codegen-cli.jar ] || curl 'http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.3.1/swagger-codegen-cli-2.3.1.jar' -o swagger-codegen-cli.jar
echo "Regenerating $OUTPUT from specification $INPUT" >> "/dev/stderr";
rm -rf "$OUTPUT"
# Using local swagger codegen instead of download it every time, why? Because we fix version of Generator
java -jar ./swagger-codegen-cli.jar generate \
  --lang typescript-angular		   \
  -DmodelPropertyNaming=original	   \
  --template-dir "$TEMPLATE"		   \
  --input-spec "$INPUT"			   \
  --output "$OUTPUT"