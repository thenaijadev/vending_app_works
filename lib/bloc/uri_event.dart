part of 'uri_bloc.dart';

@immutable
abstract class UriEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeLinkEvent extends UriEvent {
  ChangeLinkEvent(this._url, this._index, this._presentList);
  final String _url;
  final int _index;
  final List _presentList;
  @override
  List<Object> get props => [_url, _index, _presentList];
}
