# ExDns

**Domain Name System (DNS) Library for Elixir**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/Ayoush/ex_dns.svg?branch=master)](https://travis-ci.org/Ayoush/ex_dns)

`ex_dns` is an Elixir library that mimics some of the fundamental functionalities of a DNS. However, it falls short of being a comprehensive DNS solution. It serves as an abstraction, focusing on basic functionalities such as converting URLs to IP addresses. While it can be valuable for learning purposes and replicating examples from books or blogs on designing highly scalable systems, it is essential to note that ExDns is not suitable for production-grade applications.

## Features

- **Domain Name Resolution:** Resolve domain names to IP addresses with ease.
- **Record Retrieval:** Fetch specific DNS records for a given domain, including A, AAAA, MX, and more.
- **Caching:** Improve performance by implementing a caching mechanism for resolved DNS records.
- **Configuration:** Easily configure DNS settings, such as server addresses and timeouts.
- **Error Handling:** Comprehensive error handling for DNS resolution failures, timeouts, and invalid queries.
- **Documentation:** Clear and extensive documentation with usage examples and use cases.
- **Unit Testing:** Reliable and thoroughly tested core functionalities to ensure correctness.

**TODO: Add description**
- [] Since this is going to be read heavy, I highly encourage to create a replicas and index data properly for faster fetching
- [] Create a script to seed dummy urls and unique ips into database.
- [] Create a DNS resolver which will fetch the request and create a with proper header and question section
- [] Create a ROOT Server which listens to multiple request and forward the request to appropriate TLD Name server and add answer section
- [] At the time of application startup we are currently going to spawn 5 authoritive name server for (.com, .edu, .tech, .in, .ex). There respective PID's we will name and seed in the ETS table.
- [] Create dynamic TLD name servers which will accept the request and either redirect the request to already spawned TLD with the request or spawn one for new type. The ultimate goal of all the TLD's is to send request to authoritive name server by fetching the respective PID from ETS table.
- [] Main script of authoritive name server is simply to hit the target replica as based on the 5 authoritive name server 5 replicas has been created and  the respective IPs will return the DNS query which needs to reach to the our DNS resolver which in return print the IP to the user.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_dns` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_dns, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/ex_dns>.


### NOTE
**This library is designed for educational purposes and is not intended to function as a fully-fledged DNS (it is far from being one). I am actively working on creating a system design framework to replicate examples found in books or blogs related to designing highly scalable systems. The development of these basic libraries, such as ExDns, is part of that framework, which is solely intended for learning purposes. Therefore, it is strongly advised not to use ExDns in any production-grade application due to its limited reliability.**
