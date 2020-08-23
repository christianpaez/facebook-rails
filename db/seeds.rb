# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

main_user = User.create({
    email: "christian@gmail.com",
    description: "myself",
    password: "password"
})

main_user.save
30.times do|index|
    user = User.create({
        email: Faker::Internet.email, 
        description: Faker::Lorem.paragraph,
        password: "password"
    })
    user.save
    
    if index < 10     
        # add friends
        main_user.friends << user  
    else
        # create friend requests
        FriendRequest.create({
            from_user_id: user.id,
            to_user_id: main_user.id
        })
    end

end