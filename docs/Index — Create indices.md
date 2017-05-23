# Create index

`indexing` module [source file](https://github.com/elastic/elasticsearch-rails/blob/master/elasticsearch-model/lib/elasticsearch/model/indexing.rb)  
`create_index!` funciton [source file](https://github.com/elastic/elasticsearch-rails/blob/master/elasticsearch-model/lib/elasticsearch/model/indexing.rb#L207)

To index your data, you can use the built in

	Article.__elasticsearch__.create_index!
	Article.__elasticsearch__.create_index!( force: true )
	Article.__elasticsearch__.index_exists?
	Article.__elasticsearch__.index_exists?( 'my-index' )
	Article.__elasticsearch__.refresh_index!
	Article.__elasticsearch__.delete_index!