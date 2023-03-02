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
    id_deleted = params[:id]

    if @lecture.destroy
      render json: { message: "Lecture was successfully destroyed (id: #{id_deleted}).", status: :ok }
    else
      render json: @lecture.errors, status: :unprocessable_entity
    end
  end

  # IMPORT lectures (text file)
  def import_lectures
    #if Conference.create(description: 'Conferece - Default Title')
    #  render json: { message_conference: "Criada nova conferência" }
    #else
    #  render json: { message_conference: "Erro ao criar uma conferência", status: :unprocessable_entity }
    #end

    # ler o arquivo txt e inserir as linhas em um array
    rows = []
    total_duration = 0
    File.open(params[:txt], 'r') do |pointer|
      while line = pointer.gets
        rows << line.to_s
      end
    end
    #
    if rows.blank?
      render json: { message_file: 'Empty file!' }, status: :unprocessable_entity
    else
      total_min = TotalMinutes.new(rows)
      total_duration = total_min.totalize
      #render json: { message: total_duration.to_s }, status: :ok

      # criando as trilhas
      inst_set_tracks = SetTracks.new(total_duration)
      qtd_tracks = inst_set_tracks.create_tracks(1) # numero mágico temporário id da conference

      if qtd_tracks > 0
        # for para vincular as tracks nas palestras
        render json: { message_tracks: "Trilhas criadas com sucesso!" }
      end
    end

    # 1a palestra:
    # 9hs  as 12hs = 3hs ==> 180
    # 14hs as 17hs = 3hs ==> 180
    # total 360

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
