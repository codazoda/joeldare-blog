---
date: "2017-05-27"
title: "Wireless BBS"
tags: ["tech","bbs"]
---

## Introduction

I'm inspired by the nostalgia of the BBS systems of my youth and by the high cost of modern Internet service providers. By the impending loss of net neutrality in the United States and by the widespread spying of worldwide governments on their citizens and corporations on their customers.

Wireless BBS is a configuration suggestion for local operators who wish to share websites with their communities without connection costs. It describes a simple setup for using relatively cheap off-the-shelf consumer WiFi routers to communicate with your close neighbors using a web browser. It also describes a method of using the git version control software for mirroring data across systems who wish to coordinate.

Data storage and bandwidth are a burden of the Wireless BBS operator. Bandwidth is limited only by the WiFi router and storage is limited by the disk space the operator chooses to setup and the networks he joins.

## Wireless BBS Operator Setup

Here are the typical steps to setup a Wireless BBS system.

  - Setup a WiFi router on 192.168.1.x
  - Set the SSID broadcast to bbs-{whatever}
  - Set the password to bbs-{whatever}
  - Disable the Internet connection
  - Setup a web server on 192.168.1.227
  - Setup a DNS server that always returns 192.168.1.227
  
Your SSID should begin with `bbs-` such as `bbs-poizon` or `bbs-joeldare`. This will make the systems more obvious to users who are browsing for available hotspots and organize them together alphabetically in common wifi lists.
  
Wireless BBS systems are off-line. They should not provide the user a connection to the Internet. This prevents tracking of an individuals movements by systems connected to the Internet (such as Google Analytics). Users can bypass this and provide their own internet connections from a second network interface but doing so is not recommended if privacy is a concern.

Setting the hotspot to have a password that matches the SSID broadcast name allows anyone, who knows how the system works, to connect to it while still allowing the data to be encrypted in transit. It does so without requiring commercial routers or complicated configurations.
  
## Client Setup

Consumers of local Wireless BBS systems simply connect to them, like they would any hotspot, and point their web browser at any domain name. You can connect from anything that supports WiFi and includes a browser such as a computer or mobile phone.

  - Connect to any visible `bbs-` wifi hotspot
  - Enter the hotspot name as the password
  - Point your browser at 192.168.1.227 or any domain name

## Special DNS Server

A very simple DNS server will be created. The DNS server will respond to every request with an A record pointed to 192.168.1.227. If someone connects to a Wireless BBS system, and tries to access any domain name, they will be directed to the BBS server instead. See the PHP DNS Server listed below as a minimalist example.

## Network Setup

Anyone can create and organize a network of other Wireless BBS systems simply by making the files available via git. Whenever members of a network connect to the same WiFi network they can sync that information. A Wireless BBS operator can sync with multiple networks. Wasatch Net is such a network which contains a list of static blog posts from Wireless BBS operators along the Wasatch Front. Network information can be exchanged peer-to-peer using git or over the Internet using a central repository such as GitHub. Networks can each set their own rules about what types of information they will exchange with each other and what system requirements they will impose on any operator who chooses to include the network on their system.

## Other Thoughts

The computer running the Wireless BBS should run on IP 192.168.1.227. The number `227` is `BBS` on an old telephone keypad. Since a DNS service will return the operators IP for any domain name, the IP addresses are not necessarily a strict requirement.

Each networks can decide how they will deal with name conflicts. The policy used by npm may be a good default. This policy says that the first person to use a name wins; at least until the lawyers get involved.

Multiple people can connect to a single Wireless BBS at a time because it's a simple WiFi network. Typical home WiFi routers, however, have a very limited range. This can be improved with higher powered wifi routers supporting pointed antennas in places where it makes sense to do so. Some WiFi routers can cover line of sight distances of miles. Routers with antennas mounted on a hill can cover fairly wide distances and sometimes entire valley's.

Wireless BBS operators can choose the OS and server software they wish to run.

Wireless BBS systems only support static web pages by default, however different networks can implement their own system requirements (i.e. Wasatch Net requires operators to add support for PHP).

Networks can implement build systems or monitoring systems that do things such as search their repos and remove code that might contact the Internet.

SSL should be used for all connections. There should be a self-signed certificate authority that can be added to browsers so that SSL can be used without the certificate authorities. This would provide encryption but not verification. This could be for the entire network, at the local network level, or on a single machine.

## Networks

Here are a couple theoretical examples of networks that might be setup and shared by Wireless BBS operators.

**Wasatch Net**

This network might exchange blog posts, comments, and message boards for users along the Wasatch Front where I reside. It might also require Wireless BBS systems that choose to be part of the network to support PHP.

**Movie Net**

This network might exchange full length, legally licensed, movies or shows. Obtaining the rights to distribute movies or shows would be a difficult network organizer problem. Operators would also have very high storage requirements. A digital rights management solution might be required of Wireless BBS systems who support Movie Net.

There are two options for setting up a Wireless BBS system. The first is to set it up in a permanent location. People near this area will be able to find it regularly. The second is to set it up on a mobile computer. The second type would be available only when the laptop is on and it would move from location to location. People who don't typically see this system, however, could use it.
  
## PHP DNS Server

I found a minimal DNS server called DNServer. It was written by Cesar Rodas in PHP and released as public domain. I've created an example [bbs-dns project on GitHub](https://github.com/codazoda/bbs-dns) that returns 192.168.1.227 for every DNS request. You can download the files and start the DNS server with the following command.

```
sudo php example.php
```
