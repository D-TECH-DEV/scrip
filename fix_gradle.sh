#!/bin/bash

WRAPPER="android/gradle/wrapper/gradle-wrapper.properties"

if [ -f "$WRAPPER" ]; then
  sed -i 's|distributionUrl=.*|distributionUrl=https\://services.gradle.org/distributions/gradle-8.4-all.zip|' "$WRAPPER"
  echo "✅ Gradle mis à jour dans $WRAPPER"
else
  echo "❌ Fichier gradle-wrapper.properties introuvable"
fi
