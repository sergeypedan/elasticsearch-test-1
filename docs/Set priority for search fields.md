# Set priority for search fields

	def self.search(query)
	    __elasticsearch__.search(
	      {
	        query: {
	          multi_match: { query: query,
	                         fields: ['title^10', 'content']
	                       }
	        }
	      }
	    )
	  end