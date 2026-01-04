<picture>
  <source media="(prefers-color-scheme: dark)" srcset="http://svg.wiersma.co.za/github/project.v2?title=infra&tag=home%20infrastructure%20management&mode=dark">
  <source media="(prefers-color-scheme: light)" srcset="http://svg.wiersma.co.za/github/project.v2?title=infra&tag=home%20infrastructure%20management">
  <img alt="Logo" src="http://svg.wiersma.co.za/github/project.v2?title=infra&tag=home%20infrastructure%20management">
</picture>

[![Build Status](https://github.com/nrwiersma/infra/actions/workflows/tests.yml/badge.svg)](https://github.com/nrwiersma/infra/actions)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hamba/avro/master/LICENSE)

This is a set of ansible playbooks for managing my home infrastructure.

## Playbooks

To run a playbook, use `ansible-playbook <playbook.yaml>`.

### Speakers (*speakers.yaml*)

The speaker systems are Raspberry Pi Zeros with HiFiBerry Amp2+ HATs connected to
in-ceiling speakers. They run [raspotify](https://github.com/dtcooper/raspotify) to
expose them to Spotify Connect and [snapcast](https://github.com/badaix/snapcast) for
multi-room audio.

### Smart Mirror (*mirror.yaml*)

The smart mirror is a Raspberry Pi 4B (although a 3B works as well) connected to a
screen via HDMI. It runs [looking glass](https://github.com/glasslabs/looking-glass)
configured with my [config](https://github.com/nrwiersma/looking-glass-config).

### Power Monitor

The power monitor is a Raspberry Pi PoE+ running InfluxDB and Grafana. Electricity usage
and inverter data is pushed to the InfluxDB. Cron backups are made daily.

### Home Lab Cluster (*cluster.yaml*)

The Home Lab is a Super6C fully loaded, running [k3s](https://k3s.io/), 
[metallb](https://metallb.universe.tf/) and cron for DB backups.

#### Storage Drives

The storage NVME drives are each 4TB. In order to see the entire drive, they must be converted to a Hybrid Partition Table.
Boot the system using an external drive, and run the `.setup/mbr2gpt` to convert the partition table.
