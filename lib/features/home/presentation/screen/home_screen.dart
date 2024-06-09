import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pc_recommendation/features/auth/presentation/screen/signin_screen.dart';
import 'package:pc_recommendation/features/auth/presentation/state_management/auth_bloc.dart';
import 'package:pc_recommendation/features/build/presentation/screens/low_end_screen.dart';
import 'package:pc_recommendation/features/favorite_list/presentation/screen/wishlist_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/graphic_cards_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/power_supplies_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/processors_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/ram_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/saved_posts_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/speakers_screens.dart';
import 'package:pc_recommendation/features/home/presentation/screen/storage_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/thermal_pastes_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/webcams_screen.dart';
import 'package:pc_recommendation/utils/url_launcher/url_launcher.dart';
import '../../../auth/presentation/screen/profile_screen.dart';
import '../../../build/presentation/screens/high_end_screen.dart';
import '../../../build/presentation/screens/medium_end_screen.dart';
import '../../../build/presentation/screens/saved_builds_screen.dart';
import '../../../build/presentation/state_management/save_builds_bloc/saved_builds_bloc.dart';
import '../state_management/drawer_bloc/drawer_bloc.dart';
import '../state_management/firebase_data_bloc/firebase_data_bloc.dart';
import '../state_management/firebase_data_bloc/firebase_data_events.dart';
import '../state_management/home_search_bloc/home_search_bloc.dart';
import '../widgets/drawer_component_widget.dart';
import '../widgets/search_bar_widget.dart';
import 'case_accessories_screen.dart';
import 'case_fans_screen.dart';
import 'cases_screen.dart';
import 'external_storage_screen.dart';
import 'fan_controllers_screen.dart';
import 'headphones_screen.dart';
import 'keyboards_screen.dart';
import 'monitors_screen.dart';
import 'motherboards_screen.dart';
import 'mouse_pads_screen.dart';
import 'mouses_screen.dart';
import 'news_screen.dart';
import 'operating_systems_screen.dart';
import 'optical_drive_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final User? user = FirebaseAuth.instance.currentUser;
    final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
    final searchBloc = SearchBloc();
    final UrlLauncher urlLauncher = UrlLauncher();

    return MultiBlocProvider(
      providers: [
        BlocProvider<DrawerBloc>(create: (context) => DrawerBloc()),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        key: drawerKey,
        drawer: Drawer(
          // width: 100,
          backgroundColor: const Color(0xff101B37),
            child: DrawerComponentWidget(
              user: user,
              goToProfileTapped: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              savedBuildsTapped:(){
                BlocProvider.of<SavedBuildsBloc>(context).add(LoadSavedBuilds());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SavedBuildsScreen(),
                  ),
                );
              },
              wishlistTapped: () {
                context
                    .read<FirebaseDataSourceBloc>()
                    .add(const FirebaseDataSourceEvent.fetchFavItems());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WishlistScreen(),
                  ),
                );
              },
              contactUsTapped: () async {
                await urlLauncher.makePhoneCall('+201010858708');
              },
              facebookTapped: () async {
                await urlLauncher.launchPage('https://www.facebook.com');
              },
              instagramTapped: () async {
                await urlLauncher.launchPage('https://www.instagram.com');
              },
              twitterTapped: () async {
                await urlLauncher.launchPage('https://www.twitter.com/TechAdviso15214?t=jb0QrPKA-GiPz0UZvySXhA&s=08');
              },
              logoutTapped: () {
                authBloc.add(SignOutButtonPressed());
              }, savedPostsTapped: () {Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SavedPostsScreen(),
              ),
            );  },
            ),

        ),
        backgroundColor: const Color(0xff17264D),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(children: [
                Column(
                  children: [
                    Container(
                      color: const Color(0xFF101B37),
                      height: 110,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    drawerKey.currentState?.openDrawer();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'News',
                            style: TextStyle(
                              fontFamily: 'Schyler',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Image.asset('assets/images/newsImage.jpg'),
                          onTap: () {
                            context
                                .read<FirebaseDataSourceBloc>()
                                .add(const FirebaseDataSourceEvent.fetchNews());



                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NewsScreen(),
                              ),
                            );
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Our Top Picks',
                            style: TextStyle(
                              fontFamily: 'Schyler',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LowEndScreen(),
                                    ),
                                  );
                                },
                                child: SvgPicture.asset(
                                  'assets/svg_icons/lowEnd.svg',
                                  height: 100,
                                  width: 70,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MediumEndScreen(),
                                    ),
                                  );
                                },
                                child: SvgPicture.asset(
                                  'assets/svg_icons/mediumEnd.svg',
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: (){Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HighEndScreen(),
                                  ),
                                ); },
                                child: SvgPicture.asset(
                                  'assets/svg_icons/highEnd.svg',
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Browse Parts',
                            style: TextStyle(
                              fontFamily: 'Schyler',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        BrowsePartsCard(
                          onTapFirst: () {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchProcessors());


                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProcessorsScreen(),
                              ),
                            );
                          },
                          svgPathFirst: 'assets/svg_icons/processor.svg',
                          onTapSecond: () {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchGraphicCards());


                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const GraphicCardsScreen(),
                              ),
                            );
                          },
                          svgPathSecond: 'assets/svg_icons/graphicCard.svg',
                        ),
                        BrowsePartsCard(
                          onTapFirst: () {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchMotherboards());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MotherboardsScreen(),
                              ),
                            );
                          },
                          svgPathFirst: 'assets/svg_icons/motherboard.svg',
                          onTapSecond: () {
                            context
                                .read<FirebaseDataSourceBloc>()
                                .add(const FirebaseDataSourceEvent.fetchRAM());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RamScreen(),
                              ),
                            );
                          },
                          svgPathSecond: 'assets/svg_icons/ram.svg',
                        ),
                        BrowsePartsCard(
                          onTapFirst: () {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent.fetchStorage());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StorageScreen(),
                              ),
                            );
                          },
                          svgPathFirst: 'assets/svg_icons/storage.svg',
                          onTapSecond: () {
                            context
                                .read<FirebaseDataSourceBloc>()
                                .add(const FirebaseDataSourceEvent.fetchCase());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CasesScreen(),
                              ),
                            );
                          },
                          svgPathSecond: 'assets/svg_icons/case.svg',
                        ),
                        BrowsePartsCard(
                          onTapFirst: () {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent.fetchMonitors());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MonitorsScreen(),
                              ),
                            );
                          },
                          svgPathFirst: 'assets/svg_icons/monitor.svg',
                          onTapSecond: () {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchPowerSupplies());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PowerSuppliesScreen(),
                              ),
                            );
                          },
                          svgPathSecond: 'assets/svg_icons/power.svg',
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Accessories',
                            style: TextStyle(
                              fontFamily: 'Schyler',
                              fontSize: 27.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'main',
                            style: TextStyle(
                              fontFamily: 'Schyler',
                              fontSize: 25.0,
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 140,
                          width: 430,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FirebaseDataSourceBloc>()
                                              .add(const FirebaseDataSourceEvent
                                                  .fetchKeyboards());

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const KeyboardsScreen(),
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          'assets/svg_icons/keyboard.svg',
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FirebaseDataSourceBloc>()
                                              .add(const FirebaseDataSourceEvent
                                                  .fetchMouses());


                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const MousesScreen(),
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          'assets/svg_icons/mouse.svg',
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FirebaseDataSourceBloc>()
                                              .add(const FirebaseDataSourceEvent
                                                  .fetchHeadphones());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HeadphonesScreen(),
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          'assets/svg_icons/headphones.svg',
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FirebaseDataSourceBloc>()
                                              .add(const FirebaseDataSourceEvent
                                                  .fetchMousePads());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const MousePadsScreen(),
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          'assets/svg_icons/mousePad.svg',
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FirebaseDataSourceBloc>()
                                              .add(const FirebaseDataSourceEvent
                                                  .fetchExternalStorage());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ExternalStorageScreen(),
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          'assets/svg_icons/externalStorage.svg',
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FirebaseDataSourceBloc>()
                                              .add(const FirebaseDataSourceEvent
                                                  .fetchWebcams());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const WebcamsScreen(),
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          'assets/svg_icons/webcam.svg',
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FirebaseDataSourceBloc>()
                                              .add(const FirebaseDataSourceEvent
                                                  .fetchSpeakers());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SpeakersScreen(),
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          'assets/svg_icons/speakers.svg',
                                          height: 120,
                                          width: 120,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'others',
                            style: TextStyle(
                              fontFamily: 'Schyler',
                              fontSize: 25.0,
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 140,
                          width: 430,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FirebaseDataSourceBloc>()
                                              .add(const FirebaseDataSourceEvent
                                                  .fetchThermalPastes());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ThermalPastesScreen(),
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          'assets/svg_icons/thermalPaste.svg',
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FirebaseDataSourceBloc>()
                                              .add(const FirebaseDataSourceEvent
                                                  .fetchCaseAccessories());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const CaseAccessoriesScreen(),
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          'assets/svg_icons/caseAccessories.svg',
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FirebaseDataSourceBloc>()
                                              .add(const FirebaseDataSourceEvent
                                                  .fetchCaseFans());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const CaseFansScreen(),
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          'assets/svg_icons/caseFan.svg',
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FirebaseDataSourceBloc>()
                                              .add(const FirebaseDataSourceEvent
                                                  .fetchFanControllers());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const FanControllersScreen(),
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          'assets/svg_icons/fanController.svg',
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FirebaseDataSourceBloc>()
                                              .add(const FirebaseDataSourceEvent
                                                  .fetchOperatingSystems());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const OperatingSystemsScreen(),
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          'assets/svg_icons/operatingSystem.svg',
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FirebaseDataSourceBloc>()
                                              .add(const FirebaseDataSourceEvent
                                                  .fetchOpticalDrives());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const OpticalDriveScreen(),
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          'assets/svg_icons/opticalDrive.svg',
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ],
                    ),
                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthOutSuccess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        }
                      },
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthOutLoading) {
                            return const CircularProgressIndicator();
                          } else if (state is AuthOutFailure) {
                            return const Text('Sign out failed!');
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 40,
                  left: 55,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: SizedBox(
                      height: 250,
                      width: 400,
                      child: Column(
                        children: [
                          SearchBarWidget(onChanged: (text) {
                            searchBloc.add(SearchTextChanged(text));
                          }),
                          // Add spacing (optional)
                          SuggestionsList(searchBloc: searchBloc)
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class BrowsePartsCard extends StatelessWidget {
  final String svgPathFirst;
  final String svgPathSecond;
  final void Function() onTapFirst;
  final void Function() onTapSecond;

  const BrowsePartsCard({
    required this.onTapFirst,
    required this.onTapSecond,
    required this.svgPathFirst,
    required this.svgPathSecond,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: onTapFirst,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                svgPathFirst,
                height: 120,
                width: 120,
              ),
            ),
          ),
          GestureDetector(
            onTap: onTapSecond,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                  svgPathSecond,
                  height: 120,
                  width: 120),
            ),
          ),
        ],
      ),
    );
  }
}

