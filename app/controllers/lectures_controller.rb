class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :update, :destroy]

  # GET /lectures
  def index
    @lectures = Lecture.all

    render json: @lectures
  end

  # GET /lectures/1
  def show
    render json: @lecture
  end

  # POST /lectures
  def create
    @lecture = Lecture.new(lecture_params)

    if @lecture.save
      render json: @lecture, status: :created, location: @lecture
    else
      render json: @lecture.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lectures/1
  def update
    if @lecture.update(lecture_params)
      render json: @lecture
    else
      render json: @lecture.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lectures/1
  def destroy
    @lecture.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lecture_params
      params.require(:lecture).permit(:description, :duration, :conference_id, :track_id)
    end
end
