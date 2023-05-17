import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

import 'user_list_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("USER LIST USING MOBX", () {
    test("get the user list api call", () async {
      final mockHTTPClient = MockClient();
      //when()
    });
  });
}
