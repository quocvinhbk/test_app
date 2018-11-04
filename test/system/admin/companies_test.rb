require "application_system_test_case"

class Admin::CompaniesTest < ApplicationSystemTestCase
  setup do
    @admin_company = admin_companies(:one)
  end

  test "visiting the index" do
    visit admin_companies_url
    assert_selector "h1", text: "Admin/Companies"
  end

  test "creating a Company" do
    visit admin_companies_url
    click_on "New Admin/Company"

    fill_in "Address", with: @admin_company.address
    fill_in "Email", with: @admin_company.email
    fill_in "Name", with: @admin_company.name
    fill_in "Phone", with: @admin_company.phone
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "updating a Company" do
    visit admin_companies_url
    click_on "Edit", match: :first

    fill_in "Address", with: @admin_company.address
    fill_in "Email", with: @admin_company.email
    fill_in "Name", with: @admin_company.name
    fill_in "Phone", with: @admin_company.phone
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "destroying a Company" do
    visit admin_companies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company was successfully destroyed"
  end
end
