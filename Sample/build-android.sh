#! /bin/bash

set -e

mkdir -p build

$FLEX_HOME/bin/amxmlc -compiler.library-path=../AirExtension/extensions/com.vungle.extensions.Vungle.ane \
	-output build/sample.swf -swf-version=23 -default-size=320,480 \
	-default-background-color=#ffffff -debug src/VungleExample.as

$FLEX_HOME/bin/adt -package -target apk-captive-runtime -keystore keys/debug.p12 \
	-storetype pkcs12 -storepass android build/example.apk app.xml \
	-C build sample.swf \
	-C src/assets VungleIcon.png VungleIcon@2x.png VungleLogo.png \
	-extdir ../AirExtension/extensions
