class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :update, :destroy]

  # GET /conferences
  def index
    @conferences = Conference.all

    render json: @conferences
  end

  # GET /conferences/1
  def show
    render json: @conference
  end

  # POST /conferences
  def create
    @conference = Conference.new(conference_params)

    if @conference.save
      render json: @conference, status: :created, location: @conference
    else
      render json: @conference.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /conferences/1
  def update
    if @conference.update(conference_params)
      render json: @conference
    else
      render json: @conference.errors, status: :unprocessable_entity
    end
  end

  # DELETE /conferences/1
  def destroy
    id_deleted = params[:id]

    if @conference.destroy
      render json: { message: "Conference was successfully destroyed (id: #{id_deleted}).", status: :ok }
    else
      render json: @conference.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conference
      @conference = Conference.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conference_params
      params.require(:conference).permit(:description)
    end
end
