Feature: user can rent a bike

  In order to ride a bike
  As a user of boris bikes
  I want a station to give me a bike

  Scenario: user can rent a bike
    Given a station with available bikes
    When I request to rent a bike
    Then I am given a bike