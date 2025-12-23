# Diffusely case study

Jonathan Mlynarczyk

## Features

- **Employee Management**: List, view details, create, edit, and delete employees
- **Offline-First**: Local caching with optimistic UI updates
- **Pull-to-Refresh**: Sync data on demand
- **Error Handling**: User-friendly error messages via snackbar notifications

> Note: Uses mocked API due to rate limits on test endpoint (configurable in `app_config.dart`)

## Architecture

- **State Management**: Riverpod
- **Data Models**: Freezed + json_serializable
- **Persistence**: Sembast (local database)
- **Navigation**: go_router (Navigator 2.0)
- **Localization**: easy_localization
- **Structure**: Clean Architecture (presentation, domain, data layers)
