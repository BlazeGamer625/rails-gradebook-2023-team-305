Feature: View Grades
    Scenario: view grades from homepage
      Given there are grades in the gradebook
      And I sign in as a teacher
      When I visit the homepage
      Then I should see everyone's grades

    Scenario: view grades from homepage
      Given there are grades in the gradebook
      And I sign in as a ta
      When I visit the homepage
      Then I should see everyone's grades

    Scenario: view specific grade from homepage
      Given there are grades in the gradebook
      And I sign in as a teacher
      When I visit the homepage
      Then I should see everyone's grades
      And I click "Show" on a post
      Then I should see that user's detailed grade information

    Scenario: view specific grade from homepage
      Given there are grades in the gradebook
      And I sign in as a ta
      When I visit the homepage
      Then I should see everyone's grades
      And I click "Show" on a post
      Then I should see that user's detailed grade information
    
    Scenario: view grades ascending order from homepage
      Given there are grades with sortable values in the gradebook
      And I sign in as a teacher
      When I visit the homepage
      And I click "ASC"
      Then I should see everyone's grades in ascending order

    Scenario: view grades ascending order from homepage
      Given there are grades with sortable values in the gradebook
      And I sign in as a ta
      When I visit the homepage
      And I click "ASC"
      Then I should see everyone's grades in ascending order
    
    Scenario: view grades descending order from homepage
      Given there are grades with sortable values in the gradebook
      And I sign in as a teacher
      When I visit the homepage
      And I click "DESC"
      Then I should see everyone's grades in descending order
    
    Scenario: view grades descending order from homepage
      Given there are grades with sortable values in the gradebook
      And I sign in as a ta
      When I visit the homepage
      And I click "DESC"
      Then I should see everyone's grades in descending order