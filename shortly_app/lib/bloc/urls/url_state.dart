part of 'url_bloc.dart';

@immutable
abstract class UrlState {}

class UrlInitial extends UrlState {}
class ShortenUrlLoading extends UrlState {}
class ShortenUrlFailed extends UrlState {
    final List<UrlData> urls;
    final String msg;
  ShortenUrlFailed({this.urls, this.msg});
}
class ShortenedUrlsList extends UrlState {
  final List<UrlData> urls;
  ShortenedUrlsList(this.urls);
}