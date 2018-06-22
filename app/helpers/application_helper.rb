module ApplicationHelper

  def welcome_message(user)
    welcome = t('activerecord.welcome')
    "#{welcome} #{tag.b user.first_name} #{tag.b user.last_name}!".html_safe
  end

end
