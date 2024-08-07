# Docs

## Installation

1. Setup router & network

- LAN - 192.168.20.0/24
- DHCP - 192.168.20.100-192.168.20.200
- DNS - Enable DHCP Registration & Static DHCP

2. Install & configure TrueNAS Scale

- Assign Static IP
- Create Storage Pool
- Enable Services
  - iSCSI
  - NFS
  - SMB
- Create SMB User
- Create Datasets
  - Vault - Multipurpose
  - Apps - Apps
  - VM Backups - General
  - Longhorn Backups - General
- Create NFS Shares
  - VM Backups
  - Longhorn Backups

3. Install & configure Proxmox

- Repos
  - Disable Enterprise
  - Enable Non Subscription
- Disable subscription nag screeen
- Other stuff I don't remember

4. Setup VMs for Docker & Plex
5. Install NixOS on Docker VM & Kubernetes nodes
6. Setup Static DHCP Leases for nodes

- Kubernetes - 192.168.20.11-192.168.20.13
- Docker - 192.168.20.21

7. Setup loadbalancer for Kubernetes cluster

- Virtual-IP - 192.168.20.9
- HAProxy
  - Settings - Enable - 100 Max connections - Enable reload behaviour
  - Backend - All 3 Nodes - Round robin - No health check
  - Frontend - Use Virtual-IP - TCP - Use backend as default
- DNS Resolver
  - Host Override
