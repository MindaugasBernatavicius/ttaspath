bash -c 'd="$1"; traceroute -Tnp 443 "$d" |\
  awk "/^[ 0-9]+ / {for(i=2;i<=NF;i++) if (\$i ~ /^[0-9.]+$/) {print \$i; break}}" |\
  while read -r ip; do whois -h whois.cymru.com "$ip" |\
  awk "NR>1{print}"; done' _ "$DOMAIN"
