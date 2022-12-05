# This helper contains function for users views
module UserHelper
  def add_role(option_selected)
    content_tag(:span,
                t("enums.user.role.#{option_selected}"),
                class: 'badge bg-label bg-primary')
  end
end
