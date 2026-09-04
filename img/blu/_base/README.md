# _base Target

## Objective

The `_base` target provides foundational capabilities and configurations that other targets in the `blu` host directory can inherit and extend. It serves as a "batteries included" baseline thereby accelerating development of new targets in a DRY fashion.

The `_base` target is buildable to ensure future development is validated before being consumed by another `blu` target. Nevertheless it is recommended that usage of the `_base` target is implicit by means of inclusion from another `blu` target.


## Functionality

This `_base` target has the following capabilities:

### Build configuration

* Reproducible ISO image generation via pre-packaged `live-build(7)` scripts
* APT Snapshot consumption via timestamp for both build & image reproducibility
* Dynamic configuration rendering for filenames and contents:
  * `.envsubst` files rendered with environment variable substitution
  * `.varfile` filename templates for dynamic file naming
* Stable, Testing, and Unstable Debian release support starting at Trixie (13.0)
* Target, Build, and Global environment variables: `/etc/default/mayflies/*`

### User configuration

* Leverages `live-config(7)` configurations:
  * `debian` user auto-creation on boot with customizable password
  * Customisable hostname (MAYFLIES_HOSTNAME) & username (MAYFLIES_USERNAME)
  * Disabled automatic console login behaviour

### Network configuration

* Statically allocated IPv4 address via `ifup(8)` configuration drop-ins.
  * Managing 2.5G ethernet interfaces: `enp87s0`, `enp88s0`
  * Kernel commandline 'live-boot(7)' option for 'interfaces.d/' usage
* Explicitly nullifying `enp88s0` configuration as required for Intel AMT.
* Statically setting DNS nameservers with performance & failover considerations
  * LAN based VyOS 'pdns_recursor(1)' fully recursive DNS nameserver: 10.0.0.1
  * WAN based Google public DNS nameserver: 8.8.8.8
* OpenSSH server with centralised 'authorized_keys' management
  * Supports the runtime `live-build(7)` generated user: 'debian'

### Storage configuration

* Dedicated "scratch" drive partitioning & formatting via systemd-repart(8)
  * Image build commit hash used for disk management idempotency
  * Systemd mount unit for handling dependency ordering post systemd-repart(8)

### Hardware configuration

* Complete firmware support:
  * Targeted firmware packages for full hardware compatibility: GPU & WiFi
* TPM 2.0 support:
  * Tools and libraries included for security capabilities: systemd-creds(1)

### Boot configuration

* GRUB2 bootloader configuration:
  * Serial console enablement, functional usage with Intel AMT via MeshCommander
  * Default selection timeout set to 20 seconds
* Live ISO `agetty` serial console enablement:
  * Workaround broken serial console handover with Minisforum MS-01 hardware
  * Functional usage with Intel AMT via MeshCommander
* Memtest86+ UEFI PE bootloader entry for memory testing


## Usage

Inclusion of the '_base' target is achieved in three steps:

1. Duplicate the live-build(7) 'auto/{config,clean}' auto scripts. These
   cannot be inherited at runtime as they are the auto script entrypoints that
   are targeted by `lb(7)` via the Mayflies project Makefile.

2. Defining the MAYFLIES_HOST_BASE_SHA to, ideally, the Git commit SHA of the
   '_base/auto/config.d/' configuration directory at a desired state. A Git tag
   (or HEAD) can be specified as a supported override if desired. This should
   be set in the 'target.env' target specific environment variable file.

3. Git archive + tar archive extract the contents of '_base/auto/config.d' to
   the runtime 'live-build(7)' 'config/' directory. This is achieved by
   extending the 'auto/config' auto script to source these files *first* then
   override (via clobbering) the target's overlay configuration.
   Nullifying inherited configuration can be performed with empty file
   placeholders or by specifying the absolute path (omitting the leading '/') as
   explicit excludes entries in the target's 'config.d/rootfs/excludes'
   configuration file.

### Example

A minimal, functional example of this is the `blu` host target: `motd`.
