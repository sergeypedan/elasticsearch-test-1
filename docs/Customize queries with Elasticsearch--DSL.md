# Customize queries with Elasticsearch::DSL

Gem [GitHub](https://github.com/elastic/elasticsearch-ruby/tree/master/elasticsearch-dsl) page

Briefly:

	require 'elasticsearch/dsl'
	include Elasticsearch::DSL
	
	definition = search do
	  query do
	    match title: 'test'
	  end
	end
	
	definition.to_hash    => { query: { match: { title: "test"} } }
	
	require 'elasticsearch'
	client = Elasticsearch::Client.new trace: true
	
	client.search body: definition
		# transforms to
		# curl -X GET 'http://localhost:9200/test/_search?pretty' -d '{
		#   "query":{
		#     "match":{
		#       "title":"test"
		#     }
		#   }
		# }'
		# ...
	=> {"took"=>10, "hits"=> {"total"=>42, "hits"=> [...] } }