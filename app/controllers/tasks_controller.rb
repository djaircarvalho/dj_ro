class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :start, :stop, :finish ]

  # GET /tasks
  # GET /tasks.json
  def index
    #@tasks = current_user.tasks.where(sprint_id: params[:sprint_id])
    @tasks = current_user.projects.find(params[:project_id]).sprints.find( params[:sprint_id]).tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    authorize @task
  end

  # GET /tasks/new
  def new
    set_project_and_sprint()
    @task = Task.new()
    @task.sprint = @sprint
    authorize @task
  end

  # GET /tasks/1/edit
  def edit
    authorize @task
    set_project_and_sprint()
  end

  # POST /tasks
  # POST /tasks.json
  def create
    set_project_and_sprint()
    @task = Task.new(task_params)
    authorize @task, :new?
    respond_to do |format|
      if @task.save
        format.html { redirect_to [@project,@sprint,@task], notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    authorize @task, :edit?
    set_project_and_sprint()
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to [@project,@sprint,@task], notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    authorize @task
    set_project_and_sprint()
    @task.destroy
    respond_to do |format|
      format.html { redirect_to [@project,@sprint], notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start
    set_project_and_sprint
    authorize @task
    @task.start(current_user)
    respond_to do |format|
      format.html { redirect_to [@project,@sprint,@task], notice: 'Task was successfully started.' }
      format.json { render :show, status: :ok, location: @task }
    end
  end

  def stop
    set_project_and_sprint
    authorize @task
    @task.stop
    respond_to do |format|
      format.html { redirect_to [@project,@sprint,@task], notice: 'Task was successfully stoped.' }
      format.json { render :show, status: :ok, location: @task }
    end
  end

  def finish
    set_project_and_sprint
    authorize @task
    @task.finish
    respond_to do |format|
      format.html { redirect_to [@project,@sprint,@task], notice: 'Task was successfully finished.' }
      format.json { render :show, status: :ok, location: @task }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_project_and_sprint
      @project = Project.find(params[:project_id])
      @sprint = Sprint.find(params[:sprint_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :estimated_time, :status, :time_spent, :sprint_id)
    end
end
