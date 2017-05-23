# create_table :users, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
#   t.string :first_name
#   t.string :last_name
#   t.date :date_of_birth
#   t.boolean :published
#   t.datetime :created_at, null: false
#   t.datetime :updated_at, null: false
# end

class User < ApplicationRecord

  has_many :articles

  def full_name
    "#{first_name} #{last_name}"
  end

end
