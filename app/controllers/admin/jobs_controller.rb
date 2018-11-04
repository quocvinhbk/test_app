class Admin::JobsController < Admin::BaseController
  before_action :set_admin_job, only: [:show, :edit, :update, :destroy]

  # GET /admin/jobs
  # GET /admin/jobs.json
  def index
    @jobs = Job.all
  end

  # GET /admin/jobs/1
  # GET /admin/jobs/1.json
  def show
  end

  # GET /admin/jobs/new
  def new
    @job = Job.new
  end

  # GET /admin/jobs/1/edit
  def edit
  end

  # POST /admin/jobs
  # POST /admin/jobs.json
  def create
    @job = Job.new(admin_job_params)

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

  # PATCH/PUT /admin/jobs/1
  # PATCH/PUT /admin/jobs/1.json
  def update
    respond_to do |format|
      if @job.update(admin_job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/jobs/1
  # DELETE /admin/jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to admin_jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_job_params
      params.require(:admin_job).permit(:company_name, :occupational_category_name, :title, :base_salary, :employment_type, :work_hours, :description, :education_requirements, :date_posted, :valid_through)
    end
end
