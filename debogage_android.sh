#!/bin/bash

# Script de connexion ADB sans fil
# Par D-Tech 🚀

echo "🔌 Vérification de la connexion USB..."
adb devices

echo "🛜 Redémarrage d'ADB en mode TCP/IP sur le port 5555..."
adb tcpip 5555

echo "📡 Récupération de l'adresse IP du téléphone..."
PHONE_IP=$(adb shell ip route | awk '{print $9}' | head -n1)

if [[ -z "$PHONE_IP" ]]; then
    echo "❌ Impossible de récupérer l'adresse IP. Assurez-vous que le téléphone est connecté en Wi-Fi."
    exit 1
fi

echo "📲 Connexion à l'appareil à l'adresse $PHONE_IP:5555 ..."
adb connect "$PHONE_IP:5555"

echo "✅ Tu peux maintenant débrancher ton câble USB !"
adb devices
