
import 'package:flutter/foundation.dart';

import '../model/ride_pref/ride_pref.dart';
import '../repository/ride_preferences_repository.dart';

abstract class RidePreferencesListener{
  void onPreferenceChanged(RidePreference preference);
}

////
///   This service handles:
///   - The past ride preferences
///   - The currennt ride preferences
///
class RidePrefService {
  // Static private instance
  static RidePrefService? _instance;

  // Access to past preferences
  final RidePreferencesRepository repository;

  // The current preference
  RidePreference? _currentPreference;

  // List of listeners
  final List<RidePreferencesListener> _listeners =[];

  ///
  /// Private constructor
  ///
  RidePrefService._internal(this.repository);

  ///
  /// Initialize
  ///
  static void initialize(RidePreferencesRepository repository) {
    if (_instance == null) {
      _instance = RidePrefService._internal(repository);
    } else {
      throw Exception("RidePreferencesService is already initialized.");
    }
  }

  ///
  /// Singleton accessor
  ///
  static RidePrefService get instance {
    if (_instance == null) {
		  throw Exception("RidePreferencesService is not initialized. Call initialize() first.");
		}
		return _instance!;
  }

  // Current preference
  RidePreference? get currentPreference {
    print('Get  current  pref : $_currentPreference');
    return _currentPreference;
  }

  void setCurrentPreference(RidePreference preference) {
    _currentPreference = preference;
    print('Set current pref to $_currentPreference');
  }

  // Past preferences
  List<RidePreference> getPastPreferences() {
    return repository.getPastPreferences();
  }

  void addPreference(RidePreference preference) {
    return repository.addPreference(preference);
  }

  void addListener(RidePreferencesListener listener){
    _listeners.add(listener);
  }

  void notifyListeners(RidePreference preference){
    for(var listener in _listeners){
      listener.onPreferenceChanged(preference);
    }
  }
}

class ConsoleLogger implements RidePreferencesListener{
  @override
  void onPreferenceChanged(RidePreference preference){
    if(kDebugMode){
      print('Ride preference change: ${preference.toString()}');
    }
  }
}
