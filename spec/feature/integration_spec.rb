# location: spec/feature/integration_spec.rb
require 'rails_helper'
require 'date'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowling'
    fill_in 'Price', with: 10.00
    select '1991-05-05', from: 'Published'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('JK Rowling')
    expect(page).to have_content(10.00)
    expect(page).to have_content('1991-05-05')
  end

  scenario 'invalid author' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: nil
    fill_in 'Price', with: 10.00
    fill_in 'Published', with: '05-05-1991'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).not_to have_content('JK Rowling')
    expect(page).to have_content(10.00)
    expect(page).to have_content('05-05-1991')
  end

  scenario 'invalid price' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowling'
    fill_in 'Price', with: nil
    fill_in 'Published', with: '05-05-1991'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('JK Rowling')
    expect(page).not_to have_content(10.00)
    expect(page).to have_content('05-05-1991')
  end

  scenario 'invalid date' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowling'
    fill_in 'Price', with: 10.00
    fill_in 'Published', with: nil
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('JK Rowling')
    expect(page).to have_content(10.00)
    expect(page).not_to have_content('05-05-1991')
  end

end
