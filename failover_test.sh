#!/bin/bash

echo "=== Test de panne démarré : $(date) ==="

echo "Arrêt de web1..."
docker stop web1
echo "web1 arrêté à : $(date)"

echo "Vérification du service sur http://localhost:8080..."
sleep 2
curl -s -o /dev/null -w "Status HTTP: %{http_code}\n" http://localhost:8080

echo "Redémarrage de web1..."
docker start web1
echo "web1 redémarré à : $(date)"

echo "=== Test terminé ==="
