class ApplicationMailer < ActionMailer::Base

  default from: "info@planetagrotrailer.com"
  layout 'mailer'

  def item_sold item
    @item = Item.find(item)
    user_admin = User.where(role_id: Role.where(key: 'admin_sucursal').first.id).first
    mail(to: user_admin.email, subject: ' Trailer vendido')
    #mail(to: 'victormponcem@gmail.com', subject: ' Información de prestamos SPAUACH')
  end

  def bill_to_client client, item

    @item = item


    mail to: client.email, subject: "Factura"
  end
end
