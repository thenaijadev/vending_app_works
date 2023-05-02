import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vending_app_poc/utilities/models/Url.dart';

part 'uri_event.dart';
part 'uri_state.dart';

class UriBloc extends Bloc<UriEvent, UriState> {
  UriBloc() : super(UriInitial(URLs.urlList)) {
    on<UriEvent>((
      event,
      emit,
    ) {
      if (event is ChangeLinkEvent) {
        List newList = event._presentList;
        newList[event._index] = event._url;
        emit(NewUriState(newList));
      }
    });
  }
}
