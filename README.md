# Product Image Viewer App

A Flutter application that fetches and displays product images from a mock API with favorite functionality.

## Features

- 📱 Grid view of products with images and titles
- 🔍 Product detail screen with full information
- ❤️ Favorite products with local persistence
- 🔄 Loading and error states
- 🎨 Smooth animations and transitions
- 🌐 API data fetching with error handling

## Architecture

This app follows the MVC (Model-View-Controller) architecture pattern:

### Model (`lib/models/`)
- `product_model.dart`: Defines the data structure for products

### View (`lib/views/`)
- `home_view.dart`: Displays product grid
- `product_detail_view.dart`: Shows detailed product information

### Controller (`lib/controllers/`)
- `product_controller.dart`: Manages state and business logic using Riverpod

### Service (`lib/services/`)
- `api_service.dart`: Handles API communication

## State Management

The app uses **Riverpod** for state management with the following providers:

1. `productListProvider`: Manages product data fetching
2. `favoriteProductsProvider`: Manages favorite products with SharedPreferences persistence

## Dependencies

- `http`: For API requests
- `shared_preferences`: For local storage of favorites
- `flutter_riverpod`: For state management
- `cached_network_image`: For efficient image loading and caching
- `shimmer`: For loading animations

### Installation

1. Clone the repository:
```
git clone https://github.com/tejas2213/product_list_app.git
```

2. Install dependencies:
```
flutter pub get
```

3. Run the app:
```
flutter run
```
