#!/bin/bash

if ip addr show tun0 >/dev/null 2>&1; then

  ip_vpn=$(ip addr show tun0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

  if [ -z "$ip_vpn" ]; then
    echo "Desconectado"
  else
    # Mostrar la dirección IP en Polybar
    echo "$ip_vpn"
  fi
else
  # La interfaz tun0 no existe, mostrar un mensaje de "Desconectado"
  echo "Desconectado"
fi

