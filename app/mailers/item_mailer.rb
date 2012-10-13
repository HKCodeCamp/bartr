class ItemMailer < ActionMailer::Base
  default from: "no-reply@igpsd.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.item_mailer.interested.subject
  #
  def interested(item, buyer)
    @item = item
    @buyer = buyer
    @greeting = "Hi"
    @name = item.owner.name

    mail to: item.owner.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.item_mailer.reserved.subject
  #
  def reserved(item, buyer)
    @item = item
    @buyer = buyer
    @greeting = "Hi"
    @name = item.owner.name

    mail to: @buyer.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.item_mailer.sold.subject
  #
  def sold
    @item = item
    @buyer = buyer
    @greeting = "Hi"
    @name = item.owner.name

    mail to: @buyer.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.item_mailer.item_pm.subject
  #
  def item_pm(item_pm)
    @item_pm = item_pm

    mail to: @item_pm.item.owner.email
  end
end
