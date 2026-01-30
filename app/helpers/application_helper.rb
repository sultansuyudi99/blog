module ApplicationHelper
  def full_title(title = "")
    base_title = "Ruby on Rails Blog"
    if title.blank?
      base_title
    else
      "#{title} | #{base_title}"
    end
  end

  def flash_class_for(message_type)
    case message_type.to_sym
    when :notice, :success
      "bg-green-200 text-green-800"
    when :alert, :danger, :error
      "bg-red-200 text-red-800"
    when :warning
      "bg-yellow-200 text-yellow-800"
    when :info
      "bg-blue-200 text-blue-800"
    else
      "bg-gray-200 text-gray-800"
    end
  end
end
