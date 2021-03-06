#!/bin/bash

version=$1
version_label=${version//./_}
arch=$2
declare -A package_prefix=(["32"]="ubuntu-32"
                           ["64"]="ubuntu-64"
                           ["pi"]="debian-armv6")

package="bii-${package_prefix[$arch]}_${version_label}.deb"
url="https://s3.amazonaws.com/biibinaries/release/${version}/${package}"
tmp_folder="checksums_tmp"

mkdir "${tmp_folder}"
cd "./${tmp_folder}"

wget $url
md5sum $package
cd ..
rm -r -f "./${tmp_folder}" 
