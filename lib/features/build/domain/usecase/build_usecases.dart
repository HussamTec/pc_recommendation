import '../../../home/domain/entities/browse_parts/graphic_card_entity.dart';
import '../repositories/build_repository.dart';

abstract class BuildUseCases{

 final BuildRepository buildRepository;
 const BuildUseCases({required this.buildRepository});
 GraphicCardEntity getGraphicCardCall(){
   return buildRepository.getGraphicCard();
 }

}