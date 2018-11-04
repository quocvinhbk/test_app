class Manage::JobsController < Manage::BaseController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /manage/jobs
  # GET /manage/jobs.json
  def index
    # @jobs = Job.all
    @jobs = @company.jobs.includes(:company, :occupational_category)
  end

  # GET /manage/jobs/1
  # GET /manage/jobs/1.json
  def show
  end

  # GET /manage/jobs/new
  def new
    @job = @company.jobs.new
  end

  # GET /manage/jobs/1/edit
  def edit
  end

  # POST /manage/jobs
  # POST /manage/jobs.json
  def create
    @job = @company.jobs.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/jobs/1
  # PATCH/PUT /manage/jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/jobs/1
  # DELETE /manage/jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:company_name, :occupational_category_name, :title, :base_salary, :employment_type, :work_hours, :description, :education_requirements, :date_posted, :valid_through)
    end
end
