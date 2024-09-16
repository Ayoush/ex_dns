import Config

config :libcluster,
  topologies: [
    seeder_topology: [
      strategy: Cluster.Strategy.Gossip,
      config: [
        port: 45892,  # Choose an available port for gossip messages
        if_addr: "0.0.0.0",  # Interface to listen on
        multicast_addr: "230.1.1.251",  # Multicast address for gossip
        multicast_ttl: 1,  # TTL for multicast
        secret: "supersecret"  # Optional: Add a secret for security
      ]
    ]
  ]
