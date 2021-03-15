import 'package:flutter_test/flutter_test.dart';
import 'package:getxtemplate/cores/core_services/service_api.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

@GenerateMocks([http.Client])
void main() async {
  test('Request Successed', () async {
    final client = MockClient();
    when(client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    )).thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

    expect(
        await ServiceApi(
                client: client,
                method: Method.get,
                endpoint: 'posts/1',
                timeout: 60)
            .hit(),
        '{"title": "Test"}');
  });
}
