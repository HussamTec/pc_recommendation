import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pc_recommendation/features/home/presentation/widgets/add_to_build_btn.dart';
import 'package:pc_recommendation/features/home/presentation/widgets/item_card.dart';
import '../../../favorite_list/domain/entities/favorite_entity.dart';
import '../../../favorite_list/presentation/state_management/fav_button_state_management/button_bloc.dart';
import '../../../favorite_list/presentation/state_management/favorite_bloc/favorite_bloc.dart';
import '../../../favorite_list/presentation/state_management/favorite_bloc/favorite_event.dart';
import '../../../favorite_list/presentation/state_management/widget/fav_btn_widget.dart';
import '../state_management/firebase_data_bloc/firebase_data_bloc.dart';
import '../state_management/firebase_data_bloc/firebase_data_states.dart';


class WebcamsScreen extends StatelessWidget {
  const WebcamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavButtonSelectionCubit bloc = FavButtonSelectionCubit();

    return Scaffold(
      backgroundColor: const Color(0xFF101B37),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text('Webcam', style: TextStyle(fontFamily: 'Schyler',
              fontWeight: FontWeight.bold, color: Colors.white),),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/svg_icons/blackBackButton.svg', height: 10,
              width: 10,
              color: Colors.white,),
          ),
        ),
        backgroundColor: const Color(0xFF101B37),
      ),
      body: BlocBuilder<FavButtonSelectionCubit, ButtonSelectionState>(
        bloc: bloc,
        builder: (context, state1) {
          return BlocBuilder<FirebaseDataSourceBloc, FirebaseDataSourceState>(
            builder: (context, state) {
              return state.when(
                initial: () => Container(),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (webcams) => ListView.builder(
                  itemCount: webcams!.length,
                  itemBuilder: (context, index) {
                    bloc.getFavoritesIds();
                    final isSelected =
                    state1.selectedIndices.contains(webcams[index].id);
                    final path = isSelected
                        ? 'assets/svg_icons/starSelected.svg'
                        : 'assets/svg_icons/starUnselected.svg';
                    return ItemCard(
                        objectName: webcams[index].name,
                        objectImageUrl: webcams[index]!.imageUrl,
                        objectSpecs: webcams[index]!.manufacturer,
                        objectPrice: webcams[index]!.price,
                        favBtn: FavBtn(isSelected: isSelected, path: path, onTap: () {
                          isSelected
                          //Remove item from favorites
                              ? context.read<FavoriteBloc>().add(
                              FavoriteEvent.removeFavorite(
                                  webcams[index]!.id))
                              : context.read<FavoriteBloc>().add(
                              FavoriteEvent.addFavorite(FavoriteEntity(
                                  name: webcams[index].name,
                                  id: webcams[index].id,
                                  manufacturer:
                                  webcams[index].manufacturer,
                                  price: webcams[index].price,
                                  imageUrl:
                                  webcams[index].imageUrl)));
                        },),
                        addingToBuildBtn: AddToBuildBtn(
                          addToBuildTap: () {},
                        ));
                  },
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
