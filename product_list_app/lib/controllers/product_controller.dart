import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Providers
final apiServiceProvider = Provider((ref) => ApiService());

final productListProvider = FutureProvider<ProductListResponse>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return await apiService.fetchProducts();
});

final favoriteProductsProvider = StateNotifierProvider<FavoriteProductsNotifier, Set<int>>((ref) {
  return FavoriteProductsNotifier();
});

class FavoriteProductsNotifier extends StateNotifier<Set<int>> {
  FavoriteProductsNotifier() : super({}) {
    _loadFavorites();
  }

  static const String _favoritesKey = 'favorite_product_ids';

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_favoritesKey);
    if (favorites != null) {
      state = favorites.map((id) => int.parse(id)).toSet();
    }
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _favoritesKey,
      state.map((id) => id.toString()).toList(),
    );
  }

  void toggleFavorite(int productId) {
    final newState = Set<int>.from(state);
    if (newState.contains(productId)) {
      newState.remove(productId);
    } else {
      newState.add(productId);
    }
    state = newState;
    _saveFavorites();
  }

  bool isFavorite(int productId) {
    return state.contains(productId);
  }
}