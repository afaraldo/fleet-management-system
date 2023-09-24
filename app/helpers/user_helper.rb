# This helper contains function for users views
module UserHelper
  def show_role_label(option_selected)
    color = if option_selected == 'secretary'
              'bg-primary'
            elsif option_selected == 'admin'
              'bg-warning'
            else
              'bg-info'
            end
    content_tag(:span,
                t("enums.user.role.#{option_selected}"),
                class: "badge bg-label #{color}")
  end
end
