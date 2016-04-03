test_user = User.create!(user_name:               "sample",
                        name:                     "Sample",
                        email:                    "sample@sample.com",
                        password:                 "password",
                        password_confirmation:    "password")

50.times do
    prng = Random.new
    title = Faker::Lorem.words(1..10).join(" ")
    body = Faker::Lorem.paragraphs(prng.rand(1..100)).join("\n")
    date_time = Faker::Time.between(14.days.ago, Time.now)
    post = test_user.posts.create(title: title,
                                   body: body,
                                   created_at: date_time,
                                   updated_at: date_time)
    prng.rand(0..10).times do
      post.comments.create!(user_id: test_user.id,
                            comment_text: Faker::Lorem.paragraph(3))
    end
  end

10.times do
  user_name = Faker::Name.first_name
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  user = User.create!(user_name:             user_name, 
                     name:                   name, 
                     email:                  email, 
                     password:               password, 
                     password_confirmation:  password)
  10.times do
    prng = Random.new
    title = Faker::Lorem.words.join(" ")
    body = Faker::Lorem.paragraphs(prng.rand(1..200)).join("\n")
    date_time = Faker::Time.between(14.days.ago, Time.now)
    post = user.posts.create(title: title,
                      body: body,
                      created_at: date_time,
                      updated_at: date_time)
    prng.rand(0..10).times do
    post.comments.create!(user_id: user.id,
                          comment_text: Faker::Lorem.paragraph)
    end
  end
end