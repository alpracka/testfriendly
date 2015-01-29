require 'rails_helper'

feature "Projects", :type => :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"

  it "creates new project" do
    visit root_path
    expect(page).to have_content 'Listing Projects'
    click_link 'New Project'
    expect(page).to have_content 'New Project'
    within("#new_project") do
      fill_in 'Name', :with => 'First project'
      fill_in 'Description', :with => 'What we should do'
    end
    click_button 'Create Project'
    expect(page).to have_content 'Project was successfully created'
  end

  before do
    project = FactoryGirl.build(:project, name: nil, description: "blank")
    project.save(validate: false) 
  end

  it "edits already created project" do
    visit root_path  
    expect(page).to have_content 'blank'
    click_link 'Edit'
    expect(page).to have_selector '.edit_project'
    
    # First time it is ok
    click_button 'Update Project'
    expect(page).to have_content 'error'
    
    # Second time fails
    click_button 'Update Project'
    expect(page).to have_content 'error'

  end

end
