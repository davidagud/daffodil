class WeddingMailer < ApplicationMailer

  def wedding_email
    @wedding = Wedding.find(params[:wedding].id)

    xlsx = render layout: false, handlers: [:axlsx], formats: [:xlsx], template: "weddings/export", locals: { :wedding => @wedding }
    attachments[@wedding.wedding_name + '.xlsx'] = {mime_type: Mime[:xlsx], content: xlsx}
    mail(to: 'daffodilparkerbackup@gmail.com', subject: @wedding.wedding_name)
  end

end
