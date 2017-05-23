# Search — Elasticsearch DSL

From <https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-model#the-elasticsearch-dsl>

In most situations, you'll want to pass the search definition in the Elasticsearch domain-specific language to the client:

	response = Article.search query:     { match:  { title: "Fox Dogs" } },
	                          highlight: { fields: { title: {} } }
	
	response.results.first.highlight.title
	# ["Quick brown <em>fox</em>"]

You can pass any object which implements a to_hash method, which is called automatically, so you can use a custom class or your favourite JSON builder to build the search definition:

	require 'jbuilder'
	
	query = Jbuilder.encode do |json|
	  json.query do
	    json.match do
	      json.title do
	        json.query "fox dogs"
	      end
	    end
	  end
	end
	
	response = Article.search query
	response.results.first.title
	# => "Quick brown fox"

Also, you can use the elasticsearch-dsl library, which provides a specialized Ruby API for the Elasticsearch Query DSL:

	require 'elasticsearch/dsl'
	
	query = Elasticsearch::DSL::Search.search do
	  query do
	    match :title do
	      query 'fox dogs'
	    end
	  end
	end
	
	response = Article.search query
	response.results.first.title
	# => "Quick brown fox"