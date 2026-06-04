#!/usr/bin/env bash
set -euo pipefail

readme_path="${1:-README.md}"

# Each Flutter package writes its own coverage/lcov.info. The badge represents
# the combined line coverage across every package that produced coverage.
coverage_files_count="$(find . -path "*/coverage/lcov.info" -type f | wc -l | tr -d " ")"

if [[ "$coverage_files_count" == "0" ]]; then
  echo "No coverage files were generated."
  exit 1
fi

# lcov stores covered lines in LH and total instrumented lines in LF.
coverage="$(
  find . -path "*/coverage/lcov.info" -type f -print0 |
  xargs -0 awk -F: '
    /^LH:/ { hit += $2 }
    /^LF:/ { found += $2 }
    END {
      if (found == 0) {
        printf "0.00"
      } else {
        printf "%.2f", hit * 100 / found
      }
    }
  '
)"

# The badge color is determined by the coverage percentage.
color="$(
  awk -v coverage="$coverage" 'BEGIN {
    if (coverage >= 90) print "brightgreen";
    else if (coverage >= 80) print "green";
    else if (coverage >= 70) print "yellowgreen";
    else if (coverage >= 60) print "yellow";
    else if (coverage >= 50) print "orange";
    else print "red";
  }'
)"

badge="![Coverage](https://img.shields.io/badge/coverage-${coverage}%25-${color})"

# Replace the existing coverage badge in place. The README must already contain
# a coverage badge so this script does not decide where documentation belongs.
perl -0pi -e \
  "s#!\\[Coverage\\]\\(https://img\\.shields\\.io/badge/coverage-[^)]*\\)#$badge#" \
  "$readme_path"

echo "Coverage: ${coverage}% (${color})"

# Expose values to GitHub Actions while keeping the script runnable locally.
if [[ -n "${GITHUB_OUTPUT:-}" ]]; then
  echo "percent=$coverage" >> "$GITHUB_OUTPUT"
  echo "color=$color" >> "$GITHUB_OUTPUT"
fi
