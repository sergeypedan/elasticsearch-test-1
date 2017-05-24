module ElasticSearchable

  extend ActiveSupport::Concern

  included do

    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks


    # Customize the index name

    # index_name [Rails.application.engine_name, Rails.env].join('_')


    # Index configuration and mapping
    settings index: { number_of_shards: 1, number_of_replicas: 0 }

    # Set up callbacks for updating the index on model changes

    after_commit lambda { Indexer.perform_async(:index,  self.class.to_s, self.id) }, on: :create
    after_commit lambda { Indexer.perform_async(:update, self.class.to_s, self.id) }, on: :update
    after_commit lambda { Indexer.perform_async(:delete, self.class.to_s, self.id) }, on: :destroy
    after_touch  lambda { Indexer.perform_async(:update, self.class.to_s, self.id) }


    # Customize the JSON serialization for Elasticsearch
    def as_indexed_json(options={})
      hash = self.as_json(
        only: [:title, :description, :published]
        # include: {
          # authors:  { methods: [:full_name], only: [:full_name] },
          # comments: { only: [:body, :stars, :pick, :user, :user_location] }
        # }
      )
      hash
    end


    # Search in title and content fields for `query`, include highlights in response

    # @param query [String] The user query
    # @return [Elasticsearch::Model::Response::Response]

    def self.search(query, options={})

      logger.debug ">>>>>>>>> Entering `Article.search`"
      logger.debug ">>>>>>>>> query: #{query}"


      # Prefill and set the filters (top-level `post_filter` and aggregation `filter` elements)

      @search_definition = {
        query: {},
        highlight: {
          pre_tags: ['<em class="label label-highlight">'],
          post_tags: ['</em>'],
          fields: {
            title:    { number_of_fragments: 0 },
            description:  { fragment_size: 50 }
          }
        }
      }

      if query.present?
        @search_definition[:query] = {
          bool: {
            should: [
              { multi_match: {
                  query: query,
                  fields: ['title^10', 'description'],
                  operator: 'and'
                }
              }
            ]
          }
        }
      else
        @search_definition[:query] = { match_all: {} }
        @search_definition[:sort]  = { updated_on: 'desc' }
      end

      __elasticsearch__.search( @search_definition )
    end
  end

end
