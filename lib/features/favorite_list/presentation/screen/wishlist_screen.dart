import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../favorite_list/domain/entities/favorite_entity.dart';
import '../../../favorite_list/presentation/state_management/fav_button_state_management/button_bloc.dart';
import '../../../favorite_list/presentation/state_management/favorite_bloc/favorite_bloc.dart';
import '../../../favorite_list/presentation/state_management/favorite_bloc/favorite_event.dart';
import '../../../home/presentation/state_management/firebase_data_bloc/firebase_data_bloc.dart';
import '../../../home/presentation/state_management/firebase_data_bloc/firebase_data_states.dart';
import '../state_management/widget/fav_card_widget.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavButtonSelectionCubit bloc = FavButtonSelectionCubit();

    return Scaffold(
      backgroundColor: const Color(0xFF101B37),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 80),
          child: Text(
            'Wishlist',
            style: TextStyle(
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/svg_icons/blackBackButton.svg',
              height: 10,
              width: 10,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF101B37),
      ),
      body:BlocBuilder<FavButtonSelectionCubit, ButtonSelectionState>(
        bloc: bloc,
        builder: (context, state1) {
          return BlocBuilder<FirebaseDataSourceBloc, FirebaseDataSourceState>(
            builder: (context, state) {
              return state.when(
                initial: () => Container(),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (favItems) => ListView.builder(
                  itemCount: favItems!.length,
                  itemBuilder: (context, index) {
                    bloc.getFavoritesIds();
                    final isSelected =
                    state1.selectedIndices.contains(favItems[index].id);
                    final path = isSelected
                        ? 'assets/svg_icons/starGold.svg'
                        : 'assets/svg_icons/starGray.svg';
                    return FavCardWidget(imageUrl: favItems[index]!.imageUrl,
                        manufacturer: favItems[index]!.manufacturer,
                        name: favItems[index]!.name,
                        path: path,
                        price: favItems[index]!.price,
                    onTap: (){
                      isSelected
                      //Remove item from favorites
                          ? context.read<FavoriteBloc>().add(
                          FavoriteEvent.removeFavorite(
                              favItems[index]!.id))
                          : context.read<FavoriteBloc>().add(
                          FavoriteEvent.addFavorite(FavoriteEntity(
                              name: favItems[index].name,
                              id: favItems[index].id,
                              manufacturer:
                              favItems[index].manufacturer,
                              price: favItems[index].price,
                              imageUrl:
                              favItems[index].imageUrl)));
                    },);
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


