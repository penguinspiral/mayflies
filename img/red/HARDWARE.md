# About

Hardware inventory of host: `red`.


## Inventory

Generated with [inxi(1)](https://manpages.debian.org/testing/inxi/inxi.1.en.html):

```bash
$ sudo inxi --expanded
System:
  Host: red Kernel: 6.12.27-amd64 arch: x86_64 bits: 64
  Console: pty pts/1 Distro: Debian GNU/Linux 13 (trixie)

Machine:
  # cspell:disable-next-line
  Type: Desktop System: Micro (HK) Tech product: Venus Series v: 1.0 serial: MF217LS129QQMQA00119
  Mobo: Shenzhen Meigao Equipment model: AHWSA v: 1.0 serial: FHWSA129019C1020711 UEFI: American
    Megatrends LLC. v: 1.27 date: 04/03/2025

CPU:
  Info: 14-core (6-mt/8-st) model: 12th Gen Intel Core i9-12900H bits: 64 type: MST AMCP cache:
    L2: 11.5 MiB
  Speed (MHz): avg: 3400 min/max: 400/4900:5000:3800 cores: 1: 3400 2: 3400 3: 3400 4: 3400
    5: 3400 6: 3400 7: 3400 8: 3400 9: 3400 10: 3400 11: 3400 12: 3400 13: 3400 14: 3400 15: 3400
    16: 3400 17: 3400 18: 3400 19: 3400 20: 3400

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
  IF: enp2s0f0np0 state: down mac: 58:47:ca:7f:42:a8
  Device-2: Intel Ethernet X710 for 10GbE SFP+ driver: i40e
  IF: enp2s0f1np1 state: down mac: 58:47:ca:7f:42:a9
  Device-3: Intel Ethernet I226-V driver: igc
  IF: enp87s0 state: up speed: 2500 Mbps duplex: full mac: 58:47:ca:7f:42:aa
  Device-4: Intel Ethernet I226-LM driver: igc
  IF: enp88s0 state: down mac: 58:47:ca:7f:42:ab
  Device-5: MEDIATEK MT7922 802.11ax PCI Express Wireless Network Adapter driver: mt7921e

Bluetooth:
  Device-1: MediaTek Wireless_Device driver: btusb type: USB
  Report: rfkill ID: hci0 rfk-id: 0 state: down bt-service: not found rfk-block: hardware: no
    software: no address: see --recommends

Drives:
  Local Storage: total: 1.03 TiB used: 889.7 MiB (0.1%)
  ID-1: /dev/nvme0n1 vendor: Samsung model: SSD 990 EVO Plus 1TB size: 931.51 GiB
  ID-2: /dev/sda vendor: Samsung model: Flash Drive FIT size: 119.51 GiB type: USB

Partition:
  Message: No partition data found.

Swap:
  Alert: No swap data was found.

Sensors:
  Src: /sys System Temperatures: cpu: 72.0 C mobo: N/A
  Fan Speeds (rpm): N/A

Info:
  Memory: total: 96 GiB available: 94.04 GiB used: 45.78 GiB (48.7%) igpu: 60 MiB
  Processes: 275 Uptime: 15d 21h 30m Init: systemd Shell: Sudo inxi: 3.3.38
```
