# README

### 1. Install Elasticsearch

	brew update
	brew install elasticsearch
	reboot your PC       // kidding
	brew services start elasticsearch

### 2. Bundle-up

	cd <project folder>
	bundle install

### 3. Seed fake records:

in this order!

	rake fake:users
	rake fake:articles

### 4. Check

Open <http://localhost:3000> and search something.
