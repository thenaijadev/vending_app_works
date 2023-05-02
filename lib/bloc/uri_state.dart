part of 'uri_bloc.dart';

@immutable
abstract class UriState extends Equatable {
  @override
  List<Object> get props => [];
}

class UriInitial extends UriState {
  final List urlList;
  UriInitial(this.urlList);
  List get getLinks {
    return urlList;
  }
}

class NewUriState extends UriState {
  final List urlList;
  NewUriState(this.urlList);

  List get getLinks {
    return urlList;
  }
}
