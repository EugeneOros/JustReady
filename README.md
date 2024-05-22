# Just Ready

## 📋 Overview

**JustReady** is a dynamic solution, meticulously crafted to optimize the end-to-end workflow of meal orders, seamlessly accommodating both event-driven and traditional restaurant environments. Battle-tested at a 300-person conference, JustReady excels in streamlining the process of meal creation, order management, and delivery fulfillment. The application is intelligently divided into four distinct sections: Menu Creation, Order Placement, Kitchen Management, and Customer Dashboard, ensuring smooth operations and delightful experiences for both staff and customers.

JustReady is a comprehensive application designed to streamline the process of creating, managing, and fulfilling meal orders in a restaurant setting. The application is divided into four main sections: Meal Creation, Order Creation, Kitchen Management, and Customer Dashboard.

### Features ⭐️ 
#### 1. Menu Creation 🍽️
This section is designed for composing menu. Here, you can create meals and assign prices for both single and double portions.

- **Add New Meal:** Create a meal with a name, description, single meal price, and double meal price.
- **Edit Meal:** Modify the details of an existing meal.
- **Delete Meal:** Remove a meal from the menu.
<img src="assets/gifs/create_order.gif" alt="Description of GIF" width="250">

#### 2. Order Placement 🛎️
This section is intended for use by the person at the cash register to take customer orders.

- **Select Meal:** Choose meals from the predefined menu.
- **Add Custom Instructions:** Include specific instructions (e.g., "Oat milk in coffee") for the kitchen staff.
- **Send to Kitchen:** Submit the order to the kitchen for preparation.
<img src="assets/gifs/add_meal.gif" alt="Description of GIF" width="250">


#### 3. Kitchen Management 👨🏻‍🍳
In this section, kitchen staff can view and manage the orders that have been placed.

- **Order List:** See a list of all current orders with their details.
- **Order Status:** Each order can be marked as:
  - **To Do:** The order is received and needs to be prepared.
  - **Done:** The order is prepared and ready to be picked up.
  - **Delivered:** The order has been delivered to the customer.
- **Order Tracking:** Orders marked as "Done" will trigger a notification on the customer dashboard. Orders marked as "Delivered" will disappear from both the kitchen view and the dashboard.
<img src="assets/gifs/prepare_order.gif" alt="Description of GIF" width="700">

#### 4. Customer Dashboard 🖥️
The dashboard provides real-time updates for customers waiting for their orders.

- **Waiting Orders Column:** Displays orders that are being prepared.
- **Ready Orders Column:** Displays orders that are ready for pickup.
- **Popup Notifications:** When an order is marked as ready, a custom animated popup with a funny message encourages customers to pick up their orders.
<img src="assets/gifs/dashboard.gif" alt="Description of GIF" width="700">

## 💻 Tech Stack

### Flutter Web 🌐
The app is built using Flutter Web for a rich and responsive user interface.

### Firebase 🔥
- **Deployment**: Deployed with Firebase Hosting for fast and secure hosting.
- **Data Storage**: Uses Firebase Firestore for flexible and scalable data storage.

These technologies were chosen for their ease of use, scalability, and ability to provide a seamless development and deployment experience.

## 🚀 Getting Started 

### Installation 🔩
1. Clone the repository:
   ```bash
   https://github.com/EugeneOros/JustReady.git
2. Generating files
   ```bash
   flutter pub get
3. Run the application:
   ```bash
   flutter run

### Building for Production 🛠
1. **Install Firebase CLI:** If you haven't already, install the Firebase CLI by running the following command:
   ```bash
   npm install -g firebase-tools
2. **Login to Firebase:** Authenticate with your Firebase account:
   ```bash
   firebase login
3. **Initialize Firebase in Your Project:** Navigate to the root directory of your project and run the following command to set up Firebase Hosting:
   ```bash
   firebase init
4. **Build the Flutter Web Application:** Compile the Flutter application for the web:
   ```bash
   flutter build web

5. **Deploy to Firebase Hosting:** Deploy the compiled application to Firebase Hosting:
   ```bash
   firebase deploy

### Development Assistance👨‍💻

During the development process, you may need to generate files for certain packages used in the project. Here are some commands to help you with that:

1. **Generate Files for Packages:**
   Some packages used in the project require the developer to generate files. To do that, run this command in the project workspace:
   ```sh
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
2. **Generate Localization Files:**
   ```sh
   flutter pub global run intl_utils:generate
   ```

3. **Generate Assets and Fonts Files:**
   ```sh
   fluttergen -c pubspec.yaml
   ```
