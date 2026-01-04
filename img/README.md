# About

Customised Debian GNU/Linux Live ISO's are created on a per-"host", per-"target"
basis.

There is a 1:N relationship between "host"(s) and its corresponding "target"(s).


## Hosts

A "host" is a targetable (via repo-level Makefile), logical entity represented as
a child directory. The directory name should reflect the hostname of the "host",
for example: "blu".

Each "host" directory contains a "HARDWARE.md" markdown document containing the
"host"'s hardware inventory.


## Targets

A "target" is a targetable (via repo-level Makefile), [live-images](https://salsa.debian.org/live-team/live-images/-/tree/upstream/images/standard?ref_type=heads) adherent
structure encapsulating all necessary [live-build(7)](https://manpages.debian.org/testing/live-build/live-build.7.en.html)
configuration for constructing a customised Debian GNU/Linux ISO.

Debian GNU/Linux's official `live-images` documentation ([link](https://live-team.pages.debian.net/live-manual/html/live-manual/index.en.html))
provides comprehensive, human readable (i.e. non-code!) explanation for the
varying configuration structures encapsulated in a "target".
TL;DR configuration layout: [link](https://github.com/nodiscc/debian-live-config/blob/master/doc/md/custom.md#changing-the-default-build-configuration)

Upstream Debian GNU/Linux `live-images` examples are differentiated by desktop
environment ([ref](https://salsa.debian.org/live-team/live-images/-/tree/upstream/images?ref_type=heads)).
"Target"s extend the `standard` (i.e. headless) upstream variant and can
deviate considerably between each other.

Every "host" contains a special `_base` "target". This "target" provides a
host specific boilerplate `live-config(8)` configuration that accelerates
development of a customised "target".
