# app/controllers/services_controller.rb
class ServicesController < ApplicationController
  before_action :set_service, only: %i[show edit update destroy]
  before_action :set_calls, only: %i[new create edit update]
  before_action :authenticate_user!

  def index
    @services = Service.all
  end
  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
    # @service already set by before_action
  end

  # POST /services or /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: "Service was successfully created." }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1 or /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: "Service was successfully updated." }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1 or /services/1.json
  def destroy
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url, notice: "Serviço excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  def gerar_ordem_servico
    @services = Service.all
    html = render_to_string(template: 'services/index', layout: false, formats: [:html])
    kit = PDFKit.new(html)
    kit.stylesheets << Rails.root.join('app', 'assets', 'stylesheets', 'application.css')
    kit.stylesheets << Rails.root.join('app', 'assets', 'stylesheets', 'application.tailwind.css')
    data = kit.to_pdf
    filename = "nome.pdf" 
    send_data(data, filename: filename, type: 'application/pdf', disposition: 'inline')
  end

  def kanban
    @services = Service.all
  end

  def atualizar_status
    begin
      service = Service.find(params[:id])
      status = Service.statuses[params[:status]]
      service.update(status: status)
      render json: { service: service, call: service.call }, status: :ok
    rescue 
      render json: { error: 'Erro ao atualizar o status' }, status: :unprocessable_entity
    end
  end

  private

    def set_service
      @service = Service.find(params[:id])
    end

    def set_calls
      @calls = Call.where(user_id: current_user.id)
    end

    def service_params
      params.require(:service).permit(:call_id, :status, :custo)
    end
end
