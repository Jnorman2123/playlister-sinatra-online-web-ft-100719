module Slugifiable
  module InstanceMethods
    def slug
      binding.pry
      slug = self.name.downcase.gsub(" ", "-")
      slug.gsub(/[(,),.]/, "")
    end

  end
end
