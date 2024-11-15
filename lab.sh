#!/bin/bash

# Verifica validitatea adreselor de IP din /etc/hosts
for linie in $(cat /etc/hosts); do
  ip=$(echo "$linie" | cut -d' ' -f2)
  if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Adresa de IP $ip este validă."
  else
    echo "Adresa de IP $ip nu este validă."
  fi
done
