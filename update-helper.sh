#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#
# This script helps update a port that uses vcpkg_from_github().
#

cd ${SCRIPT_DIR}

#!/bin/bash
############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo
   echo "This script helps update a port that uses vcpkg_from_github()."
   echo
   echo "Steps:"
   echo
   echo "1. Commit and push your code changes to the repo, i.e. https://github.com/thinkalpha/table-rdf."
   echo "2. In the portfile.cmake, update the 'REF' property in vcpkg_from_github() with the full commit SHA from the repo above."
   echo "3. If required, make any other changes to the port files under ports/<your port>/."
   echo "4. Run this script with -t <GitHub access token> -c <full commit SHA> -r <repo base url>."
   echo "5. Follow script instructions."
   echo
   echo "Syntax: update-helper.sh -t <GitHub access token> -c <full commit SHA> -r <repo base url>"
   echo
   echo "example:"
   echo "update-helper.sh -t ghp_AWCd1234ASJDHg2378fbjHGWljqw78231jhc -c ac10ac27988b148d5861368928aee272db215f9f -r https://github.com/thinkalpha/table-rdf"
   echo
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################

# Get the options
while getopts "h :t:c:r:" option; do
   case $option in
      h) # Display help.
         Help
         exit;;
      t) # Display help.
         GHToken=$OPTARG;;
      c) # Display help.
         Commit=$OPTARG;;
      r) # Display help.
         Repo=$OPTARG;;
     \?) # Invalid option.
         echo "Error: Invalid option"
         Help
         exit;;
   esac
done

echo
echo "Downloading $Commit.tar.gz from $Repo/archive ..."
echo
echo curl -LO $Repo/archive/$Commit.tar.gz -H \"Authorization: token $GHToken\"
curl -LO $Repo/archive/$Commit.tar.gz -H "Authorization: token $GHToken"
echo

if gzip --test $Commit.tar.gz
then
  echo "Success."
else
  ret="$?"
  echo "Invalid download, check parameters."
  exit
fi

echo
echo "1) Paste this sha512sum into the 'SHA512' field of vcpkg_from_github():"
echo "--------------------------------------------------------------------------------------------------------------------------------"
sha512sum $Commit.tar.gz
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo
echo "2) Bump the "version" and/or "port-version" properties in ports/<your port>/vcpkg.cmake."
echo "3) Commit these changes."
echo
read -p "Then press <ENTER> to continue..."
echo

vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version --all --verbose

echo
echo "Registry versions database files should now be updated."
echo "Commit and push these to complete port update."

cd -