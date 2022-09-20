# This class is a main helper application
module ApplicationHelper
  def alert(type, message)
    if type == 'error'
      _class = 'alert alert-dismissible alert-danger'
    else
      _class ='alert alert-dismissible alert-sucess'
    end

    content_tag(:div,
                (message + button_tag('',
                                      type: 'button',
                                      class: 'btn-close',
                                      data: {
                                        'bs-dismiss':'alert',
                                        'aria-label':'Close'
                                      })
                ).html_safe,
                class: _class, role:'alert'
    )
  end
end
