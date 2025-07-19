module Cards
  class ProjectProCardComponent < ViewComponent::Base
    def initialize(project: { title: "Title?", classes: "", description: "missing decription", testimonials: [], period: "Date?", link: "" })
      @title = project["title"] || project[:title]
      @classes = project["classes"] || project[:classes]
      @description = project["description"] || project[:description]
      @testimonials = project["testimonials"] || project[:testimonials]
      @period = project["period"] || project[:period]
      @link = project["link"] || project[:link]
    end
  end
end
