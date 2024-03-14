#!/bin/bash

f="config-lock.json"

configs=$(jq -r 'keys[]' "${f}")
config=$(echo "${configs}" | fzf)

if [[ -z "${config}" ]]; then
  exit
fi

read -rp "Commit hash: " commit

if jq --arg config "${config}" --arg commit "${commit}" '.[$config] = $commit' "${f}" >"${f}.tmp"; then
  mv "${f}.tmp" "${f}"
fi
