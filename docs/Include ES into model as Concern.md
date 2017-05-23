# Include ES into model as Concern

Encapsulate the indexing / searching logic into an `ActiveSupport::Concern` that can be included in your model. [Example](https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-model#feature-extraction-pattern).

app/models/concerns/searchable.rb:

	module Searchable
	  extend ActiveSupport::Concern
	
	  included do
	    include Elasticsearch::Model
	
	    mapping do
	      # ...
	    end
	
	    def self.search(query)
	      # ...
	    end
	  end
	end

app/models/article.rb:

	class Article
	  include Searchable
	end