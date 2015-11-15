module ApplicationHelper
  def gravatar_for(pastor, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(pastor.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: pastor.pastorname, class: "gravatar")
  end
  
  def get_gravimage(pastor, options = { size: 80 }) 
       
       hexemail = Digest::MD5::hexdigest(pastor.email.downcase);
       size = options[:size]
       
       img_url = "http://secure.gravatar.com/avatar/#{hexemail}?s=#{size}"
       
       image_tag(img_url, alt: pastor.pastorname, class: 'avimg')
  end
    
  
end
