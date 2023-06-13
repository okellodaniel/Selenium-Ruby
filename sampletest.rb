require 'selenium-webdriver'
require "rspec"

driver = Selenium::WebDriver.for :firefox

describe "Blog Application" do
  describe "Signup to blog application" do
    it "confirm that a user can successfully sign up" do

        driver.navigate.to "https://selenium-blog.herokuapp.com/signup"

        username_field = driver.find_element(id: 'user_username').send_keys('okellodaniel')

        user_email_field = driver.find_element(id: 'user_email').send_keys('okellodaniel@protonmail.com')

        user_password_field  = driver.find_element(id: 'user_password').send_keys('1234')

        submit_button = driver.find_element(id: 'submit')
        submit_button.click

        banner = driver.find_element(id: 'flash_success')
        banner_text = banner.text

        expect(banner_text).to eq("Welcome to the alpha blog okellodaniel")

        driver.quit
    end
  end
end
