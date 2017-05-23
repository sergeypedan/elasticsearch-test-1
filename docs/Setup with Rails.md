# Setup with Rails

Вообще есть крутые [темплейты](https://github.com/elastic/elasticsearch-rails/blob/master/elasticsearch-rails/README.md#rails-application-templates) и даже Rake-task для их развёртки.

### Gems

	gem 'elasticsearch-model'
	gem 'elasticsearch-rails'

### Initializer

You'll need an initializer file to set up the Elasticsearch Client that the models use. Here is a simple example that sets up the default host to be `localhost:9200`, but uses the `config/elasticsearch.yml` file to overwrite the defaults:

config/elasticsearch.rb:

	config = {
	  host: "http://localhost:9200/",
	  transport_options: {
	    request: { timeout: 5 }
	  },
	}
	
	config.merge!(YAML.load_file("config/elasticsearch.yml").symbolize_keys) if File.exists?("config/elasticsearch.yml")
	
	Elasticsearch::Model.client = Elasticsearch::Client.new(config)

### Require for logs

[Including](https://github.com/elastic/elasticsearch-rails/blob/master/elasticsearch-rails/README.md#activesupport-instrumentation) ActiveSupport Instrumentation helps write query times into Rails logs

applicaiton.rb

	require 'elasticsearch/rails/instrumentation'