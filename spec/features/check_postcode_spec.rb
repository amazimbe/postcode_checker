require 'byebug'

feature 'Check postcode', type: :feature do
  scenario 'Postcode in the service area' do
    visit '/'

    VCR.use_cassette 'se17qa' do
      within("#postcode_form") do
        fill_in 'postcode', with: 'SE1 7QA'
        click_button 'submit'
      end

      expect(page).to have_content 'SE1 7QA is in the service area'
    end
  end

  scenario 'Postcode not in the service area' do
    visit '/'

    VCR.use_cassette 'mk404th' do
      within("#postcode_form") do
        fill_in 'postcode', with: 'MK40 4TH'
        click_button 'submit'
      end

      expect(page).to have_content 'MK40 4TH is not in the service area'
    end
  end

  scenario 'No postcode entered', type: :feature do
    visit '/'
 
    within("#postcode_form") do
      click_button 'submit'
    end

    expect(page).to have_content 'Enter a postcode'
  end
end