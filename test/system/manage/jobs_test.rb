require "application_system_test_case"

class Manage::JobsTest < ApplicationSystemTestCase
  setup do
    @manage_job = manage_jobs(:one)
  end

  test "visiting the index" do
    visit manage_jobs_url
    assert_selector "h1", text: "Manage/Jobs"
  end

  test "creating a Job" do
    visit manage_jobs_url
    click_on "New Manage/Job"

    fill_in "Base Salary", with: @manage_job.base_salary
    fill_in "Company Name", with: @manage_job.company_name
    fill_in "Date Posted", with: @manage_job.date_posted
    fill_in "Description", with: @manage_job.description
    fill_in "Education Requirements", with: @manage_job.education_requirements
    fill_in "Employment Type", with: @manage_job.employment_type
    fill_in "Occupational Category Name", with: @manage_job.occupational_category_name
    fill_in "Title", with: @manage_job.title
    fill_in "Valid Through", with: @manage_job.valid_through
    fill_in "Work Hours", with: @manage_job.work_hours
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "updating a Job" do
    visit manage_jobs_url
    click_on "Edit", match: :first

    fill_in "Base Salary", with: @manage_job.base_salary
    fill_in "Company Name", with: @manage_job.company_name
    fill_in "Date Posted", with: @manage_job.date_posted
    fill_in "Description", with: @manage_job.description
    fill_in "Education Requirements", with: @manage_job.education_requirements
    fill_in "Employment Type", with: @manage_job.employment_type
    fill_in "Occupational Category Name", with: @manage_job.occupational_category_name
    fill_in "Title", with: @manage_job.title
    fill_in "Valid Through", with: @manage_job.valid_through
    fill_in "Work Hours", with: @manage_job.work_hours
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "destroying a Job" do
    visit manage_jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job was successfully destroyed"
  end
end
