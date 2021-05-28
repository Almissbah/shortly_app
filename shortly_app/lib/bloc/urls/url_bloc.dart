import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart'; 
import 'package:meta/meta.dart';
import 'package:shortly_app/data/remote/model/shorten_url_request.dart';
import 'package:shortly_app/data/remote/model/shorten_url_response.dart';
import 'package:shortly_app/data/remote/resource.dart';
import 'package:shortly_app/data/repo/urls_repo.dart';
 
part 'url_state.dart';
part 'url_event.dart';
 
 @lazySingleton
class UrlBloc extends Bloc<UrlEvent, UrlState> {
  final UrlsRepository _urlsRepository;
  UrlBloc(this._urlsRepository) : super();
  
  @override
  UrlState get initialState =>
      UrlInitial();
  @override
  Stream<UrlState> mapEventToState(
    UrlEvent event,
  ) async* {
    yield ShortenUrlLoading();
    yield await event.excuteEvent(_urlsRepository);
  }

  void shortUrl(String url) {
    add(ShortenUrlEvent(url));
  }

  void getStoredUrls(){
    add(GetStoredUrlsEvent());
  }

  void delete(UrlData url) {
    add(DeleteStoredUrlEvent(url));
  }
}
