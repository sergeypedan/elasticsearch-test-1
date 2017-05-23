namespace :fake do

  task users: :environment do

    RECORDS_COUNT = 30

    def create_user
      User.create!(
        first_name:    Faker::Name.first_name,
        last_name:     Faker::Name.last_name,
        date_of_birth: Faker::Date.between(80.years.ago, 15.years.ago),
        published:     true
      )
    end

    puts "\nJust for the record, now we have #{User.count} users."
    puts "Deleting em all..."
    User.delete_all
    puts "Good."

    puts "\nWill seed #{RECORDS_COUNT} fake users"
    RECORDS_COUNT.times do
      puts "Creating..."
      create_user
    end

    puts "\nEnd creating."

    puts "Now we have #{User.count} users\n"

  end

end
