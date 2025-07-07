abstract class SearchEvent {}

class SearchText extends SearchEvent {
  final String query;
  SearchText(this.query);
}
