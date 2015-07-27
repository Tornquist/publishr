Feature:
  The interface allows for the easy creation, deletion and updating
  of ebook information.

  Scenario: New Ebook
    Given I am on the ebook page
    When I click new ebook
    And fill in the ebook form
    Then I have a new ebook

  Scenario: Update Ebook
    Given I have an ebook
    And I am on the ebook page
    When I click edit
    And change the title
    Then I have an updated ebook

  Scenario: Delete Book
    Given I have an ebook
    And I am on the ebook page
    When I click destroy
    Then I have 0 ebooks
