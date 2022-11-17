class MunicipeMailer < ApplicationMailer
  default from: 'notifications@saude.com'

  def registered(params)
    @municipe = params
    subject = 'Você foi registrado- Sistema de Saúde'

    mail(to: @municipe.email, subject: subject)
  end

  def updated(params)
    @municipe = params
    subject = 'Seus dados foram atualizados- Sistema de Saúde'

    mail(to: @municipe.email, subject: subject)
  end
end
