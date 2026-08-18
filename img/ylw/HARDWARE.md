# About

Hardware inventory of host: `ylw`.


## Inventory

Generated with [inxi(1)](https://manpages.debian.org/testing/inxi/inxi.1.en.html):

```bash
$ sudo inxi --expanded
System:
  Host: ylw Kernel: 6.12.27-amd64 arch: x86_64 bits: 64
  Console: pty pts/1 Distro: Debian GNU/Linux 13 (trixie)

Machine:
  # cspell:disable-next-line
  Type: Desktop System: Micro (HK) Tech product: Venus Series v: 1.0 serial: MF217LS129QQMQA00143
  Mobo: Shenzhen Meigao Equipment model: AHWSA v: 1.0 serial: FHWSA129019C1020589 UEFI: American
    Megatrends LLC. v: 1.27 date: 04/03/2025

CPU:
  Info: 14-core (6-mt/8-st) model: 12th Gen Intel Core i9-12900H bits: 64 type: MST AMCP cache:
    L2: 11.5 MiB
  Speed (MHz): avg: 400 min/max: 400/4900:5000:3800 cores: 1: 400 2: 400 3: 400 4: 400 5: 400
    6: 400 7: 400 8: 400 9: 400 10: 400 11: 400 12: 400 13: 400 14: 400 15: 400 16: 400 17: 400
    18: 400 19: 400 20: 400

Graphics:
  Device-1: Intel Alder Lake-P GT2 [Iris Xe Graphics] driver: i915 v: kernel
  Display: server: No display server data found. Headless machine? tty: 99x62
    resolution: 1920x1080
  API: N/A Message: No API data available in console. Headless machine?
  Info: Tools: No graphics tools found.

Audio:
  Device-1: Intel Alder Lake PCH-P High Definition Audio driver: snd_hda_intel
  API: ALSA v: k6.12.27-amd64 status: kernel-api

Network:
  Device-1: Intel Ethernet X710 for 10GbE SFP+ driver: i40e
  IF: enp2s0f0np0 state: down mac: 58:47:ca:7f:3a:d0
  Device-2: Intel Ethernet X710 for 10GbE SFP+ driver: i40e
  IF: enp2s0f1np1 state: down mac: 58:47:ca:7f:3a:d1
  Device-3: Intel Ethernet I226-V driver: igc
  IF: enp87s0 state: up speed: 2500 Mbps duplex: full mac: 58:47:ca:7f:3a:d2
  Device-4: Intel Ethernet I226-LM driver: igc
  IF: enp88s0 state: down mac: 58:47:ca:7f:3a:d3
  Device-5: MEDIATEK MT7922 802.11ax PCI Express Wireless Network Adapter driver: mt7921e

Bluetooth:
  Device-1: MediaTek Wireless_Device driver: btusb type: USB
  Report: rfkill ID: hci0 rfk-id: 0 state: down bt-service: not found rfk-block: hardware: no
    software: no address: see --recommends

Drives:
  Local Storage: total: 1.03 TiB used: 2.13 GiB (0.2%)
  ID-1: /dev/nvme0n1 vendor: Samsung model: SSD 990 EVO Plus 1TB size: 931.51 GiB
  ID-2: /dev/sda vendor: Samsung model: Flash Drive FIT size: 119.51 GiB type: USB

Partition:
  Message: No partition data found.

Swap:
  Alert: No swap data was found.

Sensors:
  Src: /sys System Temperatures: cpu: 45.5 C mobo: N/A
  Fan Speeds (rpm): N/A

Info:
  Memory: total: 96 GiB available: 94.04 GiB used: 1.47 GiB (1.6%) igpu: 60 MiB
  Processes: 258 Uptime: 15d 21h 13m Init: systemd Shell: Sudo inxi: 3.3.38
```
