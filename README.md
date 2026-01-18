# my_flight_booking_app
 


 My Flight Booking App

A Flutter application that allows users to search, book flights, and manage their bookings. The app also integrates Firebase for user authentication and group chat functionality, and uses Hive for local storage of flight bookings.

Features:

User Authentication: Register and login with Firebase Authentication.

Flight Search & Booking: Search for available flights and book them.

My Booked Flights: View your past bookings.

Group Chat: Create or join groups and chat with other users.

Installation & Setup

To get started with the project, follow the steps below:

1. Clone the Repository:

Clone the repository to your local machine by running:

git clone https://github.com/DivyDeepSingh/my_flight_booking_app.git
cd my_flight_booking_app

2. Install Dependencies:

Install all necessary dependencies by running:

flutter clean
flutter pub get

3. Generate Code for Freezed  

The project uses freezed for immutability . To generate the required code, run:

flutter packages pub run build_runner build --delete-conflicting-outputs

4. Configure Firebase:

It only works on android
For iOS, currently no Firebase service files are added.

5. Platform Support:

Currently, the app works only on Android. The iOS service file is not added yet.

Usage

Once you’ve completed the setup, follow these steps:

1. Login or Register:

After launching the app, you'll need to register or log in using Firebase Authentication (email/password).

2. Home Screen Options:

Create a Group: You can create a group, invite users, and start chatting.

Search Flights: Search for available flights and book them.

My Booked Flights: View all your flight bookings saved locally using Hive.

3. Logout:

On the top-right of the home screen, you’ll find a Logout option. Clicking it will log the user out and clear all local storage data (including flight bookings).

Group Chat Functionality:

Create a Group: Users can create a group and add multiple members.

Add Members: You can invite people by selecting them from the available user list.

Leave a Group: Any user (creator or members) can leave a group. Once they leave, the group will no longer be visible to them, and they won't be able to send messages in the group.

Note:

Notifications for the chat module are not yet implemented.

Extra Features: If additional features are needed, such as notifications or advanced search functionality, they can be added in the future.