class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[ show edit update ]

  def index
    @municipes = Municipe.all
  end

  def show; end

  def new
    @municipe = Municipe.new
    @municipe.build_adress
  end

  def edit; end

  def create
    creator = CreateMunicipe.new(params: municipe_params)
    @municipe.active!
    
    respond_to do |format|
      if creator.submit
        format.html { redirect_to municipes_url, notice: 'Munícipe criado com sucesso' }
      else
        @municipe = creator.municipe
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    updater = UpdateMunicipe.new(params: municipe_params, municipe: @municipe)

    respond_to do |format|
      if updater.submit
        format.html { redirect_to municipe_url(@municipe), notice: 'Munícipe atualizado com sucesso.' }
      else
        @municipe = updater.municipe
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def change_status
    swap = Municipe.find_by(id: params[:municipe_id])

    if swap.status == 'active'
      swap.inactive!
      respond_to do |format|
        format.html { redirect_to municipes_url, notice: 'Inativado com sucesso' }
      end
    else
      swap.active!
      respond_to do |format|
        format.html { redirect_to municipes_url, notice: 'Ativado com sucesso' }
      end 
    end
  end

  private
    def set_municipe
      @municipe = Municipe.find(params[:id])
    end

    def municipe_params
      params.require(:municipe).permit(:name,
                                       :cpf,
                                       :cns,
                                       :email,
                                       :birthdate,
                                       :phone,
                                       :status,
                                       :avatar,
                                       adress_attributes: %i[
                                         id postal_code street complement district city state ibge_code
                                        ]
                                      )
    end
end
