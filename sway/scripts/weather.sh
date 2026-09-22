#!/bin/sh
curl -s "https://wttr.in/Newcastle,AU?format=%c+%t" 2>/dev/null || echo "N/A"
