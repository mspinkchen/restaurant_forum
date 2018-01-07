namespace :dev do
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample,
        )
    end

    puts "Have created fake eestaurant"
    puts "now you have #{Restaurant.count} restaurant data" 
  end
  
  task fake_user: :environment do

    20.times do |i|
      User.destroy_all
      user_name = FFaker::Name.first_name
      User.create!(
      name: user_name,
      email: "#{user_name}@example.com",
      password: "12345678"
      )
    end    

    puts "Have created fake user"
    puts "now you have #{User.count} user data" 
  end


  task fake_comment: :environment do
    Comment.destroy_all
    Restaurant.all.each do |restaurant|

      3.times do |i|
        restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
          )
      end
    end
    puts "Have created fake comment"
    puts "now you have #{Comment.count} comment data" 
  end



end