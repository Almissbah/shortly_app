part of 'url_bloc.dart';

@immutable
abstract class UrlState {}

class UrlInitial extends UrlState {}
class ShortenUrlLoading extends UrlState {}
class ShortenUrlFailed extends UrlState {}
class ShortenedUrlsList extends UrlState {
  final List<UrlData> urls;
  ShortenedUrlsList(this.urls);
}