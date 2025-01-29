# SevenAppTask App

## General App Information

User List App is a simple iOS app built using Swift language and demonstrates the Model-View-ViewModel (MVVM) architectural pattern. The app retrieves a list of users from the JSONPlaceholder API and displays them in a table view. Users can tap on a user to view detailed information such as name, email, phone, and website.

### Features

- Fetches a list of users from the **JSONPlaceholder API**.
- Displays user names and emails in a table view.
- Allows users to tap on a name to navigate to a detail screen with more information.

## Architecture

The app follows the **MVVM** (Model-View-ViewModel) design pattern. This separation of concerns makes the code more modular, maintainable, and testable.

### Design Patterns Used

- **Singleton Pattern**: The `NetworkService` class is Singleton, ensuring that all network requests are handled by only one instance.

- **MVVM Architecture**: The app is organized into **Model** (data), **View** (UI), and **ViewModel** (logic and data management).

### Async/Await

The app makes asynchronous API calls using async/await (available in Swift 5.5 and iOS 15.0 and above) to provide a smooth and responsive user experience.

## How to Run This Application

### Prerequisites

- **Xcode 13** or later
- **iOS 15.0** or later

### Steps to Run

1. Clone the repository using the following command in your terminal:
   ```bash
   git clone https://github.com/yourusername/SevenAppTask.git
   
2. Open the project in Xcode:
   Open the .xcodeproj or .xcworkspace file in Xcode.

3. Build and run the app on a simulator or device.
