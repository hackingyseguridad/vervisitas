

#!/bin/bash
echo "=== Conexiones Activas ==="
ss -tulnp | grep -E '0.0.0.0|:::|127.0.0.1' --color=auto
echo "=== Procesos con Conexiones ==="
lsof -i | grep -E 'LISTEN|ESTABLISHED' --color=auto
echo "=== Procesos Consumiendo CPU ==="
ps -eo pid,cmd,%cpu,%mem --sort=-%cpu | head -n 10
echo "=== Archivos Setuid Peligrosos ==="
find / -type f -perm /4000 -ls 2>/dev/null | grep -E '/tmp|/dev/shm' --color=auto
