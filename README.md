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

### 5. Read some docs

In the `/docs` folder or [here](https://github.com/sergeypedan/elasticsearch-test-1/tree/master/docs) in the GitHub project.
