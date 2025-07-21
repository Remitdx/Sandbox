module Analytics
  extend ActiveSupport::Concern

  included do
    before_action :increment_visit_counter
  end

  class_methods do
    def skip_analytics(**options)
      skip_before_action :increment_visit_counter, **options
    end
  end

  private

  def increment_visit_counter
    page_identifier = "#{controller_name}_#{action_name}"
    return nil if handle_session(page_identifier).nil?
    current_analytic = last_or_new_analytics
    increment(current_analytic, page_identifier)
  end

  def handle_session(page_identifier)
    return true if controller_name === "errors" # can count multiple errors in same session
    return nil if session["visited_#{page_identifier}"]
    session["visited_#{page_identifier}"] = true
  end

  def last_or_new_analytics
    analytics_this_month? ? Analytic.last : Analytic.create()
  end

  def analytics_this_month?
    return false if Analytic.count == 0
    Analytic.last.created_at.month == Time.current.month
  end

  def increment(analytic, identifier)
    analytic.increment!(identifier.to_sym)
  end
end
