# BMI App

This Flutter application allows users to calculate their Body Mass Index (BMI) and store their BMI records using Firebase Authentication and Firestore.  The app follows the MVC (Model-View-Controller) architecture to separate concerns and enhance maintainability. Since it's a simple app, no state management libraries were used just handling stateful widgets were enough.

## Features

- **BMI Calculation**: Users can calculate their BMI by entering their height and weight.
- **Firebase Authentication**: Users can sign in anonymously to use the app.
- **Firestore Database**: User BMI records are stored in Firestore for future reference.
- **Edit and Delete Records**: Users can edit or delete their BMI records.
- **View Records by Time**: Users can view their BMI records sorted by time.

## Architecture

- **Model**: Handles data-related logic and interacts with Firestore for BMI records.
- **View**: Displays UI elements and handles user interactions.
- **Controller**: Orchestrates communication between the Model and View, and contains business logic.



## Branching Methodology

The app development process follows a branching methodology in Git, where each feature is implemented in a separate branch and then merged into the master branch after completion.
