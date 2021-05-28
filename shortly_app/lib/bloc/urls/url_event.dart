 part of 'url_bloc.dart';
@immutable
abstract class UrlEvent {}

class ShortenUrlEvent extends UrlEvent{
  final String url;

  ShortenUrlEvent(this.url);
}

class GetStoredUrlsEvent extends UrlEvent{

}
