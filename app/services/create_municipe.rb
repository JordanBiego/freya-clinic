class CreateMunicipe
  attr_reader :municipe

  def initialize(params:, municipe: Municipe)
    @params   = params
    @municipe = municipe
  end

  def submit
    @municipe = @municipe.new(@params)
    @municipe.active!
    return false unless @municipe.valid?

    if @municipe.save
      send_mail
    end

    true
  end

  def send_mail(mailer: MunicipeMailer)
    mailer.registered(@municipe).deliver_later
  end
end
