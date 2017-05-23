# Highlight results

	def self.search(query)
	    __elasticsearch__.search(
	      {
	        query: {
	          ...
	        },
	        highlight: {
	          pre_tags: ['<em class="label label-highlight">'],
	          post_tags: ['</em>'],
	          fields: {
	            title:   { number_of_fragments: 0 },
	            content: { fragment_size: 25 }
	          }
	        }
	      }
	    )
	  end