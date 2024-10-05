
## Getting Started

### Prerequisites
- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/shahnawazdev/insta_story.git
    cd insta_story
    ```

2. Install dependencies:
    ```sh
    flutter pub get
    ```

3. Run the application:
    ```sh
    flutter run
    ```

## Features

- **User List Screen**: Displays a list of users fetched from an API.
- **Story List Screen**: Displays a list of stories for a selected user.
- **Story View Screen**: Displays individual stories with support for both images and videos.
- **Story Viewer Widgets**: Includes widgets for viewing images and videos in stories.
- **Progress Indicator**: Shows the progress of story viewing.

## Directory Structure

### Blocs
- **User Bloc**: Manages the state for the user feature.

### Core
- **Utilities**: API client, constants, dummy data, story controller, and utility functions.

### Data Layer
- **Models**: Defines the data structures for stories and users.
- **Repositories**: Handles API calls and data fetching.

### Presentation Layer
- **Screens**: Contains the UI screens for user list, story list, and story view.
- **Widgets**: Reusable UI components for story viewing and progress indication.

## Key Files

- [lib/blocs/user/user_bloc.dart](lib/blocs/user/user_bloc.dart): User Bloc implementation.
- [lib/presentation/screens/user_list_screen.dart](lib/presentation/screens/user_list_screen.dart): User List Screen.
- [lib/presentation/screens/story_list_screen.dart](lib/presentation/screens/story_list_screen.dart): Story List Screen.
- [lib/presentation/screens/story_view_screen.dart](lib/presentation/screens/story_view_screen.dart): Story View Screen.
- [lib/presentation/widgets/story_image_viewer.dart](lib/presentation/widgets/story_image_viewer.dart): Story Image Viewer Widget.
- [lib/presentation/widgets/story_video_viewer.dart](lib/presentation/widgets/story_video_viewer.dart): Story Video Viewer Widget.
- [lib/main.dart](lib/main.dart): Entry point of the application.

## Contributing

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

## License

Distributed under the MIT License. See `LICENSE` for more information.
