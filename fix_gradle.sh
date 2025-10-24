#!/bin/bash

WRAPPER="android/gradle/wrapper/gradle-wrapper.properties"

if [ -f "$WRAPPER" ]; then
  sed -i 's|distributionUrl=.*|distributionUrl=https\://services.gradle.org/distributions/gradle-8.11.1-all.zip|' "$WRAPPER"
  echo "✅ Gradle mis à jour vers 8.11.1 dans $WRAPPER"
else
  echo "❌ Fichier gradle-wrapper.properties introuvable"
fi

