import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pc_recommendation/features/favorite_list/data/repositories/favorite_repository_impl.dart';
import 'package:pc_recommendation/features/favorite_list/presentation/state_management/favorite_bloc/favorite_bloc.dart';
import 'package:pc_recommendation/features/home/data/repositories/firebase_data_source_repository_implementation.dart';
import 'package:pc_recommendation/features/home/domain/usecases/firebase_data_source_usecase.dart';
import 'package:pc_recommendation/theme/text_theme/text_theme.dart';
import 'features/auth/data/data_sources/remote/firebase_auth.dart';
import 'features/auth/data/repositories/auth_repository_implementation.dart';
import 'features/auth/domain/usecases/auth_usecase.dart';
import 'features/auth/presentation/state_management/auth_bloc.dart';
import 'features/benchmark/presentation/state_management/benchmark_provider/benchmark_provider_bloc.dart';
import 'features/build/presentation/state_management/build_item_provider/build_bloc.dart';
import 'features/build/presentation/state_management/save_builds_bloc/saved_builds_bloc.dart';
import 'features/comunity/data/data_source/remote/post_remote_data_source.dart';
import 'features/comunity/data/repository_implementation/post_repository_impl.dart';
import 'features/comunity/domain/repositories/post_repository.dart';
import 'features/comunity/domain/usecases/post_usecase.dart';
import 'features/comunity/presentation/state_management/post_bloc.dart';
import 'features/comunity/presentation/state_management/post_bloc_event.dart';
import 'features/custom_bottom_bar/custom_bottom_bar_bloc/custom_bottom_bar_bloc.dart';
import 'features/favorite_list/data/data_source/remote/favorites_datasource.dart';
import 'features/favorite_list/domain/usecases/favorites_usecase.dart';
import 'features/home/data/data_sources/remote/firebase_data_source_data_source.dart';
import 'features/home/presentation/state_management/drawer_bloc/drawer_bloc.dart';
import 'features/home/presentation/screen/bottom_bar_wrapper.dart';
import 'features/home/presentation/state_management/firebase_data_bloc/firebase_data_bloc.dart';
import 'features/home/presentation/state_management/home_search_bloc/home_search_bloc.dart';
import 'features/home/presentation/state_management/items_serach_bloc/items_search_bloc.dart';
import 'features/onboarding/onboarding_first_page.dart';
import 'features/recommendation/recommendation.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
// Get an instance of Firebase Auth
final FirebaseAuth _auth = FirebaseAuth.instance;
final Recommendation recommendation=Recommendation();
final getIt = GetIt.instance;
void setup() {
  // Data sources
  getIt.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl(firestore: FirebaseFirestore.instance));

  // Repositories
  getIt.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(remoteDataSource: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => CreatePost(getIt()));
  getIt.registerLazySingleton(() => ToggleLikePost(getIt()));
  getIt.registerLazySingleton(() => SharePost(getIt()));
  getIt.registerLazySingleton(() => AddComment(getIt()));
  getIt.registerLazySingleton(() => GetPosts(getIt()));

  // BLoC
  getIt.registerFactory(() => PostBloc(
    createPost: getIt(),
    toggleLikePost: getIt(),
    sharePost: getIt(),
    addComment: getIt(),
    getPosts: getIt(),
  ));
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  recommendation.saveTopThreeRecommendations();
  List<Map<String, dynamic>> topThreeRecommendation =await recommendation.getTopThreeRecommendations();
  print(topThreeRecommendation);
  setup();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthBloc(
        authUseCase: AuthUseCase(
          firebaseAuthDataSourceRepository: AuthRepositoryImpl(
            dataSource: FirebaseAuthDataSourceImpl(),
          ),
        ),
      ),
    ),
    BlocProvider(
      create: (context) => FirebaseDataSourceBloc(
        getDataUseCase: FirebaseDataSourceUseCase(
            firebaseDataSourceRepository: FirebaseDataSourceRepositoryImpl(
                dataSource: FirebaseDataSource())),
      ),
    ),
    BlocProvider(
      create: (context) => BottomBarBloc(),
    ),

    BlocProvider(
      create: (context) => GraphicCardBloc(),
    ),
    BlocProvider(
      create: (context) => MotherboardBloc(),
    ),
    BlocProvider(
      create: (context) => RamBloc(),
    ),
    BlocProvider(
      create: (context) => CaseAccessoriesBloc(),
    ),
    BlocProvider(
      create: (context) => ProcessorBloc(),
    ),
    BlocProvider(
      create: (context) => MonitorBloc(),
    ),
    BlocProvider(
      create: (context) => StorageBloc(),
    ),
    BlocProvider(
      create: (context) => PowerSupplyBloc(),
    ),
    BlocProvider(
      create: (context) => CaseBloc(),
    ),
    BlocProvider(
      create: (context) => SavedBuildsBloc(),
    ),
    BlocProvider(
      create: (context) => ProcessorSelectionBloc(),
    ),


    BlocProvider(
      create: (context) => DrawerBloc(),
    ),
    BlocProvider(
      create: (context) => SearchBloc(),
    ),
    BlocProvider(
      create: (context) => ItemsSearchBloc(),
    ),
    BlocProvider(
      create: (context) => FavoriteBloc(  favoriteDataSourceUseCase: FavoriteDataSourceUseCase(
          favoriteDataSourceRepository: FavoriteDataSourceRepositoryImpl(
              favoriteDataSourceRepository: FavoriteDataSource()))
          ),
    ),
    BlocProvider(create: (_) => getIt<PostBloc>()..add(GetPostsEvent())),

  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Pc Recommendation',
      theme: ThemeData(primarySwatch: Colors.blue, textTheme: appTextTheme),
      home: _auth.currentUser != null? const BottomBarWrapper(): const OnboardingFirst(),
    );
  }
}
