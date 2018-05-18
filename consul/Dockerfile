FROM consul:1.0.7

HEALTHCHECK --interval=6s CMD curl -f --max-time 0.3 http://localhost:8000/ || exit 1
