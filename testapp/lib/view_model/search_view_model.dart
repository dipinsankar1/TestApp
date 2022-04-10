import 'package:intl/intl.dart';
import 'package:testapp/model/searchmodel.dart';

class SearchViewModel {
  final Event search;
  SearchViewModel({required this.search});
  String get title {
    return search.title;
  }

  String get poster {
    return search.posterUrl;
  }

  String get eventImages {
    return search.performers.first.images.huge;
  }

  String get displaydate {
    final DateFormat formatter = DateFormat('EEE, dd MMM yyyy hh:mm aaa');
    final String formattedDate = formatter.format(search.createdAt);
    return formattedDate;
  }

  String get displayLocation {
    return search.venue.displayLocation;
  }
}