class SuggestionsList extends StatelessWidget {
  final SearchBloc searchBloc;

  const SuggestionsList({super.key, required this.searchBloc});

  @override
  Widget build(BuildContext context) {
    List colors = [const Color(0xFF17264D), const Color(0xFF101B37)];
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: searchBloc,
      builder: (context, state) {
        if (state is SearchSuccess && state.suggestions.isNotEmpty) {
          return Container(
            height: 120,
            width: 310,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                // Adjust corner radius as needed
                bottomRight: Radius.circular(20.0),
              ),
              color: Color(0xFF101B37),
              border: Border(
                right: BorderSide(
                  color: Color(0xFF101B37), // Set your desired border color
                  width: 4.0, // // Set bottom border width (optional)
                ),
                left: BorderSide(
                  color: Color(0xFF101B37), // Set your desired border color
                  width: 4.0, // // Set bottom border width (optional)
                ),
                bottom: BorderSide(
                  color: Color(0xFF101B37), // Set your desired border color
                  width: 4.0, // // Set bottom border width (optional)
                ),
              ),
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true, // Wrap list content
              itemCount: state.suggestions.length,
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 310,
                    color: colors[index % colors.length],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          if (state.suggestions[index] == 'Motherboards') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchMotherboards());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MotherboardsScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] == 'Monitors') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent.fetchMonitors());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MonitorsScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] ==
                              'Case Accessories') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchCaseAccessories());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CaseAccessoriesScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] == 'Case Fans') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent.fetchCaseFans());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CaseFansScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] == 'Cases') {
                            context
                                .read<FirebaseDataSourceBloc>()
                                .add(const FirebaseDataSourceEvent.fetchCase());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CasesScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] ==
                              'External Storage') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchExternalStorage());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ExternalStorageScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] ==
                              'Fan Controllers') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchFanControllers());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const FanControllersScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] ==
                              'Graphic Cards') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchGraphicCards());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const GraphicCardsScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] == 'Headphones') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchHeadphones());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HeadphonesScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] == 'Keyboards') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent.fetchKeyboards());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const KeyboardsScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] == 'Mouse Pads') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent.fetchMousePads());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MousePadsScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] == 'Mouses') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent.fetchMouses());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MousesScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] == 'News') {
                            context
                                .read<FirebaseDataSourceBloc>()
                                .add(const FirebaseDataSourceEvent.fetchNews());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NewsScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] ==
                              'Operating Systems') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchOperatingSystems());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const OperatingSystemsScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] ==
                              'Optical Drives') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchOpticalDrives());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const OpticalDriveScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] ==
                              'Power Supplies') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchPowerSupplies());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PowerSuppliesScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] == 'Processors') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchProcessors());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProcessorsScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] == 'Ram') {
                            context
                                .read<FirebaseDataSourceBloc>()
                                .add(const FirebaseDataSourceEvent.fetchRAM());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RamScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] == 'Speakers') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent.fetchSpeakers());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SpeakersScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] == 'Storage') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent.fetchStorage());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StorageScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] ==
                              'Thermal Pastes') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent
                                    .fetchThermalPastes());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ThermalPastesScreen(),
                              ),
                            );
                          } else if (state.suggestions[index] == 'Webcams') {
                            context.read<FirebaseDataSourceBloc>().add(
                                const FirebaseDataSourceEvent.fetchWebcams());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WebcamsScreen(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          state.suggestions[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox(); // Handle other states (optional)
        }
      },
    );
  }
}
