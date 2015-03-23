require 'rails_helper'

describe 'the edit a question process' do
  it 'edits a question' do
    question = Question.create(:title => 'Edit Question Title', :content => 'Edit Question Content')
    question.save
    visit question_path(question.id)
    click_on 'Edit'
    fill_in 'Title', :with => 'Edited Question Title'
    click_on 'Update Question'
    expect(page).to have_content 'Edited Question Title'
  end

  it 'gives error when no content is entered' do
    question = Question.create(:title => 'Blank Content Question Title', :content => 'Blank Content')
    question.save
    visit question_path(question.id)
    click_on 'Edit'
    fill_in 'Content', :with=> ''
    click_on 'Update Question'
    expect(page).to have_content 'Error message'
  end
end
