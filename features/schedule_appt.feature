Feature: Scheduling an Appointment
	As a counselor
	So that I can schedule an appointment with my client
	I want to quickly book an empty room

Background: counselor has been logged in
	Given I am logged in as "Toni"
	And the following appointments exist:
	| Counselor | Type       | Room | Client    	| Date 		| Time 		|
	| Toni		| counseling | A 	| Bob Smith		| 12.12.2016| 11:00am 	| 
	| Yolanda	| counseling | B 	| White Hat		| 12.12.2016| 11:00pm	| 
	| Anna		| counseling | B 	| Danny Boy		| 12.12.2016| 11:00am	|
	And I am on the home page

Scenario: I want to schedule an appointment today
	When I press "Schedule an appointment"
	And I fill in "Room" with "A"
	And I fill in "Client Name" with "Frankie Gee"
	And I fill in "Date" with "12.19.2016"
	And I fill in "Time" with "8:00am"
	And I press "Confirm"
	Then I should see "Successfully scheduled counseling appointment for Toni with Frankie Gee on December 19 at 8:00am in Room A"

Scenario: I want to schedule a weekly, repeating appointment
	When I press "Schedule an appointment"
	And I fill in "Client Name" with "Zany Sue"
	And I fill in "Date" with "12.21.2016"
	And I fill in "Time" with "8:00am"
	And I fill in "Rep" with "weekly"
	And I press "Confirm"
	Then I should see "Successfully scheduled counseling appointment for Toni with Zany Sue on December 21 at 8:00am in Room A, repeats weekly"

Scenario: I want to schedule an appointment while another room is being used
	When I press "Schedule an appointment"
	And I fill in "Client Name" with "Zany Sue"
	And I fill in "Date" with "12.12.2016"
	And I fill in "Time" with "11:00pm"
	And I fill in "Rep" with "weekly"
	And I press "Confirm"
	Then I should see "Successfully scheduled counseling appointment for Toni with Zany Sue on December 21 at 8:00am in Room A, repeats weekly"