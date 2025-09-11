class EmpresasController < ApplicationController
  before_action :set_empresa, only: %i[ show edit update destroy ]

  # GET /empresas or /empresas.json
  def index
    @q = Empresa.ransack(params[:q])
    @pagy, @empresas = pagy(@q.result(distinct: true))

  end

  # GET /empresas/1 or /empresas/1.json
  def show
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas or /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to @empresa, notice: "Empresa was successfully created." }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresas/1 or /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to @empresa, notice: "Empresa was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1 or /empresas/1.json
  def destroy
    @empresa.destroy!

    respond_to do |format|
      format.html { redirect_to empresas_path, notice: "Empresa was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empresa_params
      params.require(:empresa).permit(:cnpj, :tipo, :nome, :porte)
    end
def consulta_cnpj
  cnpj = params[:cnpj]
  @dados = CnpjService.consultar(cnpj)

  respond_to do |format|
    format.json { render json: @dados }
    format.html
  end
end
end
