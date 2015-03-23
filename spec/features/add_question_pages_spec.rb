require 'rails_helper'

describe 'the add a question process' do
  it 'adds a new question' do
    visit new_question_path
    fill_in 'Title', :with => 'question title'
    fill_in 'Content', :with => 'question content'
    click_on  'Create Question'
    expect(page).to have_content 'question title'
  end
end
