module Searchable
  extend ActiveSupport::Concern
  
  class_methods do
    def search(keyword)
      where("#{searchable_attrs.join('||')} like ?", "%#{sanitize_sql_like(keyword.to_s)}%")
    end
    
    def searchable_attrs
      columns_hash.map{ |attr, column| [attr, column.sql_type_metadata.type] }
                  .select { |_column, type| type == :string }
                  .map { |column, _type| column }
    end
  end
end
