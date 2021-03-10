require 'rails_helper'

RSpec.describe ApplicationHelper, type: :system do
    describe 'index page' do
        it 'shows home button' do
            visit root_path
            expect(page).to have_content('Home')
        end

        it 'shows sign up button' do
            visit root_path
            expect(page).to have_content('Sign up')
        end

        it 'shows sign in button' do
            visit root_path
            expect(page).to have_content('Sign in')
        end

        it 'shows Log out button' do
            @user = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
            visit login_path
            fill_in 'email', with: @user.email
            click_on 'Submit'
            expect(page).to have_content('Log out')
        end

        it 'shows New Event button' do 
            @user = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
            visit login_path
            fill_in 'email', with: @user.email
            click_on 'Submit'
            expect(page).to have_content('New Event')
        end

        it 'shows users name when signed in' do 
            @user = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
            visit login_path
            fill_in 'email', with: @user.email
            click_on 'Submit'
            expect(page).to have_content('Foo')
        end


        it 'confirms if current user is signed in' do 
            @user = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
            visit login_path
            fill_in 'email', with: @user.email
            click_on 'Submit'
            expect(page).to have_content('Foo')
        end
    end

    describe 'login page' do
        it 'displays an alert when a non-registered user tries to login' do
            visit login_path
            fill_in 'email', with: 'non_registered@bar.com'
            click_on 'Submit'
            expect(page).to have_content('User not found.')
        end
    end
end