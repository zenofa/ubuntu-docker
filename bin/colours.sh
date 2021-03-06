#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
LIGHTCYAN='\033[1;36m'
NC='\033[0m'

_title() {
    printf "${CYAN}*** ${LIGHTCYAN}$@${NC}\n"
}

_good() {
    printf "${GREEN}  * ${NC}$@\n"
}

_error() {
    printf "  ${RED}* [ERROR]${NC} $@\n\n"
    exit 1;
}

_warning() {
    printf "  ${YELLOW}* [WARNING]${NC} $@\n"
}

export -f _title
export -f _good
export -f _error
export -f _warning