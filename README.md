[![License: BY-NC-SA 4.0](https://mirrors.creativecommons.org/presskit/buttons/88x31/svg/by-nc-sa.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode.txt)

# Understanding DNS: The Internet's Address Book
Have you ever wondered how your computer knows where to find websites when you type in their names? That's where the Domain Name System (DNS) comes into play. Think of it as the phonebook of the Internet, translating human-readable domain names like nytimes.com or espn.com into computer-friendly IP addresses.

Just like every building has a unique street address, every device connected to the Internet has its own unique IP address. These addresses, like 192.168.1.1 or more complex ones such as 2400:cb00:2048:1::c629:d7a2, are how machines find each other online. DNS servers take care of this translation so that you don't have to memorize strings of numbers.

# Behind the Scenes: How DNS Works
When you type a website address into your browser, like www.example.com, your computer needs to find the corresponding IP address to load the webpage. This process, known as DNS resolution, is similar to finding a specific home using its street address.

But how does this translation happen? It involves a series of steps passing through different hardware components. However, for the user, it all happens seamlessly in the background without any direct interaction.

Understanding DNS resolution gives insight into how the Internet functions behind the scenes, making browsing the web a smooth experience for users worldwide.

# The DNS Journey: Navigating Through 4 Servers
When you type a website address into your browser and hit enter, a complex journey begins behind the scenes involving four key players: the DNS recursor, root nameserver, TLD nameserver, and authoritative nameserver. Let's take a closer look at each one:

1. **DNS Recursor**
Think of the DNS recursor as a diligent librarian. When you request a book (or in this case, a webpage) from the library (Internet), the recursor receives your query through applications like web browsers. It then sets off on a quest to find the requested information, making additional requests if needed to fulfill your DNS query.

2. **Root Nameserver**
Imagine the root server as the starting point in your quest for knowledge. Like an index in a library, it points you in the direction of various sections. This server is the first step in translating human-readable domain names into IP addresses, providing references to more specific locations in the DNS hierarchy.

3. **TLD Nameserver**
Next up is the top-level domain (TLD) server, akin to a specific rack of books in the library. It hosts the last portion of a hostname, such as ".com" in "example.com". This server plays a crucial role in narrowing down the search for a specific IP address, guiding the query closer to its destination.

4. **Authoritative Nameserver**
Finally, we reach the authoritative nameserver, comparable to a comprehensive dictionary in the library. Here, specific names are translated into their definitive IP addresses. It serves as the last stop in the DNS query journey. If the authoritative nameserver possesses the requested record, it promptly returns the IP address to the DNS recursor, completing the cycle.

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

# DNS Message Structure:

## Header Section:
Contains metadata about the DNS message, including:

1. **Identification**: A 16-bit identifier for the query, which is echoed in the response to match queries with responses.
2. **Flags**: Control flags indicating the type of message (query or response), recursion desired, recursion available, and more.
3. **Question Count**: Number of entries in the question section.
4. **Answer, Authority, and Additional Count**: Number of resource records in each of these sections.

## Question Section:
Contains one or more entries, each specifying a question for the DNS server. A question includes the domain name being queried and the type of resource record being sought (e.g., A, AAAA, MX).

## Answer Section:
Contains resource records that answer the questions in the question section. For example, if the question is about the A (address) record for a domain, the answer section will include the IP address.

## Authority Section:
Contains resource records that point to authoritative DNS servers for the queried domain. These servers are considered authoritative for the domain's records.

## Additional Section:
Contains additional resource records that are not directly related to the query but may provide extra information, such as IP addresses for the authoritative name servers.

# DNS Resolution Process:

## User Initiates Query:
When you enter a domain name in your browser, the browser's DNS resolver initiates a DNS query.

## DNS Message Sent:
The DNS resolver constructs a DNS message with the question section containing the domain name and the desired record type (e.g., A record).

## Query Sent to Recursive Resolver:
The DNS resolver typically sends the query to a recursive resolver provided by the ISP or another designated resolver.

## Recursive Resolver Processes the Query:
The recursive resolver follows the DNS resolution process, querying root name servers, TLD name servers, and authoritative name servers until it obtains the final answer.

## Response Sent to User:
The recursive resolver sends the final answer back to the user's DNS resolver, and the browser can then proceed to connect to the resolved IP address.


# Example of the Flow :-
## 1. User Initiates Query:
User Query: User types "www.example.com" in the browser.

## 2. DNS Resolver at User's End:
### DNS Resolver Query: 
The browser's DNS resolver creates a DNS query message.
```bash
Header Section:
  Identification: 1234
  Flags: QR=0 (Query), RD=1 (Recursion Desired)
  Question Count: 1
Question Section:
  QNAME: www.example.com
  QTYPE: A (IPv4 address)
```

## 3. Query Sent to Recursive Resolver:
### Query Sent to Recursive Resolver:
The DNS resolver sends the query to a recursive resolver provided by the ISP.

### Recursive Resolver Query:
Recursive resolver adds its own information:
```bash
  Source IP: Resolver's IP address
  Identification: 5678
```
Sends the query to the root name server.

## 4. Root Name Server:
### Root Name Server Response:
The root name server responds with information about the Top-Level Domain (TLD) name server for ".com."

Response Message:
```bash
  Header Section:
    Identification: 5678 (Echoed from the query)
    Flags: QR=1 (Response), RD=1 (Recursion Desired), RA=1 (Recursion Available)
    Answer Count: 1
  Answer Section:
    NAME: (empty, root server doesn't provide domain names)
    TYPE: NS (Name Server)
    DATA: ns1.verisign.net (the TLD name server for ".com")
```

## 5. TLD Name Server for ".com":
### TLD Name Server Query:
The recursive resolver queries the TLD name server for ".com."
Query Message:
```bash
  Header Section:
    Identification: 5678 (Echoed from the previous response)
    Flags: QR=0 (Query), RD=1 (Recursion Desired)
    Question Count: 1
  Question Section:
    QNAME: www.example.com
    QTYPE: A (IPv4 address)
```

### TLD Name Server Response:
The TLD name server responds with information about the authoritative name server for "example.com."

Response Message:
```bash
  Header Section:
    Identification: 5678 (Echoed from the query)
    Flags: QR=1 (Response), RD=1 (Recursion Desired), RA=1 (Recursion Available)
    Answer Count: 1
  Answer Section:
    NAME: example.com
    TYPE: NS (Name Server)
    DATA: ns1.example.com (the authoritative name server for "example.com")
```

## 6. Authoritative Name Server for "example.com":
### Authoritative Name Server Query:
The recursive resolver queries the authoritative name server for "example.com."
Query Message:
```bash
  Header Section:
    Identification: 5678 (Echoed from the previous response)
    Flags: QR=0 (Query), RD=1 (Recursion Desired)
    Question Count: 1
  Question Section:
    QNAME: www.example.com
    QTYPE: A (IPv4 address)
```

### Authoritative Name Server Response:
The authoritative name server responds with the IP address of "www.example.com."
Response Message:
```bash
  Header Section:
    Identification: 5678 (Echoed from the query)
    Flags: QR=1 (Response), RD=1 (Recursion Desired), RA=1 (Recursion Available)
    Answer Count: 1
  Answer Section:
    NAME: www.example.com
    TYPE: A (IPv4 address)
    DATA: 192.0.2.1 (example IP address)
```

## 7. Response Sent to User:
### Recursive Resolver Response:
The recursive resolver sends the final answer back to the user's DNS resolver.

Final Response Message:
```bash
  Header Section:
    Identification: 5678 (Echoed from the query)
    Flags: QR=1 (Response), RD=1 (Recursion Desired), RA=1 (Recursion Available)
    Answer Count: 1
  Answer Section:
    NAME: www.example.com
    TYPE: A (IPv4 address)
    DATA: 192.0.2.1 (example IP address)
```

![FLOW DIAGRAM](https://drive.google.com/uc?id=1TF1ugBPiENjGLedFj9KSNYUpS-1jfaml)

## Note:-
The QTYPE field in a DNS query message specifies the type of resource record being requested.
Different values for QTYPE indicate different types of resource records that the resolver is requesting. For example:

1. A for IPv4 address.
2. AAAA for IPv6 address.
3. MX for mail exchange.
4. NS for name server.
5. CNAME for canonical name.



The authoritative name server will respond with the appropriate information based on the QTYPE specified in the query. In the case of QTYPE: A, the response will include the IPv4 address associated with the queried domain.


# ExDns

**Domain Name System (DNS) Library for Elixir**

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
- [] At the time of application startup we are currently going to spawn 5 authoritive name server for (.com, .edu, .tech, .in, .io). There respective PID's we will name and seed in the ETS table.
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

