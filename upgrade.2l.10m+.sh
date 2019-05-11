#!/usr/bin/env bash





echo "♻️: $(aptitude search '~U' | wc -l)"
echo "---"

echo "$(aptitude search '~U' | awk '{print $3}')"
