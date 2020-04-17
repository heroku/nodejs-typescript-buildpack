#!/usr/bin/env bash

set -e
set -o pipefail

source "./lib/utils/log.sh"
source "./lib/build.sh"

create_temp_project_dir() {
  mktemp -dt project_shpec_XXXXX
}

describe "lib/build.sh"
  describe "detect_out_dir"
    it "exits with 1 if there is no outDir directory"
      project_dir=$(create_temp_project_dir)

      set +e
      detect_out_dir "$project_dir"
      loc_var=$?
      set -e

      assert equal "$loc_var" 1
    end

    it "exits with 0 if there is outDir directory"
      project_dir=$(create_temp_project_dir)
      touch "$project_dir/dist"

      detect_out_dir "$project_dir"

      assert equal "$?" 0
    end
  end

  describe "check_tsc_binary"
    it "exits with 1 if tsc binary does not exist"
      project_dir=$(create_temp_project_dir)

      set +e
      check_tsc_binary "$project_dir"
      loc_var=$?
      set -e

      assert equal "$loc_var" 1
    end

    it "exits with 0 if tsc binary exists"
      project_dir=$(create_temp_project_dir)
      touch "$project_dir/node_modules/typescript/bin/tsc"

      check_tsc_binary "$project_dir"

      assert equal "$?" 0
    end
  end

end
