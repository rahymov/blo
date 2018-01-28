module ApplicationHelper
	def avatar_url(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}.png"
		image_tag(gravatar_url, alt: user.username, class: "img-circle" )
	end
end
