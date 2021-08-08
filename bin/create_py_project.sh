#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

ORGANISATION=systematicmethods
EMAIL=build@systematicmethods.com
MODULE=

POSITIONAL=()
while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -m|--module-name)
      MODULE="$2"
      shift # past argument
      shift # past value
      ;;
    -o|--organisation)
      ORGANISATION="$2"
      shift # past argument
      shift # past value
      ;;
    -e|--email)
      EMAIL="$2"
      shift # past argument
      shift # past value
      ;;
    *)    # unknown option
      POSITIONAL+=("$1") # save it in an array for later
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL[@]}" # restore positional parameters

if [[ "${MODULE}" == "" ]] ; then
  echo "module name needed"
  exit 1
fi

MOD_DIR=src/${MODULE}
FILENAME=$(echo ${MODULE} | sed -e "s/-/_/g")

echo "Creating Module ${MODULE} with ${FILENAME}"

mkdir -p ${MOD_DIR}
mkdir -p tests
touch ${MOD_DIR}/__init__.py
touch ${MOD_DIR}/${FILENAME}.py
touch ${MOD_DIR}/helpers.py
touch tests/${FILENAME}_test.py
touch tests/helpers_test.py
touch requirements.txt

cp ${SCRIPT_DIR}/LICENSE .
cp ${SCRIPT_DIR}/pyproject.toml .
cp ${SCRIPT_DIR}/py.gitignore .gitignore
cp ${SCRIPT_DIR}/test.sh .
cp ${SCRIPT_DIR}/example_test.py tests/
cp ${SCRIPT_DIR}/build.sh .

sed -e "s/{{MODULE}}/${MODULE}/g" -e "s/{{EMAIL}}/${EMAIL}/g" -e "s/{{ORGANISATION}}/${ORGANISATION}/g" \
    ${SCRIPT_DIR}/setup.cfg > setup.cfg
sed -e "s/{{MODULE}}/${MODULE}/g" ${SCRIPT_DIR}/Dockerfile > Dockerfile
sed -e "s/{{MODULE}}/${MODULE}/g" ${SCRIPT_DIR}/env.sh > env.sh
sed -e "s/{{MODULE}}/${MODULE}/g" ${SCRIPT_DIR}/test_in_docker.sh > test_in_docker.sh

chmod +x *.sh

git add .

