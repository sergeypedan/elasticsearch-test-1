# Index — Customize model indexing

Here's the [full template](https://github.com/elastic/elasticsearch-rails/blob/master/elasticsearch-rails/lib/rails/templates/searchable.rb).

The key method here is the `as_indexed_json`. You can define your entire index using this method. It defaults to just calling `as_json` on your object, so you'll probably want to overload that to define the data that you actually want indexed. As a simple example, you may want to define an index on your `Article` model. Here's what it could look like:

	def as_indexed_json
	  self.as_json({
	    only: [:title, :description, :text, :type, :status],
	    include: {
	      author: { only: :name },
	      tags: { only: :name },
	    }
	  })
	end

The key point here is that you only want to index the fields/relations that you actually need the search indexing on. The more fields you index, the larger the index will be in Elasticsearch, meaning more powerful hardware will be needed. Also, the larger the index is, the longer the search query will take.