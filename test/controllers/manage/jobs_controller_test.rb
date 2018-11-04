require 'test_helper'

class Manage::JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manage_job = manage_jobs(:one)
  end

  test "should get index" do
    get manage_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_manage_job_url
    assert_response :success
  end

  test "should create manage_job" do
    assert_difference('Manage::Job.count') do
      post manage_jobs_url, params: { manage_job: { base_salary: @manage_job.base_salary, company_name: @manage_job.company_name, date_posted: @manage_job.date_posted, description: @manage_job.description, education_requirements: @manage_job.education_requirements, employment_type: @manage_job.employment_type, occupational_category_name: @manage_job.occupational_category_name, title: @manage_job.title, valid_through: @manage_job.valid_through, work_hours: @manage_job.work_hours } }
    end

    assert_redirected_to manage_job_url(Manage::Job.last)
  end

  test "should show manage_job" do
    get manage_job_url(@manage_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_manage_job_url(@manage_job)
    assert_response :success
  end

  test "should update manage_job" do
    patch manage_job_url(@manage_job), params: { manage_job: { base_salary: @manage_job.base_salary, company_name: @manage_job.company_name, date_posted: @manage_job.date_posted, description: @manage_job.description, education_requirements: @manage_job.education_requirements, employment_type: @manage_job.employment_type, occupational_category_name: @manage_job.occupational_category_name, title: @manage_job.title, valid_through: @manage_job.valid_through, work_hours: @manage_job.work_hours } }
    assert_redirected_to manage_job_url(@manage_job)
  end

  test "should destroy manage_job" do
    assert_difference('Manage::Job.count', -1) do
      delete manage_job_url(@manage_job)
    end

    assert_redirected_to manage_jobs_url
  end
end
