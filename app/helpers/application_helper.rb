module ApplicationHelper

  def welcome_message(user)
    welcome = t('activerecord.welcome')
    "#{welcome} #{tag.b user.email}!".html_safe
  end

  def select_language
    if I18n.locale == I18n.default_locale 
      link_to "English", { lang: 'en' }, class: :btn
    else 
      link_to "Русский", { lang: 'ru' }, class: :btn
    end
  end

end
