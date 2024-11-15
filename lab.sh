#!/bin/bash

# Definirea funcției pentru verificarea validității unei adrese de IP
verifica_ip() {
  local nume_host=$1
  local ip=$2
  local server_dns=$3

  # Verifica dacă adresa de IP este validă
  if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    # Verifica asocierea folosind serverul DNS
    if dig +short $nume_host @$server_dns | grep -q $ip; then
      echo "Adresa de IP $ip pentru hostul $nume_host este validă și asociată cu serverul DNS $server_dns."
    else
      echo "Adresa de IP $ip pentru hostul $nume_host nu este asociată cu serverul DNS $server_dns."
    fi
  else
    echo "Adresa de IP $ip nu este validă."
  fi
}

# Exemplu de utilizare a funcției
verifica_ip "$1" "$2" "$3"
