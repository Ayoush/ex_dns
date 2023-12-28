# Basic Domain Name Resolution Components:

## Root Name Servers (Root NS):
The root name servers are the highest-level DNS servers. They contain information about Top-Level Domains (TLDs) and direct queries to the appropriate TLD name servers.

## Top-Level Domains (TLDs):
TLDs are the next level in the DNS hierarchy. Common TLDs include .com, .org, .net, and country-code TLDs like .us, .uk. TLD name servers store information about second-level domains within their TLD.

## Authoritative Name Servers (Authoritative NS):
These are servers designated to be authoritative for a specific domain. They store the actual DNS records (like A, AAAA, MX) for the domains they are responsible for.

## Record Types:
DNS supports various record types, each serving a specific purpose. Here are some essential ones:

1. A Record (Address Record): Maps a domain to an IPv4 address.
2. AAAA Record (IPv6 Address Record): Maps a domain to an IPv6 address.
3. MX Record (Mail Exchange): Specifies mail servers responsible for receiving email on behalf of the domain.
4. NS Record (Name Server): Specifies authoritative name servers for the domain.
5. CNAME Record (Canonical Name): Alias of one domain to another. Used for creating aliases of domain names.
  
# Domain Name Resolution Flow:

## User Query:
The process begins when a user or system issues a DNS query to resolve a domain name (e.g., www.example.com).

## Root Name Servers:
The query is first sent to a root name server. The root name server doesn't know the IP address for the requested domain but directs the query to the appropriate TLD name server based on the TLD of the domain.

## TLD Name Server:
The TLD name server is responsible for knowing which authoritative name server is responsible for the domain. It provides the IP address of the authoritative name server for the next query.

## Authoritative Name Server:
The authoritative name server stores the specific DNS records for the requested domain. It responds with the IP address associated with the domain or the requested DNS record.

## Response to User:
The final IP address or DNS record is returned to the user, completing the resolution process.
