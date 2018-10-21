module ApplicationHelper
  def sortable(column = 'name', title = nil)
    title ||= column.titleize
    # direction = (column == params[:sort] && params[:direction] == 'asc') ? 'desc' : 'asc'
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == 'asc') ? 'desc' : 'asc'
    # link_to title, sort: column, direction: direction
    link_to title, { sort: column, direction: direction }, { class: "dropdown-item #{css_class}"  }
  end
end
