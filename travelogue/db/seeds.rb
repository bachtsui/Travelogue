User.create ({
  email: "bagel@isangieri.com",
  password_digest: "yoyoyo",
  first_name: "Bagel",
  last_name: "Angieri",
  current_city: "Emeryville",
  profile_photo: "https://upload.wikimedia.org/wikipedia/commons/1/1d/Bagel-Plain-Alt.jpg"
})

20.times do
	
	user_params = Hash.new
	user_params[:email] = FFaker::Internet.email
	user_params[:password]	= "123456"
	user_params[:first_name] = FFaker::Name.first_name
	user_params[:last_name] = FFaker::Name.last_name
	user_params[:current_city] = FFaker::Address.city
	user_params[:profile_photo] = FFaker::Avatar.image

	new_user = User.create(user_params)

end