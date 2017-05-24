# README

## Setup

### 1. Install Elasticsearch

	$ brew update
	$ brew install elasticsearch
	$ brew services start elasticsearch

### 2. Bundle-up

	$ cd <project folder>
	$ bundle install

### 3. Seed fake records:

in this order!

	$ rake fake:users
	$ rake fake:articles

### 4. Create Elasticsearch indices

	$ rails c
	> Article.__elasticsearch__.index_exists?
	> Article.__elasticsearch__.create_index!(force: true)
	> Article.__elasticsearch__.index_exists?

### 5. Import DB records into Elasticsearch

	$ rails c
	> Article.import

## Check

Open <http://localhost:3000> and search something.

## Read docs

in the `/docs` folder or [here](https://github.com/sergeypedan/elasticsearch-test-1/tree/master/docs) in the GitHub project.
