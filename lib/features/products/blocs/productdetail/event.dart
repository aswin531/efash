abstract class ProductDetailsEvent {}

class FetchProductDetailsEvent extends ProductDetailsEvent {
  final String slug;

  FetchProductDetailsEvent(this.slug);
}
