// presentation/graphicCards/graphicCards_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/graphic_card_entity.dart';
import 'package:pc_recommendation/features/home/presentation/state_management/items_serach_bloc/items_search_bloc.dart';
import 'package:pc_recommendation/features/home/presentation/widgets/add_to_build_btn.dart';
import 'package:pc_recommendation/features/home/presentation/widgets/item_card.dart';
import '../../../../utils/url_launcher/url_launcher.dart';
import '../../../build/presentation/state_management/build_item_provider/build_bloc.dart';
import '../../../build/presentation/state_management/build_item_provider/build_event.dart';
import '../../../favorite_list/domain/entities/favorite_entity.dart';
import '../../../favorite_list/presentation/state_management/fav_button_state_management/button_bloc.dart';
import '../../../favorite_list/presentation/state_management/favorite_bloc/favorite_bloc.dart';
import '../../../favorite_list/presentation/state_management/favorite_bloc/favorite_event.dart';
import '../../../favorite_list/presentation/state_management/widget/fav_btn_widget.dart';
import '../state_management/firebase_data_bloc/firebase_data_bloc.dart';
import '../state_management/firebase_data_bloc/firebase_data_states.dart';
import '../widgets/search_bar_widget.dart';

class GraphicCardsScreen extends StatelessWidget {
  const GraphicCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavButtonSelectionCubit bloc = FavButtonSelectionCubit();
    final ItemsSearchBloc itemsSearchBloc = ItemsSearchBloc();
    final UrlLauncher urlLauncher = UrlLauncher();

