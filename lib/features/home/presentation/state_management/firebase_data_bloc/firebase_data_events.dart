import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_data_events.freezed.dart';

@freezed
abstract class FirebaseDataSourceEvent with _$FirebaseDataSourceEvent {
  const factory FirebaseDataSourceEvent.fetchFavItems() = FetchFavItems;
  const factory FirebaseDataSourceEvent.fetchProcessors() = FetchProcessors;
  const factory FirebaseDataSourceEvent.fetchGraphicCards() = FetchGraphicCards;
  const factory FirebaseDataSourceEvent.fetchMotherboards() = FetchMotherboards;
  const factory FirebaseDataSourceEvent.fetchRAM() = FetchRAM;
  const factory FirebaseDataSourceEvent.fetchStorage() = FetchStorage;
  const factory FirebaseDataSourceEvent.fetchCase() = FetchCase;
  const factory FirebaseDataSourceEvent.fetchMonitors() = FetchMonitors;
  const factory FirebaseDataSourceEvent.fetchPowerSupplies() = FetchPowerSupplies;
  const factory FirebaseDataSourceEvent.fetchKeyboards() = FetchKeyboards;
  const factory FirebaseDataSourceEvent.fetchMouses() = FetchMouses;
  const factory FirebaseDataSourceEvent.fetchHeadphones() = FetchHeadphones;
  const factory FirebaseDataSourceEvent.fetchMousePads() = FetchMousePads;
  const factory FirebaseDataSourceEvent.fetchExternalStorage() = FetchExternalStorage;
  const factory FirebaseDataSourceEvent.fetchWebcams() = FetchWebcams;
  const factory FirebaseDataSourceEvent.fetchSpeakers() = FetchSpeakers;
  const factory FirebaseDataSourceEvent.fetchThermalPastes() = FetchThermalPastes;
  const factory FirebaseDataSourceEvent.fetchCaseAccessories() = FetchCaseAccessories;
  const factory FirebaseDataSourceEvent.fetchFanControllers() = FetchFanControllers;
  const factory FirebaseDataSourceEvent.fetchCaseFans() = FetchCaseFans;
  const factory FirebaseDataSourceEvent.fetchOperatingSystems() = FetchOperatingSystems;
  const factory FirebaseDataSourceEvent.fetchOpticalDrives() = FetchOpticalDrivess;
  const factory FirebaseDataSourceEvent.fetchNews() = FetchNews;
}
