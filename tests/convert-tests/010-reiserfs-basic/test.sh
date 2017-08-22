#!/bin/bash

source "$TOP/tests/common"
source "$TOP/tests/common.convert"

setup_root_helper
prepare_test_dev 512M
check_prereq btrfs-convert

for feature in '' 'extref' 'skinny-metadata' 'no-holes'; do
	convert_test reiserfs "$feature" "reiserfs 4k nodesize" 4096 mkreiserfs -b 4096
	convert_test reiserfs "$feature" "reiserfs 8k nodesize" 8192 mkreiserfs -b 4096
	convert_test reiserfs "$feature" "reiserfs 16k nodesize" 16384 mkreiserfs -b 4096
	convert_test reiserfs "$feature" "reiserfs 32k nodesize" 32768 mkreiserfs -b 4096
	convert_test reiserfs "$feature" "reiserfs 64k nodesize" 65536 mkreiserfs -b 4096
done
