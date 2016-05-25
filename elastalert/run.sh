#!/bin/bash

elastalert-create-index

python elastalert/elastalert.py --verbose

