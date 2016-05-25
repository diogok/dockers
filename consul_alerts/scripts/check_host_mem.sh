#!/bin/sh

ssh -o StrictHostKeyChecking=no ubuntu@$1 -i /opt/ops/keys/$2 \
  "[[ \$(free -o | tail -n2 | head -n1 | awk '{ printf \"%.0f\", \$4/(\$2 - \$6) * 100}') -lt 90 ]] && true || false" && exit 0 || exit 2

