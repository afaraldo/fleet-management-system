# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  navigation.selected_class = 'active'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'simple-navigation-active-leaf'

  # Specify if item keys are added to navigation items as id. Defaults to true
  # navigation.autogenerate_item_ids = true

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that
  # will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name, item| tag.span(name) }

  # Specify if the auto highlight feature is turned on (globally, for the whole navigation). Defaults to true
  # navigation.auto_highlight = true

  # Specifies whether auto highlight should ignore query params and/or anchors when
  # comparing the navigation items with the current root_path. Defaults to true
  # navigation.ignore_query_params_on_auto_highlight = true
  # navigation.ignore_anchors_on_auto_highlight = true

  # If this option is set to true, all item names will be considered as safe (passed through html_safe).
  # Defaults to false.
  # navigation.consider_item_names_as_safe = false}

  # Define the primary navigation
  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # root_path - the address that the generated item links to. You can also use root_path_helpers
    # (named routes, restful routes helper, root_path_for etc.)
    # {} - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special {} that can be set:
    #           :html - Specifies html attributes that will be included in the rendered navigation item
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>if: -> { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>unless: -> { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>.
    #
    primary.dom_class = 'menu-inner py-1 ps ps--active-y'
    primary.item  :key1,
                  content_tag(:i, nil, class: 'menu-icon tf-icons bx bx-home-circle') +
                  content_tag(:div, I18n.t('navbar.dashboard'), class: nil),
                  main_app.root_path,
                  html: { class: 'menu-item' },
                  link_html: { class: 'menu-link' }

    primary.item  :key2,
                  content_tag(:i, nil, class: 'menu-icon tf-icons bx bx-id-card') +
                  content_tag(:div, I18n.t('navbar.employee'), class: nil),
                  main_app.employees_path(session['employees']),
                  html: { class: 'menu-item' },
                  link_html: { class: 'menu-link' },
                  highlights_on: %r{/employees},
                  if: proc { can? :read, Employee }

    primary.item  :key3,
                  content_tag(:i, nil, class: 'menu-icon tf-icons bx bx-file') +
                  content_tag(:div, I18n.t('navbar.work_order'), class: nil),
                  main_app.work_orders_path(session['work_orders']),
                  html: { class: 'menu-item' },
                  link_html: { class: 'menu-link' },
                  highlights_on: %r{/work_orders},
                  if: proc { can? :read, WorkOrder }

    primary.item  :key4,
                  content_tag(:i, nil, class: 'menu-icon tf-icons bx bx-car') +
                  content_tag(:div, I18n.t('navbar.car'), class: nil),
                  main_app.cars_path(session['cars']),
                  html: { class: 'menu-item' },
                  link_html: { class: 'menu-link' },
                  highlights_on: %r{/cars},
                  if: proc { can? :read, Car }

    primary.item  :key5,
                  content_tag(:i, nil, class: 'menu-icon tf-icons bx bxs-car-garage') +
                  content_tag(:div, I18n.t('navbar.supplier'), class: nil),
                  main_app.suppliers_path(session['suppliers']),
                  html: { class: 'menu-item' },
                  link_html: { class: 'menu-link' },
                  highlights_on: %r{/suppliers},
                  if: proc { can? :read, Supplier }

    primary.item  :key6,
                  content_tag(:i, nil, class: 'menu-icon tf-icons bx bxs-car-mechanic') +
                  content_tag(:div, I18n.t('navbar.maintenance'), class: nil),
                  main_app.maintenances_path(session['maintenances']),
                  html: { class: 'menu-item' },
                  link_html: { class: 'menu-link' },
                  highlights_on: %r{/maintenances},
                  if: proc { can? :read, Maintenance }

    primary.item  :key7,
                  content_tag(:i, nil, class: 'menu-icon tf-icons bx bx-wrench') +
                  content_tag(:div, I18n.t('navbar.repair'), class: nil),
                  main_app.repairs_path(session['repairs']),
                  html: { class: 'menu-item' },
                  link_html: { class: 'menu-link' },
                  highlights_on: %r{/repairs},
                  if: proc { can? :read, Repair }

    primary.item  :key8,
                  content_tag(:i, nil, class: 'menu-icon tf-icons bx bxs-car-crash') +
                  content_tag(:div, I18n.t('navbar.insurance_plan'), class: nil),
                  main_app.insurance_plans_path(session['insurance_plans']),
                  html: { class: 'menu-item' },
                  link_html: { class: 'menu-link' },
                  highlights_on: %r{/insurance_plans},
                  if: proc { can? :read, InsurancePlan }

    primary.item  :key9,
                  content_tag(:i, nil, class: 'menu-icon tf-icons bx bx-user') +
                  content_tag(:div, I18n.t('navbar.user'), class: nil),
                  main_app.users_path(session['users']),
                  html: { class: 'menu-item' },
                  link_html: { class: 'menu-link' },
                  highlights_on: %r{/users},
                  if: proc { can? :read, User }

    primary.item :reports,
                 content_tag(:i, nil, class: 'menu-icon tf-icons bx bx-cog me-2') +
                 content_tag(:div, I18n.t('navbar.report'), class: nil),
                 blazer.root_path,
                 html: { class: 'menu-item' },
                 link_html: { class: 'menu-link', data: { turbo: false } },
                 highlights_on: %r{/reports},
                 if: proc { can? :view_report, WorkOrder }

    primary.item :settings,
                 content_tag(:i, nil, class: 'menu-icon tf-icons bx bx-cog me-2') +
                 content_tag(:div, I18n.t('settings'), class: nil),
                 main_app.system_settings_path(session['settings']),
                 html: { class: 'menu-item' },
                 link_html: { class: 'menu-link' },
                 if: proc { can? :read, SystemSettings }

    # Add an item which has a sub navigation (same params, but with block)
    # primary.item :key_2, 'name', root_path, {} do |sub_nav|
    #  # Add an item to the sub navigation (same params again)
    #  sub_nav.item :key_2_1, 'name', root_path, {}
    # end

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the {}. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.
    # primary.item :key_3, 'Admin', root_path, html: { class: 'special' }, if: -> { current_user.admin? }
    # primary.item :key_4, 'Account', root_path, unless: -> { logged_in? }

    # you can also specify html attributes to attach to this particular level
    # works for all levels of the menu
    # primary.dom_attributes = {id: 'menu-id', class: 'menu-class'}

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false
  end
end
