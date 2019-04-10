# frozen_string_literal: true

module ListItemsHelper
  def list_item_row_class(list_item)
    if list_item.read
      'table-success'
    elsif (Date.today - list_item.created_at.to_date) > ListItem::VERY_OLD_DAYS
      'table-danger'
    elsif (Date.today - list_item.created_at.to_date) > ListItem::OLD_DAYS
      'table-warning'
    else
      'table-none'
    end
  end
end
