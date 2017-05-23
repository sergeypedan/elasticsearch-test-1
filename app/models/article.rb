# create_table :articles, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
#   t.string :title, null: false
#   t.text :description
#   t.bigint :user_id
#   t.boolean :published, default: true
#   t.datetime :created_at, null: false
#   t.datetime :updated_at, null: false
#   t.index [:user_id], name: :index_articles_on_user_id
# end

require 'elasticsearch/model'

class Article < ApplicationRecord

  include ElasticSearchable

  belongs_to :user

end

# Article.import
# for auto sync model with elastic search,
# from here: https://www.sitepoint.com/full-text-search-rails-elasticsearch/
