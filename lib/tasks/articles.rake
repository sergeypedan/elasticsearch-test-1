namespace :fake do

  task articles: :environment do

    RECORDS_COUNT = 100

    def create_user
      Article.create!(
        title:       Faker::StarWars.quote,
        description: Faker::Hipster.paragraph(4),
        user_id:     User.ids.sample
      )
    end

    puts "\nJust for the record, now we have #{Article.count} articles."
    puts "Deleting em all..."
    Article.delete_all
    puts "Good."

    puts "\nWill seed #{RECORDS_COUNT} fake users"
    RECORDS_COUNT.times do
      puts "Creating..."
      create_user
    end

    puts "\nEnd creating."

    puts "Now we have #{Article.count} articles\n"

  end

end
