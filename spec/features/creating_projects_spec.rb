require "rails_helper"

RSpec.feature "Users can create new projects" do
  scenario "with valid attributes" do
    visit "/"
    click_link "New Project"
    fill_in "Name", with: "Title of project 1"
    fill_in "Description", with: "Some description"
    click_button "Create Project"
    expect(page).to have_content "Project has been created."
    project = Project.find_by(name: "Title of project 1")
    expect(page.current_url).to eq project_url(project)
    title = "Title of project 1 - Projects - Ticket"
    expect(page).to have_title title
  end
end
