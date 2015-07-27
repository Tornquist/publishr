Given(/^I am on the ebook page$/) do
  visit ebooks_path
end

When(/^I click new ebook$/) do
  click_link "New Ebook"
end

When(/^fill in the ebook form$/) do
  ebook = build(:ebook)
  fill_in "ebook_user_id", with: ebook.user_id
  fill_in "ebook_title", with: ebook.title
  fill_in "ebook_description", with: ebook.description
  fill_in "ebook_version", with: ebook.version
  fill_in "ebook_url", with: ebook.url
  fill_in "ebook_language", with: ebook.language
  fill_in "ebook_publisher", with: ebook.publisher
  fill_in "ebook_subject", with: ebook.subject
  fill_in "ebook_rights", with: ebook.rights
  if ebook.readability
    check "ebook_readability"
  else
    uncheck "ebook_readability"
  end
  # generated, markdown and epub are calculated
  click_button "Create Ebook"
end

Then(/^I have a new ebook$/) do
  expect(page.find('.alert').text).to have_content("Ebook was successfully created.")
end

Given(/^I have an ebook$/) do
  create :ebook
end

When(/^I click edit$/) do
  first('.fa-pencil').click
end

When(/^change the title$/) do
  fill_in "ebook_title", with: "NEW TITLE"
  click_button "Update Ebook"
end

Then(/^I have an updated ebook$/) do
  expect(page.find('.alert').text).to have_content("Ebook was successfully updated.")
end

When(/^I click destroy$/) do
  first('.fa-trash').click
  page.driver.browser.switch_to.alert.accept
end

Then(/^I have (\d+) ebooks$/) do |number|
  sleep(0.01) # Fixed delay when hitting accept on js alert
  expect(Ebook.count).to eq(number.to_i)
end
