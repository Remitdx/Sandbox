module Navigations
  class TableOfContentComponent < ViewComponent::Base
    def initialize(page:, sections:)
      @page = page
      @sections = sections
    end

    def constructed_path(page, anchor)
      url_for("/#{page}##{t("uikit.#{anchor}").downcase}")
    end
  end
end
