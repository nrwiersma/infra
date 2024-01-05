# Home Infrastructure Management

[![Build Status](https://github.com/nrwiersma/infra/actions/workflows/tests.yml/badge.svg)](https://github.com/nrwiersma/infra/actions)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hamba/avro/master/LICENSE)

This is a set of ansible playbooks for managing my home infrastructure.

## Playbooks

### Speakers (*speakers.yaml*)

The speaker systems are Raspberry Pi Zeros with HiFiBerry Amp2+ HATs connected to
in-ceiling speakers. They run [raspotify](https://github.com/dtcooper/raspotify) to
expose them to Spotify Connect and [snapcast](https://github.com/badaix/snapcast) for
multi-room audio.

### Smart Mirror (*mirror.yaml*)

The smart mirror is a Raspberry Pi 4B (although a 3B works as well) connected to a
screen via HDMI. It runs [looking glass](https://github.com/glasslabs/looking-glass)
configured with my [config](https://github.com/nrwiersma/looking-glass-config).

### Home Lab Cluster (*cluster.yaml*)

The Home Lab is a Super6C fully loaded, running [k3s](https://k3s.io/), 
[cilium](https://cilium.io/) and [litestream](https://litestream.io/) for DB backups.
