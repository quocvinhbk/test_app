require "application_system_test_case"

class Admin::JobsTest < ApplicationSystemTestCase
  setup do
    @admin_job = admin_jobs(:one)
  end

  test "visiting the index" do
    visit admin_jobs_url
    assert_selector "h1", text: "Admin/Jobs"
  end

  test "creating a Job" do
    visit admin_jobs_url
    click_on "New Admin/Job"

    fill_in "Base Salary", with: @admin_job.base_salary
    fill_in "Company Name", with: @admin_job.company_name
    fill_in "Date Posted", with: @admin_job.date_posted
    fill_in "Description", with: @admin_job.description
    fill_in "Education Requirements", with: @admin_job.education_requirements
    fill_in "Employment Type", with: @admin_job.employment_type
    fill_in "Occupational Category Name", with: @admin_job.occupational_category_name
    fill_in "Title", with: @admin_job.title
    fill_in "Valid Through", with: @admin_job.valid_through
    fill_in "Work Hours", with: @admin_job.work_hours
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "updating a Job" do
    visit admin_jobs_url
    click_on "Edit", match: :first

    fill_in "Base Salary", with: @admin_job.base_salary
    fill_in "Company Name", with: @admin_job.company_name
    fill_in "Date Posted", with: @admin_job.date_posted
    fill_in "Description", with: @admin_job.description
    fill_in "Education Requirements", with: @admin_job.education_requirements
    fill_in "Employment Type", with: @admin_job.employment_type
    fill_in "Occupational Category Name", with: @admin_job.occupational_category_name
    fill_in "Title", with: @admin_job.title
    fill_in "Valid Through", with: @admin_job.valid_through
    fill_in "Work Hours", with: @admin_job.work_hours
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "destroying a Job" do
    visit admin_jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job was successfully destroyed"
  end
end
