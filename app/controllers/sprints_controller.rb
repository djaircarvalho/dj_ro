class SprintsController < ApplicationController
  before_action :set_sprint, only: [:show, :edit, :update, :destroy]

  # GET /sprints
  # GET /sprints.json
  def index
    @sprints = current_user.projects.find(params[:project_id]).sprints
    authorize Sprint
  end

  # GET /sprints/1
  # GET /sprints/1.json
  def show
    authorize @sprint
  end

  # GET /sprints/new
  def new
    set_project()
    @sprint = @project.sprints.new
    authorize @sprint
  end

  # GET /sprints/1/edit
  def edit
    authorize @sprint
    set_project()
  end

  # POST /sprints
  # POST /sprints.json
  def create
    set_project()
    @sprint = Sprint.new(sprint_params)
    authorize @sprint, :new?
    respond_to do |format|
      if @sprint.save
        format.html { redirect_to [@sprint.project, @sprint], notice: 'Sprint was successfully created.' }
        format.json { render :show, status: :created, location: @sprint }
      else
        format.html { render :new }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sprints/1
  # PATCH/PUT /sprints/1.json
  def update
    authorize @sprint, :edit?
    respond_to do |format|
      if @sprint.update(sprint_params)
        format.html { redirect_to [@sprint.project, @sprint], notice: 'Sprint was successfully updated.' }
        format.json { render :show, status: :ok, location: @sprint }
      else
        format.html { render :edit }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy
    authorize @sprint
    @sprint.destroy
    respond_to do |format|
      format.html { redirect_to @sprint.project, notice: 'Sprint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint
      @sprint = Sprint.find(params[:id])
    end
    def set_project
      @project = Project.find(params[:project_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def sprint_params
      params.require(:sprint).permit(:name, :opening_date, :closing_date, :project_id, :value)
    end
end
