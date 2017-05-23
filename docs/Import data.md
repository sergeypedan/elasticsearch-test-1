# Import data

`Importing` module [source file](https://github.com/elastic/elasticsearch-rails/blob/master/elasticsearch-model/lib/elasticsearch/model/importing.rb)

	Article.__elasticsearch__.import

to index all of your model's records. This will be really slow, so it's really only useful for small data sets or testing out in development.

## Import: with Rake

Alternative import flow with a [special Rake task](https://github.com/elastic/elasticsearch-rails/blob/master/elasticsearch-rails/README.md#rake-tasks)

To facilitate importing data from your models into Elasticsearch, require the task definition in your application, eg. in the `lib/tasks/elasticsearch.rake` file:

	require 'elasticsearch/rails/tasks/import'

To import the records from your Article model, run:

	$ bundle exec rake environment elasticsearch:import:model CLASS='Article'

To limit the imported records to a certain ActiveRecord scope, pass it to the task:

	$ bundle exec rake environment elasticsearch:import:model CLASS='Article' SCOPE='published'

Run this command to display usage instructions:

	$ bundle exec rake -D elasticsearch