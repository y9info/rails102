require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  test "creating a Customer" do
    visit customers_url
    click_on "New Customer"

    fill_in "Address", with: @customer.address
    fill_in "Email", with: @customer.email
    fill_in "Fax", with: @customer.fax
    fill_in "Full name", with: @customer.full_name
    fill_in "Level", with: @customer.level
    fill_in "Linkman", with: @customer.linkman
    fill_in "Main purchase", with: @customer.main_purchase
    fill_in "Mobile", with: @customer.mobile
    fill_in "Note", with: @customer.note
    fill_in "Origin", with: @customer.origin
    fill_in "Phone", with: @customer.phone
    fill_in "Short name", with: @customer.short_name
    fill_in "Sq", with: @customer.sq
    fill_in "Track result", with: @customer.track_result
    fill_in "Website", with: @customer.website
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "updating a Customer" do
    visit customers_url
    click_on "Edit", match: :first

    fill_in "Address", with: @customer.address
    fill_in "Email", with: @customer.email
    fill_in "Fax", with: @customer.fax
    fill_in "Full name", with: @customer.full_name
    fill_in "Level", with: @customer.level
    fill_in "Linkman", with: @customer.linkman
    fill_in "Main purchase", with: @customer.main_purchase
    fill_in "Mobile", with: @customer.mobile
    fill_in "Note", with: @customer.note
    fill_in "Origin", with: @customer.origin
    fill_in "Phone", with: @customer.phone
    fill_in "Short name", with: @customer.short_name
    fill_in "Sq", with: @customer.sq
    fill_in "Track result", with: @customer.track_result
    fill_in "Website", with: @customer.website
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer" do
    visit customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer was successfully destroyed"
  end
end
