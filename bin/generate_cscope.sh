#!/bin/bash
if [ -z $(command -v cscope) ]; then
  echo "cscope: command not find"
  exit 1
fi

# TODO: add param
src_dir=$(pwd)
cscope_home="${HOME}/.cscope"
old_dir=$(pwd)
cscope_name=""

if [ ! -d ${cscope_home} ]; then
  mkdir -p ${cscope_home}
  if [ ! -z $? ]; then
    echo "mkdir -p ${cscope_home}"
  else
    echo "failed to mkdir"
    exit $?
  fi
fi

cd ${cscope_home}
cscope_name=$(echo ${src_dir} | sed 's/\//./g' | sed 's/^.//g')'.out'
rm cscope.files -f 2>/dev/null
find ${src_dir} -name '*.cpp' -o -name '*.c' -o -name '*.l' -o -name '*.y' -o -name '*.h' > cscope.files
echo ${cscope_name}
cscope -bkq -i cscope.files -f ${cscope_name}
cd ${old_dir}
rm cscope.files -f 2>/dev/null
