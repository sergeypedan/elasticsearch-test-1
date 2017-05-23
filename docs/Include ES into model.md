# Include ES into model

	require 'elasticsearch/model'

	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks

in your model. This provides a bunch of [helper methods](https://github.com/elasticsearch/elasticsearch-rails/tree/master/elasticsearch-model)