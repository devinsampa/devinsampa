# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def attendee_class_select
     class_selected("attendees", "index") || class_selected("attendees", "new") || class_selected("attendees", "create") || class_selected("attendees", "show")
  end
end
