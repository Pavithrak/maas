class MockServersController < ApplicationController
  before_action :set_mock_server, only: [:show, :edit, :update, :destroy]

  # GET /mock_servers
  # GET /mock_servers.json
  def index
    @mock_servers = MockServer.all
  end

  # GET /mock_servers/1
  # GET /mock_servers/1.json
  def show

  end

  # GET /mock_servers/new
  def new
    @mock_server = MockServer.new
  end

  # GET /mock_servers/1/edit
  def edit
  end

  # POST /mock_servers
  # POST /mock_servers.json
  def create
    @mock_server = MockServer.new(mock_server_params)

    respond_to do |format|
      if @mock_server.save
        format.html { redirect_to @mock_server, notice: 'Mock server was successfully created.' }
        format.json { render :show, status: :created, location: @mock_server }
      else
        format.html { render :new }
        format.json { render json: @mock_server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mock_servers/1
  # PATCH/PUT /mock_servers/1.json
  def update
    respond_to do |format|
      if @mock_server.update(mock_server_params)
        format.html { redirect_to @mock_server, notice: 'Mock server was successfully updated.' }
        format.json { render :show, status: :ok, location: @mock_server }
      else
        format.html { render :edit }
        format.json { render json: @mock_server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mock_servers/1
  # DELETE /mock_servers/1.json
  def destroy
    @mock_server.destroy
    respond_to do |format|
      format.html { redirect_to mock_servers_url, notice: 'Mock server was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mock_server
      @mock_server = MockServer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mock_server_params
      params.require(:mock_server).permit(:name)
    end
end
