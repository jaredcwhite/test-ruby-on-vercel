class TagsBuilder < SiteBuilder
  def build
    liquid_tag "vercel", :vercel
  end

  def vercel(attributes, tag)
    "This is the #{attributes} Vercel Way!"
  end
end
