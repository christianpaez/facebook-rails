# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FriendRequest.destroy_all
User.destroy_all

main_user = User.create({
    email: "christian@gmail.com",
    description: "myself",
    password: "password"
})

main_user.save
300.times do|index|
    user = User.create({
        email: Faker::Internet.email, 
        description: Faker::Lorem.paragraph,
        password: "password"
    })
    user.save
    
    # create friend requests
    FriendRequest.create({
        from_user_id: user.id,
        to_user_id: main_user.id
    })
    if index < 100     
        # add friends
        main_user.friends << user
    end

end