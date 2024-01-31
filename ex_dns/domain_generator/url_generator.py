from faker import Faker
import json
import socket
import struct 
import random

fake = Faker()

def generate_random_ipv4():
    return socket.inet_ntoa(struct.pack('>I', random.randint(1, 0xFFFFFFFF)))

def generate_random_url():
    domains = [".in", ".com", ".edu", ".tech", ".io"]
    return f"http://{fake.word()}{random.choice(domains)}"

def generate_random_data(num_entries):
    data = []
    for _ in range(num_entries):
        entry = {
            "url": generate_random_url(),
            "ipv4": generate_random_ipv4(),
            # Add more fields as needed
        }
        data.append(entry)
    return data

if __name__ == "__main__":
    num_entries = 10  # Adjust as needed
    mock_data = generate_random_data(num_entries)
    print(mock_data)

    # with open("mock_data.json", "w") as json_file:
    #     json.dump(mock_data, json_file, indent=2)
