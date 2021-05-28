part of 'url_bloc.dart';

@immutable
abstract class UrlEvent {
  Future<UrlState> excuteEvent(UrlsRepository repository);
}

class ShortenUrlEvent extends UrlEvent {
  final String url;

  ShortenUrlEvent(this.url);

  @override
  Future<UrlState> excuteEvent(UrlsRepository repository) async {
    var result = await repository.shortenUrl(ShortenUrlRequest(url: url));
    String failureMessage = "";
    if (result is SuccessResource) {
      await repository.storeUrlData(result.payload.urlData);
      return GetStoredUrlsEvent().excuteEvent(repository);
    }
    if (result is FailureResource) {
      failureMessage = (result as FailureResource).msg;
    }
    return ShortenUrlFailed(
        urls: repository.getCachedUrls(), msg: failureMessage);
  }
}

class DeleteStoredUrlEvent extends UrlEvent {
  final UrlData url;

  DeleteStoredUrlEvent(this.url);

  @override
  Future<UrlState> excuteEvent(UrlsRepository repository) async {
    await repository.deleteStoredUrl(url);
    return GetStoredUrlsEvent().excuteEvent(repository);
  }
}

class GetStoredUrlsEvent extends UrlEvent {
  @override
  Future<UrlState> excuteEvent(UrlsRepository repository) async {
    var result = await repository.getStoredUrlDatas();

    if (result is SuccessResource) {
      return ShortenedUrlsList(result.payload);
    }
    return ShortenUrlFailed();
  }
}
