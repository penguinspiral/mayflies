# About

Debian GNU/Linux's [live-build(7)](https://manpages.debian.org/testing/live-build/live-build.7.en.html)
utility is executed from within the operating context of an OCI image.

The Makefile within this directory simplifies and standardises the creation and
publishing of the `mayflies` project OCI image. It serves as a wrapper around
the most popular OCI image builder and publishers:

* [buildah(1)](https://manpages.debian.org/trixie/buildah/buildah.1.en.html)
* [skopeo(1)](https://manpages.debian.org/trixie/skopeo/skopeo.1.en.html)
* [docker](https://docs.docker.com/reference/cli/docker/)

The OCI Containerfile leverages [apt-get(8)](https://manpages.debian.org/trixie/apt/apt-get.8.en.html)'s
`--snapshot` functionality. Packages installed in this manner are procured from
Debian GNU/Linux's `snapshot.debian.org` APT repository thereby facilitating
reproducibility regardless of when the OCI image is rebuilt.
By default the chosen timestamp mirrors the creation date of the targeted Debian
GNU/Linux OCI base image.


## Requirements

### Building

* The OCI image base/FROM is Debian GNU/Linux "Trixie" (or more recent).

* The snapshot timestamp is formatted as: `yyyymmddThhmmssZ` OR `yyyymmdd`

* All "wrapped" OCI utilities are ran via `sudo`. `buildah(1)` and `skopeo(1)`
  will store/lookup OCI images from different paths depending on their execution
  privilege.


### Publishing

* The upstream OCI image registry is <https://docker.io>

* The <https://docker.io> personal account is 'penguinspiral'

* Authentication to <https://docker.io> is done externally (to the Makefile)


## Examples

<!-- markdownlint-disable MD024 -->
### Building

Build the `mayflies` "builder" OCI image atop upstream Debian GNU/Linux 13.0
"Trixie" (stable) OCI image built on July 21st 2025:

```bash
# builds: mayflies:trixie-20260112
make build
```

Build the `mayflies` "builder" OCI image atop upstream Debian GNU/Linux "Sid"
(unstable) OCI image targeting snapshot packages from the current day:

```bash
# builds: mayflies:sid
make build DEBIAN_OCI_TAG=sid SNAPSHOT_TIMESTAMP=$(date +%Y%m%d)
```

Build the `mayflies` "builder" OCI image atop upstream Debian GNU/Linux 14.0
"Forky" (testing) OCI image, built on the 11th August 2025, targeting snapshot
packages from August 1st 2025 at 2AM:

```bash
# builds: mayflies:forky-20250811
make build DEBIAN_OCI_TAG=forky-20250811 SNAPSHOT_TIMESTAMP=20250801T020000Z
```

Build the `mayflies` "builder" OCI image atop Debian GNU/Linux "Sid" (unstable)
OCI image with packages from today and tag as "dev":

```bash
# builds: mayflies:dev
make build DEBIAN_OCI_TAG=sid SNAPSHOT_TIMESTAMP=$(date +%Y%m%d) \
           MAYFLIES_OCI_TAG=dev
```

<!-- markdownlint-disable MD024 -->
### Publishing

Publish the `mayflies` "builder OCI image tagged "trixie-20260112" (default):

```bash
# publishes: mayflies:trixie-20260112
make publish
```

Publish the `mayflies` "builder" OCI image tagged "dev":

```bash
# publishes: mayflies:dev
make publish MAYFLIES_OCI_TAG=dev
```
