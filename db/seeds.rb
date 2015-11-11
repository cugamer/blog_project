test_user = User.create!(user_name:               "snow",
                        name:                     "John Smith",
                        email:                    "john@smith.com",
                        password:                 "password",
                        password_confirmation:    "password")

50.times do
    prng = Random.new
    title = Faker::Lorem.words(1..10).join(" ")
    body = Faker::Lorem.paragraphs(prng.rand(1..100)).join("\n")
    test_user.posts.create(title: title,
                      body: body)
  end

50.times do
  user_name = Faker::Name.first_name
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  user = User.create!(user_name:              user_name, 
                     name:                   name, 
                     email:                  email, 
                     password:               password, 
                     password_confirmation:  password)
  50.times do
    prng = Random.new
    title = Faker::Lorem.words.join(" ")
    body = Faker::Lorem.paragraphs(prng.rand(1..200)).join("\n")
    user.posts.create(title: title,
                      body: body)
  end
end