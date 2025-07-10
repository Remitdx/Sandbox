module Cards
  class ProjectProCardComponent < ViewComponent::Base
    def initialize(project: {})
      @title = project[:title] || "Title?"
      @classes = project[:classes]
      @description = project[:description] || "missing decription"
      @testimonials = project[:testimonials] || []
      @period = project[:period] || "Date?"
      @link = project[:link] || ""
    end
  end
end
