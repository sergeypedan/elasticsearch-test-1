# Search — to records

	response.records.to_a
	response.records.where(title: 'Quick brown fox').to_a
	response.records.order(:title).to_a

[Search results as database records](https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-model#search-results-as-database-records)

Instead of returning documents from Elasticsearch, the `records` method will return a collection of model instances, fetched from the primary database, ordered by score:

	response.records.to_a
	
	# Article Load (0.3ms)  SELECT "articles".* FROM "articles" WHERE "articles"."id" IN (1, 2)

	# => [#<Article id: 1, title: "Quick brown fox">, #<Article id: 2, title: "Fast black dogs">]

The returned object is the genuine `ActiveRecord::Relation`. This allows you to chain other methods on top of search results, as you would normally do:

	response.records.where(title: 'Quick brown fox').to_a

	# Article Load (0.2ms)  SELECT "articles".* FROM "articles" WHERE "articles"."id" IN (1, 2) AND "articles"."title" = 'Quick brown fox'
	# => [#<Article id: 1, title: "Quick brown fox">]

	response.records.records.class
	# => ActiveRecord::Relation::ActiveRecord_Relation_Article

The ordering of the records by `score` will be preserved, unless you explicitly specify a different order in your model query language:

	response.records.order(:title).to_a
	
	# Article Load (0.2ms)  SELECT "articles".* FROM "articles" WHERE "articles"."id" IN (1, 2) ORDER BY "articles".title ASC
	
	# => [#<Article id: 2, title: "Fast black dogs">, #<Article id: 1, title: "Quick brown fox">]

The `records` method returns the real instances of your model, which is useful when you want to access your model methods — <span style="color: crimson;">at the expense of slowing down your application</span>, of course.

In most cases, working with results coming from Elasticsearch is sufficient, and much faster. See the `elasticsearch-rails` library for more information about compatibility with the Ruby on Rails framework.

When you want to access both the database records and search results, use the `each_with_hit` (or `map_with_hit`) iterator:

	response.records.each_with_hit { |record, hit| puts "* #{record.title}: #{hit._score}" }

	# * Quick brown fox: 0.02250402
	# * Fast black dogs: 0.02250402