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
  
  def input_file(form, field_name)
    render('layouts/form/input_file', form: form, field_name: field_name)
  end
  
  def paginate_links(collection, options = {})
    will_paginate(collection, options.merge(renderer: will_pagination_renderer))
  end
  
  def will_pagination_renderer
    Class.new(WillPaginate::ActionView::LinkRenderer) do
      def container_attributes
        {class: "pagination"}
      end

      def page_number(page)
        if page == current_page
          tag(:li, tag(:a, page, href: '#!'), class: 'active teal')
        else
          tag(:li, link(page, page, rel: rel_value(page)), class: 'waves-effect') 
        end
      end

      def gap
        text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
        %(<span class="mr2">#{text}</span>)
      end

      def previous_page
        num = @collection.current_page > 1 && @collection.current_page - 1
        previous_or_next_page(num, '<', '')
      end

      def next_page
        num = @collection.current_page < total_pages && @collection.current_page + 1
        previous_or_next_page(num, '>', '')
      end

      def previous_or_next_page(page, text, classname)
        if page
          tag(:li, link(text, page, :class => classname))
        else
          tag(:li, tag(:a, text, href: '#!'), :class => classname)
        end
      end
    end
  end
end
