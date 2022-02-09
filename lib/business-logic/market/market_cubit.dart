import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hena_gym/data/models/product.dart';
import 'package:hena_gym/data/repository/marekt_repo.dart';

import 'market_states.dart';

class MarketCubit extends Cubit<MarketState> {
  final MarketServicesRepository marketServicesRepository;
  List<Product>products  = [];
  List<Product>temp=[];
  MarketCubit({required this.marketServicesRepository}) : super(MarketInitial());
  bool search = false;
  static MarketCubit get(context) => BlocProvider.of(context);
  void getAllProducts() {
    marketServicesRepository.getAllProducts().then((value) {
      if(value !=null){
        products=value;
        temp=value;
        emit(SuccessShowedProductsState());
      }else{
        emit(ErrorShowingProducts());
      }
    });
  }
  void getFilteredProducts(String?val){
    if(val!=null){

      if(val.isEmpty){
        products=temp;
      }
      else{
        val.toLowerCase();
        products=products.where((element) => element.name.toLowerCase().startsWith(val)).toList();
      }
      emit(FilterDataSuccessfully());
    }
  }
  void changeSearchState(){
    search=!search;
    emit(ChangeSearchState());
  }
}