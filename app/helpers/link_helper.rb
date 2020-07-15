module LinkHelper
  def link_item(text, url, css_class = nil)
    link_to(text, url, css_class) if link_item_visible?(url)
  end

  private

  def link_item_visible?(url)
    return true if current_user.god? or current_user.admin?
    parsed_params = Rails.application.routes.recognize_path(url)
    record = parsed_params[:controller].classify.constantize
    query = "#{parsed_params[:action]}"
    policy(record).send('general_policy', record, query)
  end
end
