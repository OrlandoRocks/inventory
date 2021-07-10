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
        if post_facturify_client @client
          format.html { redirect_to clients_path, notice: 'Cliente ha sido creado correctamente.' }
          format.json { render :show, status: :created, location: @client }
        else
          format.html { render :new }
          format.json { render json: @client.errors, status: :unprocessable_entity }
        end
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

  def post_facturify_client client
    token = Facturify.get_token

    data = {
        "razon_social": client.name + ' ' + client.last_name + ' '+client.maiden_name,
        "rfc": client.rfc,
        "email": client.email,
        "forma_de_pago": "99" ,
        "uso_cfdi": "P01"
    }.to_json

    uri = URI.parse("https://api-sandbox.facturify.com/api/v1/cliente")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request["Authorization"] = "Bearer #{token}"
    request["Cache-Control"] = "no-cache"
    request.body = data

    req_options = {
        use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end


    response = JSON.parse(response.body)

    p response
    p response['data']
    p response['data']['uuid']

    if client.update(facturify_id: response['data']['uuid'])
      request = true
    else

      request = false
    end

    return request


  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def client_params
    params.require(:client).permit(:name, :last_name, :maiden_name, :address, :postal_code, :email, :phone_number,
                                   :cellphone, :contact, :rfc, :suburb, :state_id, :city_id, :company)
  end
end
