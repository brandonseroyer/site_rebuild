require 'rails_helper'

describe "the add a lesson process" do
  it "adds a new lesson" do
    visit lessons_path
    click_on 'Add New Lesson'
    fill_in 'Name', :with => 'Git Cheat Sheet'
    fill_in 'Content', :with => 'git commit git push run'
    fill_in 'Number', :with => '1'
    click_on 'Create Lesson'
    expect(page).to have_content 'Lessons'
  end

  it "gives error when no name is entered" do
    visit new_lesson_path
    click_on 'Create Lesson'
    expect(page).to have_content 'No Soup for you!'
  end

  it "gives error when no content is entered" do
    visit new_lesson_path
    click_on 'Create Lesson'
    expect(page).to have_content 'No Soup for you!'
  end

  it "gives error when no number is entered" do
    visit new_lesson_path
    click_on 'Create Lesson'
    expect(page).to have_content 'No Soup for you!'
  end
end
