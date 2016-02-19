module ApplicationHelper
  def gravater_for(user, options = {size: val})
    
    size = options[:size]
    gravater_id = Digest::MD5::hexdigest(user.email.downcase)
    gravater_url = "https://secure.gravatar.com/avatar/#{gravater_id}?s=#{size}"
    image_tag(gravater_url, alt: user.username, class: "img-circle")
    
  end
end