    return Scaffold(
      backgroundColor: const Color(0xFF101B37),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
                color: const Color(0xFF17264D),
                height: 75,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/svg_icons/blackBackButton.svg',
                          height: 30,
                          width: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                      child: SizedBox(
                        height: 200,
                        width: 350,
                        child: Column(
                          children: [
                            SearchBarWidget(onChanged: (text) {
                              itemsSearchBloc.add(
                                  SearchTextChanged(text, 'graphic cards'));
                            }),
                            // Add spacing (optional)
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child:
              BlocBuilder<ItemsSearchBloc, ItemsSearchState>(
                  bloc: itemsSearchBloc,
                  builder: (context, state2) {
                    return
                      BlocBuilder<
                          FavButtonSelectionCubit,
                          ButtonSelectionState>(
                        bloc: bloc,
                        builder: (context, state1) {
                          if (state2 is SearchSuccess && state2 is !SearchInitial) {
                            return
                              BlocBuilder<ItemsSearchBloc, ItemsSearchState>(
                                bloc: itemsSearchBloc,
                                builder: (context, state2) {
                                  if (state2 is SearchInitial) {
                                    return const Center(
                                      child: Text(''),
                                    );
                                  } else if (state2 is SearchLoading) {
                                    return const Center(child: CircularProgressIndicator());
                                  } else if (state2 is SearchSuccess) {
                                    final searchedItems = state2.suggestions;
                                    return ListView.builder(
                                      shrinkWrap: false, // Wrap content vertically
                                      itemCount: searchedItems.length,
                                      itemBuilder: (context, index) {
                                        bloc.getFavoritesIds();
                                        final isSelected = state1
                                            .selectedIndices
                                            .contains( searchedItems[index]['id']);
                                        final path = isSelected
                                            ? 'assets/svg_icons/starSelected.svg'
                                            : 'assets/svg_icons/starUnselected.svg';
                                        // Use item data to populate ItemCard widget
                                        return GestureDetector(
                                          onTap: ()async{
                                            await urlLauncher.launchPage(searchedItems[index]['pageUrl']);

                                          },
                                          child: ItemCard(
                                            objectName: searchedItems[index]['name'],
                                            objectImageUrl: searchedItems[index]['imageUrl'],
                                            objectSpecs: searchedItems[index]['manufacturer'],
                                            objectPrice: searchedItems[index]['price'],
                                            favBtn:FavBtn(
                                              isSelected: isSelected,
                                              path: path,
                                              onTap: () {
                                                isSelected
                                                //Remove item from favorites
                                                    ? context.read<
                                                    FavoriteBloc>().add(
                                                    FavoriteEvent
                                                        .removeFavorite(
                                                        searchedItems[index]['id']))
                                                    : context.read<
                                                    FavoriteBloc>().add(
                                                    FavoriteEvent.addFavorite(
                                                        FavoriteEntity(
                                                            name:
                                                            searchedItems[index]['name'],
                                                            id: searchedItems[index]['id'],
                                                            manufacturer:
                                                            searchedItems[index]['manufacturer'],
                                                            price:searchedItems[index]['price'],
                                                            imageUrl:
                                                            searchedItems[index]['imageUrl'])));
                                              },
                                            ),
                                            addingToBuildBtn:AddToBuildBtn(
                                              addToBuildTap: () {
                                                context.read<GraphicCardBloc>().add(SelectGraphicCardEvent(GraphicCardEntity.fromMap( searchedItems[index])));
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return const MySvgDialog();
                                                  },
                                                );
                                              },),
                                          ),
                                        );
                                      },
                                    );
                                  } else if (state2 is SearchError) {
                                    return Center(
                                      child: Text('Error: ${state2.message}'),
                                    );
                                  } else {
                                    return const Center(child: Text('Unexpected state'));
                                  }
                                },
                              )   ;
                          } else {
                            return BlocBuilder<FirebaseDataSourceBloc,FirebaseDataSourceState>(
                              builder: (context, state) {
                                return state.when(
                                  initial: () => Container(),
                                  loading: () =>
                                  const Center(
                                      child: CircularProgressIndicator()),
                                  loaded: (graphicCards) =>
                                      BlocBuilder<GraphicCardBloc, dynamic>(
                                        builder: (context,selectedGraphicCard) {
                                          return ListView.builder(
                                            itemCount: graphicCards!.length,
                                            itemBuilder: (context, index) {
                                              bloc.getFavoritesIds();
                                              final isSelected = state1
                                                  .selectedIndices
                                                  .contains(graphicCards[index].id);
                                              final path = isSelected
                                                  ? 'assets/svg_icons/starSelected.svg'
                                                  : 'assets/svg_icons/starUnselected.svg';
                                              return GestureDetector(
                                                onTap: () async{
                                                  await urlLauncher.launchPage(graphicCards[index]!
                                                      .pageUrl,);
                                                },
                                                child: ItemCard(
                                                    objectName: graphicCards[index]
                                                        .name,
                                                    objectImageUrl: graphicCards[index]!
                                                        .imageUrl,
                                                    objectSpecs: graphicCards[index]!
                                                        .manufacturer,
                                                    objectPrice: graphicCards[index]!
                                                        .price,
                                                    favBtn: FavBtn(
                                                      isSelected: isSelected,
                                                      path: path,
                                                      onTap: () {
                                                        isSelected
                                                        //Remove item from favorites
                                                            ? context.read<
                                                            FavoriteBloc>().add(
                                                            FavoriteEvent
                                                                .removeFavorite(
                                                                graphicCards[index]!
                                                                    .id))
                                                            : context.read<
                                                            FavoriteBloc>().add(
                                                            FavoriteEvent.addFavorite(
                                                                FavoriteEntity(
                                                                    name:
                                                                    graphicCards[index]
                                                                        .name,
                                                                    id: graphicCards[index]
                                                                        .id,
                                                                    manufacturer:
                                                                    graphicCards[index]
                                                                        .manufacturer,
                                                                    price: graphicCards[index]
                                                                        .price,
                                                                    imageUrl:
                                                                    graphicCards[index]
                                                                        .imageUrl)));
                                                      },
                                                    ),
                                                    addingToBuildBtn: AddToBuildBtn(
                                                      addToBuildTap: () {
                                                        context.read<GraphicCardBloc>().add(SelectGraphicCardEvent(graphicCards[index]));
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            return const MySvgDialog();
                                                          },
                                                        );
                                                      },),),
                                              );
                                            },
                                          );
                                        }
                                      ),
                                  error: (message) =>
                                      Center(
                                        child: Text(message),
                                      ),
                                );
                              },
                            );                            }
        
                        },
                      );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}




class MySvgDialog extends StatelessWidget {
  const MySvgDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () => Navigator.pop(context));
    return Center(
        child:
        Container(
          height: 170,
          width: 300,
          decoration: BoxDecoration(
            color: const Color(0xFF101B37),
            borderRadius: BorderRadius.circular(30), // Adjust the value for desired roundness
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/svg_icons/added_to_build.svg',height: 80,
              width: 50,),
          ), // Replace with your SVG path

        )
    );
  }
}