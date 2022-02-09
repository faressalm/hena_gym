import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_states.dart';
import '../../data/repository/marekt_repo.dart';
import '../../data/services/market_services.dart';
import '../../utils/components.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitialState());
  MarketServicesRepository marketServicesRepository = MarketServicesRepository(
      marketServices: MarketServices(FirebaseFirestore.instance));
  static ProductCubit get(context) => BlocProvider.of(context);
  int quantity = 1;
  void incQuantity() {
    if (quantity == 10) {
      return;
    }
    quantity++;
    emit(ChangeQuantityState());
  }

  void decQuantity() {
    if (quantity == 1) {
      return;
    }
    quantity--;
    emit(ChangeQuantityState());
  }

  void addOrder(String address, String userPhone, String userName, String uid) {
    marketServicesRepository
        .addOrder(address, userPhone, userName, quantity, uid)
        .then((value) => {
              if (value)
                {showToast(text: "Order submitted", state: ToastStates.SUCCESS)}
              else
                {showToast(text: "try again later", state: ToastStates.ERROR)}
            });
  }
}
