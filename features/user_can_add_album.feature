Feature: Users can add and delete albums

    Scenario: Happy Path
        Given I am logged in
        When I go to the index page
        Then I click on "Add Album"
        Then I should see "Add New Album:"
        And I fill in "Artist" with "Aerosmith"
        And I fill in "Title" with "Rocks"
        And I fill in "Year" with "1976"
        And I fill in "Label" with "Columbia"
        And I select "U.S." from "Country"
        And I select "VG+" from "Condition"
        And I click "Add Album"
        Then I should see "Rocks has been added to your shelf."
        Then I should see "Aerosmith"
        When I click on "Delete"
        Then I should not see "Aerosmith"
