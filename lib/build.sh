#!/usr/bin/env bash

# shellcheck disable=SC2128
bp_dir=$(cd "$(dirname "$BASH_SOURCE")" || exit; cd ..; pwd)

# shellcheck source=/dev/null
source "$bp_dir/lib/utils/log.sh"
