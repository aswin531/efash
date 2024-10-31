abstract class HomeEvent{}

class FetchHomeDetails extends HomeEvent{}

class SearchProducts extends HomeEvent {
  final String query;
  SearchProducts(this.query);
}