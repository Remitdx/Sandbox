module Navigations
  class TableOfContentComponent < ViewComponent::Base
    def initialize(page:, url:, sections:)
      @language = handle_language(url)
      @page = page
      @sections = sections
    end

    def handle_language(url)
      url.match("fr") ? "/fr" : ""
    end

    def constructed_path(language, page, anchor)
      url_for("#{language}/#{page}##{anchor.downcase}")
    end
  end
end
