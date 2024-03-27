# JUCR Technical Test  

This Application is here to display a simple screen with all the information regarding the user's car and its charging state. YOu can also see some statistics and a list of the nearby charging stations

# Installation

You just need to clone the project using the following command :
- git clone https://github.com/LeoMarliere/JUCR.git

Then you can start the project without anything more needed.

# Application Architecture : MVVM

- MainViewModel encapsulates the state and behavior of the MainView.m He is also in charge of the logic for fetching the data. Here, I just simulated a API Request and create a Mock Object instead.

- MainView observes changes in the ViewModel's properties using @ObservedObject and updates its UI accordingly.

- I choose this pattern because it separates concerns and makes code more maintainable and testable.

# Features

- When the App start, we display the Informations of the user's Car in our View.

- The user is able to see if his car model, if it is charging, the remaining charging time and the percentage of the battery full. He will also see a View that display multiples informations likes Statistics or the Nearby Charging Stations

- The User can scrool up or down to change the size of the Information View. Doing that also display a smaller version of the Car Charging State.

