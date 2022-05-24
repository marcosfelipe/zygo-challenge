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
      concat form.label(field_name.capitalize, for: "#{form.object.class.to_s.downcase}_#{field_name}")
      concat input_errors_for(form, field_name)
    end
  end
  
  def input_password(form, field_name)
    content_tag(:div, class: 'input-field') do
      concat form.password_field(field_name)
      concat form.label(field_name.capitalize, for: "#{form.object.class.to_s.downcase}_#{field_name}")
      concat input_errors_for(form, field_name)
    end
  end
  
  def input_file(form, field_name)
    render('layouts/form/input_file', form: form, field_name: field_name)
  end
  
  def paginate_links(collection, options = {})
    will_paginate(collection, options.merge(renderer: paginate_custom_renderer))
  end
end
