# Search — multiple models

It is possible to search across multiple models with the module method:

	Elasticsearch::Model.search('fox', [Article, Comment]).results.to_a.map(&:to_hash)
	# => [
	#      {"_index"=>"articles", "_type"=>"article", "_id"=>"1", "_score"=>0.35136628, "_source"=>...},
	#      {"_index"=>"comments", "_type"=>"comment", "_id"=>"1", "_score"=>0.35136628, "_source"=>...}
	#    ]
	
	Elasticsearch::Model.search('fox', [Article, Comment]).records.to_a
	# Article Load (0.3ms)  SELECT "articles".* FROM "articles" WHERE "articles"."id" IN (1)
	# Comment Load (0.2ms)  SELECT "comments".* FROM "comments" WHERE "comments"."id" IN (1,5)
	# => [#<Article id: 1, title: "Quick brown fox">, #<Comment id: 1, body: "Fox News">,  ...]

By default, all models which include the `Elasticsearch::Model` module are searched.

**It is not possible to chain** other methods on top of the records object, since it is a heterogenous collection, with models potentially backed by different databases.