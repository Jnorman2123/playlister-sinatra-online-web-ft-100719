module Slugifiable
  module InstanceMethods
    def slug
      slug = self.name.downcase.gsub(" ", "-")
      slug.gsub(/[(,),.]/, "")
    end

  end
end
