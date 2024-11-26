# app/controllers/calls_controller.rb
class CallsController < ApplicationController
  before_action :set_call, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :authorize_user, only: %i[show edit update destroy]

  # GET /calls or /calls.json
  def index
    @calls = current_user.calls
  end

  # GET /calls/1 or /calls/1.json
  def show
  end

  # GET /calls/new
  def new
    @call = current_user.calls.build
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls or /calls.json
  def create
    @call = current_user.calls.build(call_params)

    respond_to do |format|
      if @call.save
        format.html { redirect_to @call, notice: 'Chamado criado com sucesso.' }
        format.json { render :show, status: :created, location: @call }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1 or /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to @call, notice: 'Chamado atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @call }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1 or /calls/1.json
  def destroy
    @call.destroy

    respond_to do |format|
      format.html { redirect_to calls_url, notice: 'Chamado excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Ensure the current user is authorized to access or modify the call
    def authorize_user
      redirect_to calls_url, alert: 'Você não tem permissão para acessar este chamado.' unless @call.user == current_user
    end

    # Only allow a list of trusted parameters through.
    def call_params
      params.require(:call).permit(:title, :description, :price)
    end
end
