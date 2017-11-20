module ListItemsHelper
  def list_item_row_class(list_item)
    if list_item.read
      return 'table-success'
    elsif (Date.today - list_item.created_at.to_date) > ListItem::VERY_OLD_DAYS
      return 'table-danger'
    elsif (Date.today - list_item.created_at.to_date) > ListItem::OLD_DAYS
      return 'table-warning'
    else
      return 'table-none'
    end
  end
end
