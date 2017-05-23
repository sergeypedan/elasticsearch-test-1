# Search — basic

https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-model#searching

	response = Article.__elasticsearch__.search "mykeyword"

	response.took                         # => 3
	response.results                      # => collection
	response.results.total                # => 2
	response.results.first._score         # => 0.02250402
	response.results.first._source.title  # => "Quick brown fox"