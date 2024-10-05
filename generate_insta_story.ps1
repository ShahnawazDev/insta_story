# Define base directory for your Flutter project
$baseDir = "D:\Projects\FlutterProjects\insta_story\libbb"  # Change to your actual Flutter project path

# Directories to create
$dirs = @(
    "$baseDir\data\models",
    "$baseDir\data\repositories",
    "$baseDir\data\data_providers",  # Optional: data_providers folder if you plan to add it later
    "$baseDir\blocs\story",
    "$baseDir\blocs\user",
    "$baseDir\blocs\authentication",
    "$baseDir\presentation\screens",
    "$baseDir\presentation\widgets",
    "$baseDir\core"
)

# Files to create
$files = @(
    "$baseDir\data\models\story_model.dart",
    "$baseDir\data\models\user_model.dart",
    "$baseDir\data\repositories\story_repository.dart",
    "$baseDir\blocs\story\story_bloc.dart",
    "$baseDir\blocs\story\story_event.dart",
    "$baseDir\blocs\story\story_state.dart",
    "$baseDir\blocs\user\user_bloc.dart",
    "$baseDir\blocs\user\user_event.dart",
    "$baseDir\blocs\user\user_state.dart",
    "$baseDir\blocs\authentication\auth_bloc.dart",
    "$baseDir\blocs\authentication\auth_event.dart",
    "$baseDir\blocs\authentication\auth_state.dart",
    "$baseDir\presentation\screens\story_screen.dart",
    "$baseDir\presentation\screens\user_list_screen.dart",
    "$baseDir\presentation\screens\auth_screen.dart",  # Optional: Auth screen
    "$baseDir\presentation\widgets\story_viewer.dart",
    "$baseDir\presentation\widgets\user_avatar.dart",
    "$baseDir\core\api_client.dart",
    "$baseDir\core\constants.dart",
    "$baseDir\main.dart"
)

# Create directories
foreach ($dir in $dirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir
        Write-Host "Created directory: $dir"
    }
}

# Create files
foreach ($file in $files) {
    if (-not (Test-Path $file)) {
        New-Item -ItemType File -Path $file
        Write-Host "Created file: $file"
    }
}
