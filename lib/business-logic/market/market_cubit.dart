import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hena_gym/data/models/product.dart';
import 'package:hena_gym/data/repository/marekt_repo.dart';

import 'market_states.dart';

class MarketCubit extends Cubit<MarketState> {
  final MarketServicesRepository marketServicesRepository;
  List<Product>products  = [];
  MarketCubit({required this.marketServicesRepository}) : super(MarketInitial());

  static MarketCubit get(context) => BlocProvider.of(context);
  void getAllProducts() {
    marketServicesRepository.getAllProducts().then((value) {
      if(value !=null){
        products=value;
        emit(SuccessShowedProductsState());
      }else{
        emit(ErrorShowingProducts());
      }
    });
  }
}