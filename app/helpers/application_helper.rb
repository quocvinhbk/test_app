module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    # direction = (column == params[:sort] && params[:direction] == 'asc') ? 'desc' : 'asc'
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == 'asc') ? 'desc' : 'asc'
    # link_to title, sort: column, direction: direction
    # link_to title, { sort: column, direction: direction }, { class: "dropdown-item #{css_class}" }
    # link_to title, params.merge(sort: column, direction: direction, page: nil).merge(only_path: true, script_name: nil), { class: css_class }

    # link_to title, params.permit(:sort, :direction, :page).merge(sort: column, direction: direction, page: nil), { class: css_class }
    # params.permit!
    link_to title, params.permit(:commit, :search, :utf8, :sort, :direction, :page).merge(sort: column, direction: direction, page: nil), { class: css_class }
  end
end
