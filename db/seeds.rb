User.destroy_all
Article.destroy_all
City.destroy_all

User.create ({
  email: "bagel@isangieri.com",
  password_digest: "yoyoyo",
  first_name: "Bagel",
  last_name: "Angieri",
  current_city: "Emeryville",
  profile_photo: "https://upload.wikimedia.org/wikipedia/commons/1/1d/Bagel-Plain-Alt.jpg"
})

City.create ({
	name: "San Francisco",
	photo: "/assets/sfshowpage.jpg"
})
City.create ({
	name: "London",
	photo: "/assets/london.jpg"
})
City.create ({
	name: "Gibraltar",
	photo: "/assets/gibraltar.jpg"
})

20.times do
	user_params = Hash.new
	user_params[:email] = FFaker::Internet.email
	user_params[:password]  = "123456"
	user_params[:first_name] = FFaker::Name.first_name
	user_params[:last_name] = FFaker::Name.last_name
	user_params[:current_city] = FFaker::Address.city
	user_params[:profile_photo] = FFaker::Avatar.image

	new_user = User.create(user_params)

	10.times do
		new_article = Article.new
		new_article.title = FFaker::HipsterIpsum.words(rand(1)+3).join(" ")
		new_article.content = FFaker::HipsterIpsum.paragraphs(1+ rand(4)).join("\n")
    new_article.city_id = City.first[:id]
		new_article.save
		new_user.articles.push new_article
	end
end