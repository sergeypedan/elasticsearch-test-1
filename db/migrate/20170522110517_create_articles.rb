class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :description
      t.references :user, foreign_key: true
      t.boolean :published, default: true

      t.timestamps
    end
  end
end
