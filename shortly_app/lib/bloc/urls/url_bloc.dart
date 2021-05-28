import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart'; 
import 'package:meta/meta.dart';
import 'package:shortly_app/data/remote/model/shorten_url_response.dart';
 
part 'url_state.dart';
part 'url_event.dart';
 
 @lazySingleton
class UrlBloc extends Bloc<UrlEvent, UrlState> {
  UrlBloc() : super();
  @override
  UrlState get initialState =>
      UrlInitial();
  @override
  Stream<UrlState> mapEventToState(
    UrlEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
