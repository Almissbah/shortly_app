import 'package:shortly_app/data/remote/network_utils.dart';
import 'package:shortly_app/data/remote/resource.dart'; 
import 'package:test/test.dart';

import 'utils/retrofit_response_mock.dart';

void main() {
  var handler = RetrofitResponseHandler<String>();
  group('Test Retrofit response handler', () {
    test('should return server error', () async {
      var result = handler.handle(RetrofitReponseMocker.get500Response());

      result.then((value) {
        var isServerError = false;

        if (value is FailureResource<String, HttpError> && 
            (value.errorPayload) is HttpError) {
          isServerError = true;
        }
        expect(isServerError, true);
      });
    });
 
  });
}
