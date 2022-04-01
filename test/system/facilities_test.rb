require 'application_system_test_case'

class FacilitiesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:bob) # Bob has role: admin
    @facility = facilities(:one)
  end

  test 'visiting the index' do
    visit facilities_url
    #assert_selector 'h1', text: 'Facilities'
  end

  test 'should create facility' do
    visit facilities_url
    click_on 'Hinzufügen'

    fill_in 'Adresse', with: @facility.address
    fill_in 'Ort', with: @facility.city
    fill_in 'Bezirk', with: @facility.district
    fill_in 'E-Mail', with: @facility.email
    fill_in 'Latitude', with: @facility.latitude
    fill_in 'Longitude', with: @facility.longitude
    fill_in 'Telefonnummer', with: @facility.phone
    fill_in 'PLZ', with: @facility.postal_code
    fill_in 'Anbieter', with: @facility.provider
    fill_in 'Leistung', with: @facility.service
    fill_in 'Name', with: @facility.title
    fill_in 'Website', with: @facility.website
    click_on 'Create Facility'

    assert_text 'Facility was successfully created'
    click_on 'Zur Übersicht'
  end

  test 'should update Facility' do
    visit facility_url(@facility)
    click_on 'Bearbeiten', match: :first

    fill_in 'Adresse', with: @facility.address
    fill_in 'Ort', with: @facility.city
    fill_in 'Bezirk', with: @facility.district
    fill_in 'E-Mail', with: @facility.email
    fill_in 'Latitude', with: @facility.latitude
    fill_in 'Longitude', with: @facility.longitude
    fill_in 'Telefonnummer', with: @facility.phone
    fill_in 'PLZ', with: @facility.postal_code
    fill_in 'Anbieter', with: @facility.provider
    fill_in 'Leistung', with: @facility.service
    fill_in 'Name', with: @facility.title
    fill_in 'Website', with: @facility.website
    click_on 'Update Facility'

    assert_text 'Facility was successfully updated'
    click_on 'Zur Übersicht'
  end

  test 'should destroy Facility' do
    visit facility_url(@facility)
    click_on 'Löschen', match: :first

    assert_text 'Facility was successfully destroyed'
  end
end
