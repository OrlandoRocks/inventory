class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = policy_scope(Client)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    audits = @client.audits + @client.associated_audits
    @audits = audits.sort_by { |a| a.created_at }

  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_path, notice: 'Cliente ha sido creado correctamente.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to clients_path, notice: 'Client ha sido actualizdo correctamente.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    respond_to do |format|
      if @client.destroy
        format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
        format.json { render json: true }
      else
        format.json { render json: false }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def client_params
    params.require(:client).permit(:name, :last_name, :maiden_name, :address, :postal_code, :email, :phone_number,
                                   :cellphone, :contact, :rfc, :suburb, :state_id, :city_id)
  end
end
