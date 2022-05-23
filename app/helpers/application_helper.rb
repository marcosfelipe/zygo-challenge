module ApplicationHelper
  def input_errors_for(form, field_name)
    return if form.object.errors[field_name].blank?
    content_tag(:span, class: 'helper-text red-text') do
      form.object.errors[field_name].join(',')
    end
  end
  
  def input_text(form, field_name)
    content_tag(:div, class: 'input-field') do
      concat form.text_field(field_name)
      concat form.label(field_name.capitalize, for: "#{form.object.class.to_s.downcase}_field_name")
      concat input_errors_for(form, field_name)
    end
  end
end
