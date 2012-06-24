module DeviseHelper

  def devise_error_messages!
    return "" if resource.errors.nil?
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)
    sentence = "Uh oh!"
    html = <<-HTML
    <div class="alert alert-error">
      <a class="close" data-dismiss="alert" href="#">&times;</a>
      <h4 class="alert-heading">#{sentence}</h4>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
    
end
