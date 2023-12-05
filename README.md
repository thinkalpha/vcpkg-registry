# ThinkAlpha vcpkg-registry

For help getting started, see [this video overview](https://thinkalpha.atlassian.net/wiki/spaces/NATIVE/pages/1437106187/Distributing+and+consuming+C+libraries+using+Vcpkg).

## Helper Script

This repo includes a script to assist in performing port updates. It computes the SHA512 of repo archives and updates the `git-tree` field and version info. Ensure the `vcpkg` executable is in your path before running the script.

Run `update-helper.sh -h` for usage.