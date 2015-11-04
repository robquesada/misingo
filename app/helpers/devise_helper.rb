module DeviseHelper
  def devise_error_messages!
    flash_alerts = []
    error_key = 'errors.messages.not_saved'

    insert_founded_error_on_flash(error_key, flash_alerts)

    return "" if clean_of_errors?(flash_alerts)
    errors = founded_errors_in(flash_alerts)

    list_items = build_list_items_with(errors)

    build_errors_message_with(list_items)
  end

  def insert_founded_error_on_flash(error_key, flash_alerts)
    if !flash.empty?
      flash_alerts.push(flash[:error])  if flash[:error]
      flash_alerts.push(flash[:alert])  if flash[:alert]
      flash_alerts.push(flash[:notice]) if flash[:notice]
      error_key = 'devise.failure.invalid'
    end
  end

  def clean_of_errors?(flash_alerts)
    resource.errors.empty? && flash_alerts.empty?
  end

  def founded_errors_in(flash_alerts)
    resource.errors.empty? ? flash_alerts : resource.errors.messages.values.flatten
  end

  def build_list_items_with(errors)
    errors.map { |msg| "#{content_tag(:i, nil, class: 'fa fa-times')} #{msg.capitalize} #{tag("br")}".to_s }.join
  end

  def build_errors_message_with(list_items)
    html = <<-HTML
      <fieldset>
        <div class="field account-sign-in">
          <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-times"></i></button>
            <strong>¡Oh!</strong> Ocurrió un error, revisá estos detalles:<br/>
            #{list_items}
          </div>
        </div>
      </fieldset>
    HTML

    html.html_safe
  end
end
