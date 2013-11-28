class UsersDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: User.count,
      iTotalDisplayRecords: users.total_count,
      aaData: data
    }
  end

private

  def data
    users.each_with_index.map do |user, i|
      [
        link_to(user.fio, user),
        h(user.register_number_with_region),
        h(user.created_at.try { |s| s.strftime("%d.%m.%Y") }),
        h(user.end_access.try { |s| s.strftime("%d.%m.%Y") }),
        h(user.request_limit)
      ]
    end
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    users = User.where("lastname <> '' and encrypted_password <> ''").order("#{sort_column} #{sort_direction}")
    users = users.page(page).per(per_page)
    if params[:sSearch].present?
      users = users.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    users
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[lastname register_number start_access end_access request_limit]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end