#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

. ./env.sh
python3 -m build
pip install ./dist/{{MODULE}}-${SMVERSION}.tar.gz
pytest -rA
