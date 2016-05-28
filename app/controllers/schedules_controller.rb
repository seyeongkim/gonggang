class SchedulesController < ApplicationController
  before_action :require_login
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
    @users = User.all
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new

     
  end
  
  def test
    p = Schedule.new(mon[0]=params[:mon], tue[0]=params[:tue], wed[0]=params[:wed], thu[0]=params[:thu], fri[0]=params[:fri], sat[0]=params[:sat], sun[0]=params[:sun], user:current_user)
    p.save
    
    redirect_to "/schedules/test2"
  end
  
  def test2
    @schedule = Schedule.all
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new
    @schedule.mon[0] = params[:mon]
    @schedule.tue[0] = params[:tue]
    @schedule.wed[0] = params[:wed]
    @schedule.thu[0] = params[:thu]
    @schedule.fri[0] = params[:fri]
    @schedule.sat[0] = params[:sat]
    @schedule.sun[0] = params[:sun]
    
    @schedule.user_id = current_user.id

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:user_id, :mon, :tue, :wed, :thu, :fri, :sat, :sun)
    end
end
