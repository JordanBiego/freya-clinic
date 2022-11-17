class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[ show edit update ]

  # GET /municipes or /municipes.json
  def index
    @municipes = Municipe.all
  end

  # GET /municipes/1 or /municipes/1.json
  def show
  end

  # GET /municipes/new
  def new
    @municipe = Municipe.new
    @municipe.build_adress
  end

  # GET /municipes/1/edit
  def edit
  end

  # POST /municipes or /municipes.json
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

  # PATCH/PUT /municipes/1 or /municipes/1.json
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

  # DELETE /municipes/1 or /municipes/1.json
  def destroy
    @municipe.destroy

    respond_to do |format|
      format.html { redirect_to municipes_url, notice: "Municipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipe
      @municipe = Municipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
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
