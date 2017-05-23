# README

### 1. Install Elasticsearch

	brew update
	brew install elasticsearch
	reboot your PC       // kidding
	brew services start elasticsearch

### 2. Seed fake records:

in this order!

	rake fake:users
	rake fake:articles

### 3. Check

Open <http://localhost:3000> and search something.