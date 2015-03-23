require 'rails_helper'

describe 'the add an answer process' do
  it 'adds an answer' do
    question = Question.create(:title => 'Question Title', :content => 'Question Content')
    visit new_question_answer_path(question.id)
    fill_in 'Content', :with => 'Answer Content'
    click_on 'Create Answer'
    expect(page).to have_content 'Answer Content'
  end
end
