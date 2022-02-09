
abstract class MarketState {}

class MarketInitial extends MarketState {}
class SuccessShowedProductsState extends MarketState{}
class ErrorShowingProducts extends MarketState{}
class ChangeSearchState extends MarketState{}
class FilterDataSuccessfully extends MarketState{}