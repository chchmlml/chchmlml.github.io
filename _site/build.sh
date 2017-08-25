#!/usr/bin/env bash

# Header logging
e_info() {
    printf "$(tput setaf 38)→ %s$(tput sgr0)\n" "$@"
}

# Success logging
e_success() {
    printf "$(tput setaf 76)✔ %s$(tput sgr0)\n" "$@"
}

# Error logging
e_error() {
    printf "$(tput setaf 1)✖ %s$(tput sgr0)\n" "$@"
}

# Warning logging
e_warning() {
    printf "$(tput setaf 3)! %s$(tput sgr0)\n" "$@"
}

#set -x

e_info "准备全局参数"
BINPATH=$(cd `dirname $0`; pwd)
SOURCE_PATH="${BINPATH}/_site"
TARGET_PATH="/tmp/chchmlml.github.io"

#编译博客
e_info "增量编译blog"
jekyll build ${SOURCE_PATH}

e_info "保存本地 https://chchmlml.github.io/"
#保存本地blog.machine
git pull origin master
git add .
git commit -am "add blog upgrade"
git push
#
##覆盖博文
#e_info "clone 远程blog项目"
#if [ ! -d "${TARGET_PATH}" ]; then
#
#    e_info "不存在目录，开始clone"
#    mkdir "${TARGET_PATH}"
#    git clone https://github.com/chchmlml/chchmlml.github.io.git "${TARGET_PATH}"
#else
#    e_info "已存在目录，开始清理"
#    find ${TARGET_PATH} | grep -v .git | xargs rm
#fi
#
#e_info "更新编译blog，git更新仓库"
#cp -rf ${SOURCE_PATH}/* ${TARGET_PATH}
#
#cd ${TARGET_PATH}
#git pull origin master
#git add .
#git commit -am "upgrade blog"
#git push

e_info "结束ing"
#cd ${SOURCE_PATH}

e_success "OK"