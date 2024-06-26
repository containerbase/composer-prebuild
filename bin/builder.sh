#!/bin/bash

set -e

# shellcheck source=/dev/null
. /usr/local/containerbase/util.sh
# shellcheck source=/dev/null
. "/${CONTAINERBASE_DIR}/utils/v2/overrides.sh"

# trim leading v
TOOL_VERSION=${1#v}

if [[ "${DEBUG}" == "true" ]]; then
  set -x
fi

function main () {
  local tool_path
  local versioned_tool_path
  local file
  # https://getcomposer.org/download/2.7.7/composer.phar
  local URL='https://getcomposer.org/download'
  local file_name="composer"
  local file_url="${TOOL_VERSION}/composer.phar"

  local checksum_file
  local checksum_algo
  local expected_checksum

  echo "Building ${TOOL_NAME} ${TOOL_VERSION}"

  echo "------------------------"
  echo "fetching archive"
  checksum_file=$(get_from_url "${URL}/${file_url}.sha256sum")
  checksum_algo=sha256sum
  expected_checksum=$(grep "composer.phar" "${checksum_file}" | cut -d' ' -f1)

  file=$(get_from_url \
    "${URL}/${file_url}" \
    "${file_name}" \
    "${expected_checksum}" \
    "${checksum_algo}" )

  echo "------------------------"
  echo "copy file"
  versioned_tool_path=$(create_versioned_tool_path)
  create_folder "${versioned_tool_path}/bin"
  cp "${file}" "${versioned_tool_path}/bin/composer"
  chmod +x "${versioned_tool_path}/bin/composer"

  echo "------------------------"
  echo "testing"
  "${versioned_tool_path}/bin/composer" --version

  echo "------------------------"
  echo "compressing archive"
  tool_path=$(find_tool_path)
  bsdtar -cJf "/cache/${TOOL_NAME}-${TOOL_VERSION}.tar.xz" -C "${tool_path}" "${TOOL_VERSION}"
}

check_semver "${TOOL_VERSION}" all
main
