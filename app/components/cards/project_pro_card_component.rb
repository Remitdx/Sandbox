module Cards
  class ProjectProCardComponent < ViewComponent::Base
    def initialize(project: {})
      @title = project["title"]
      @classes = project["classes"]
      @description = project["description"]
      @testimonials = project["testimonials"]
      @period = project["period"]
      @link = project["link"]
    end
  end
end
