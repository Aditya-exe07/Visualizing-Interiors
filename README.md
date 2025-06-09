# Visualizing Interiors

### CS50x Final Project  
**Author:** Aditya Kadam  
**GitHub Repository:** [https://github.com/Aditya-exe07/Visualizing-Interiors](https://github.com/Aditya-exe07/Visualizing-Interiors)  
**Demo Video:** [https://youtu.be/DkyRLdGtc10](https://youtu.be/DkyRLdGtc10)

---

## Description

**Visualizing Interiors** is an iOS application designed to help users preview and experiment with room layouts using Augmented Reality (AR). By leveraging ARKit and RealityKit, the app allows users to place virtual furniture in their real-world environments using the camera on their iPhone or iPad.

The primary goal of this project is to create an immersive, interactive, and practical tool for individuals looking to visualize interior design possibilities before committing to physical changes. The app currently supports room-specific interfaces such as bedroom, living room, kitchen, study, and more. Users can select furniture items and place them in their surroundings, enabling them to make informed aesthetic and spatial decisions.

The app also incorporates basic user account functionality. Users can register and log in via a locally stored database using Core Data, enabling a personalized experience.

---

## Technologies Used

- **Swift** – Primary programming language for iOS development
- **Xcode** – IDE used to develop and run the app
- **ARKit** – Apple’s framework for building augmented reality experiences
- **RealityKit** – Framework for rendering and animating 3D models in AR
- **Core Data** – Used to manage and persist user registration data
- **SwiftUI** – Modern declarative UI framework for building the app’s interface

---

## Features

- Select from multiple room types including bedroom, kitchen, living room, and study
- Place and reposition virtual 3D furniture models in real-world environments
- Basic user registration and login using Core Data
- Clear, intuitive interface designed with SwiftUI
- Interactive gesture support for placing and moving objects in AR view

The AR placement is designed to be responsive and realistic, helping users visualize furniture in scale with their actual space. The room selection screen guides users into different UI paths for each room type, each linked to corresponding furniture options. The registration feature ensures that a user must sign in before accessing the room features, providing a basic framework for personalized sessions.

---

## File Descriptions

- `AppDelegate.swift` – Standard app lifecycle manager; handles launch behavior
- `ContentView.swift` – Starting point of the UI, manages user login and registration flow
- `RoomView.swift` – Contains SwiftUI views for various room options with navigation logic
- `ARViewContainer.swift` – Embeds and manages the AR view; contains logic for placing and manipulating 3D models
- `Model.swift` – Defines data models used across the app, including user and furniture entities
- `CoreDataManager.swift` – Handles all Core Data interactions, including user creation and validation
- `Assets.xcassets` – Includes images and 3D models used in the app
- `LaunchScreen.storyboard` – Minimal launch screen configuration for user onboarding

---

## Design Decisions

A major design decision was whether or not to store room layouts persistently. While saving layouts would have enhanced the app significantly, the complexities of tracking 3D object positions, managing AR anchors, and serializing this data into a persistent format were beyond the scope of this initial version. As such, this feature has been reserved for future development.

Another notable decision involved choosing Core Data over a cloud-based alternative like Firebase. While Firebase offers real-time cloud syncing and multi-user scalability, Core Data integrates more seamlessly with SwiftUI and was more suitable for an offline-first experience with minimal configuration. Given the personal and local nature of this version, Core Data sufficed.

From a UI/UX perspective, simplicity was key. AR applications can quickly become overwhelming, especially on mobile devices. Using SwiftUI, I opted for a clean interface with minimal elements on screen. Users are guided step-by-step—from logging in, to selecting a room, to entering AR mode—to ensure clarity and reduce cognitive load.

The furniture selection process was kept lightweight to focus on placement rather than catalog browsing. This helps emphasize the spatial aspect of the app, staying true to the goal of "visualizing interiors."

---

## How to Run

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/Aditya-exe07/Visualizing-Interiors.git
   ```

2. Open the project folder in Xcode.

3. Select a target device (preferably a real iPhone or iPad).

4. Build and run the project. Use Command (⌘) + R or click the Run button in Xcode.

5. Please note: Full AR functionality requires a real device with ARKit support. Simulators may not provide accurate AR performance.

---

## How It Works

Upon launching the app, the user is presented with a registration or login screen. Once authenticated, they are taken to a dashboard where they can choose from various rooms. Upon selecting a room, the app transitions into AR mode, enabling placement of furniture in real-time.

The app uses gesture recognition to place items on detected surfaces. Furniture snaps into place based on AR anchors, maintaining proper scale and orientation. Users can move items around by interacting with them directly in the AR view. Although the furniture and layout are not saved after closing the app, the user session is managed locally to simulate a more personal design flow.

---

## What I Learned

Through this project, I gained hands-on experience with several advanced iOS technologies, particularly ARKit and RealityKit. I learned how to detect surfaces, manage anchors, and work with 3D assets in real space. I also built a working understanding of Core Data’s integration with SwiftUI, including data persistence, fetching, and error handling.

UI design was another valuable learning area. Designing fluid, intuitive navigation in SwiftUI required a good understanding of view composition and state management. Additionally, this project strengthened my ability to debug and test features specific to AR, which differ significantly from traditional app testing.

---

## Future Improvements

- Add save/load functionality for layouts using ARWorldMap or serialized anchor data
- Support for multi-room projects with named layouts
- Ability to export screenshots or short videos of designed rooms
- Add cloud syncing using Firebase or iCloud for cross-device access
- Enable users to choose furniture by style, color, or budget constraints
- Include UI-based measurement tools for checking room dimensions
