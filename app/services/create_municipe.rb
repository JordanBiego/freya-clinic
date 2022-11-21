class CreateMunicipe
  attr_reader :municipe

  def initialize(params:, municipe: Municipe)
    @params   = params
    @municipe = municipe
  end

  def submit
    @municipe = @municipe.new(@params)
    return false unless @municipe.valid?
    @municipe.active!

    if @municipe.save
      send_mail
    end

    true
  end

  def send_mail(mailer: MunicipeMailer)
    mailer.registered(@municipe).deliver_later
  end
end
