require 'application_system_test_case'

class FacilitiesTest < ApplicationSystemTestCase
  setup do
    @facility = facilities(:one)
  end

  test 'visiting the index' do
    visit facilities_url
    assert_selector 'h1', text: 'Facilities'
  end

  test 'should create facility' do
    visit facilities_url
    click_on 'New facility'

    fill_in 'Address', with: @facility.address
    fill_in 'City', with: @facility.city
    fill_in 'District', with: @facility.district
    fill_in 'Email', with: @facility.email
    fill_in 'Focus groups', with: @facility.focus_groups
    fill_in 'Latitude', with: @facility.latitude
    fill_in 'Longitude', with: @facility.longitude
    fill_in 'Phone', with: @facility.phone
    fill_in 'Postal code', with: @facility.postal_code
    fill_in 'Provider', with: @facility.provider
    fill_in 'Service', with: @facility.service
    fill_in 'Title', with: @facility.title
    fill_in 'Website', with: @facility.website
    click_on 'Create Facility'

    assert_text 'Facility was successfully created'
    click_on 'Back'
  end

  test 'should update Facility' do
    visit facility_url(@facility)
    click_on 'Edit this facility', match: :first

    fill_in 'Address', with: @facility.address
    fill_in 'City', with: @facility.city
    fill_in 'District', with: @facility.district
    fill_in 'Email', with: @facility.email
    fill_in 'Focus groups', with: @facility.focus_groups
    fill_in 'Latitude', with: @facility.latitude
    fill_in 'Longitude', with: @facility.longitude
    fill_in 'Phone', with: @facility.phone
    fill_in 'Postal code', with: @facility.postal_code
    fill_in 'Provider', with: @facility.provider
    fill_in 'Service', with: @facility.service
    fill_in 'Title', with: @facility.title
    fill_in 'Website', with: @facility.website
    click_on 'Update Facility'

    assert_text 'Facility was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Facility' do
    visit facility_url(@facility)
    click_on 'Destroy this facility', match: :first

    assert_text 'Facility was successfully destroyed'
  end
end
