FactoryGirl.define do
  factory :ebook do
    user_id 1
    title "MyString"
    description "MyText"
    version "MyString"
    url "MyText"
    generated false
    language "MyString"
    publisher "MyString"
    subject "MyString"
    rights "MyString"
    readability false
    markdown "MyText"
    epub ""
  end
end
