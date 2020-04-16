#!/usr/bin/env bash

# shellcheck disable=SC2128
bp_dir=$(cd "$(dirname "$BASH_SOURCE")" || exit; cd ..; pwd)

# shellcheck source=/dev/null
source "$bp_dir/lib/utils/log.sh"
source "$bp_dir/lib/utils/json.sh"

detect_out_dir() {
  local build_dir=$1
  out_dir=$(json_get_key "$build_dir/tsconfig.json" ".compilerOptions.outDir")

  [[ -f "$build_dir/$outDir" ]]
}
