require 'spec_helper.rb'

feature 'List the links' do
	scenario 'show a list of links' do
    link = Link.create(:url => 'http://examkfdl', :title => 'example')
    visit '/links'
		expect(page.status_code).to eq 200
    expect(page).to have_content 'http://examkfdl'
  end
end
