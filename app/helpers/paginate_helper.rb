module PaginateHelper
  def paginate_custom_renderer
    Class.new(::WillPaginate::ActionView::LinkRenderer) do
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