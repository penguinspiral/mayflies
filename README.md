# Mayflies

## Table of Contents
+ [About](#about)
+ [Getting Started](#getting-started)
+ [Usage](#usage)

## About

Project Mayflies builds customised Debian GNU/Linux
[live-build(7)](https://live-team.pages.debian.net/live-manual/html/live-manual/index.en.html)
images. It does so by "wrapping" varying upstream Debian GNU/Linux specific
`live-{boot,build,config,tools}(7)` utilities inside an Open Container
Initiative (OCI) compliant container via a Makefile entrypoint.

The ephemeral, read-only characteristics of live ISO images provides a
consistent operational environment to experiment with. Traditional on-disk
installation of Debian GNU/Linux accrues varying mutations (i.e. package &
configuration files) over time that may otherwise invalidate prior
experimentation/setups.

Ultimately, project Mayflies was developed to simplify the creation of
standalone, reproducible operating environments: roughly comparable to an OCI
container on behalf of an entire host (physical or virtual). The author's 3
MS-01 Minisforum nodes now solely run Mayflies generated live ISOs hosted on a
local USB storage device managed by
[Ventoy](https://www.ventoy.net/en/index.html).


## Getting Started

At its core, project Mayflies is comprised of two components, both necessary for
the creation of a Debian GNU/Linux live ISO image:

* "**Host**": A physical or virtual node. See
[host/README.md](https://github.com/penguinspiral/mayflies/tree/main/host#hosts)
for additional details.

* "**Target**": A `live-build(7)` compliant configuration setup. See
[host/README.md](https://github.com/penguinspiral/mayflies/tree/main/host#targets)
for additional details.

There is a `1:N` ratio between "**Host**" and "**Target**" respectively.

Note: `live-build(7)`'s usage of `debootstrap(8)` requires elevated privileges
in order to invoke `mknod(2)` successfully. To support this the Mayflies
container **must** be ran with elevated privileges.

### Prerequisites

* `make(1)`

* `sudo(8)` (privileged container)

* `podman(1)` or `docker(1)` (container runtime engine)


## Usage

Clone the Git repository:

```bash
git clone https://github.com/penguinspiral/mayflies.git
```

The following branching workflows use the `red` host's `motd` target as the
example live ISO:

A. **MVP build**: The minimum steps necessary to build the live ISO

B. **Development**: The typical dev -> build -> test iteration


### A. MVP build

1. Build the image:

```bash
make build HOSTNAME=red TARGET=motd
```

* The generated live ISO will be stored under the directory `host/red/motd/`
relative to the root of the Mayflies Git repository.


### B. Development cycle

1. Generate the image's `live-build(7)` configuration files for inspection:

```bash
make config HOSTNAME=red TARGET=motd
```

* Examine resulting configuration files rendered by `live-build(7)` and extended
by the Mayflies `config` "auto script".

2. Clean the staged build area (excluding cached packages):

```bash
make clean HOSTNAME=red TARGET=motd
```

* Remove previous rendered configurations and build artifacts (including live
  ISO). This is necessary to track all configurations that may vary (e.g.
  removal of configuration) between builds.

3. Build the image:

```bash
make build HOSTNAME=red TARGET=motd
```

* Runs `lb config` and immediately invokes `lb build` upon success to commence
  construction of the live ISO & artifacts.
