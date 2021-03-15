import 'package:flutter_test/flutter_test.dart';
import 'package:getxtemplate/cores/core_services/service_local_storage.dart';

void main() {
  ServiceLocalStorage.init();
  test('put and get', () async {
    await ServiceLocalStorage(key: 'test').put(value: '{"id" : 1}');
    expect(await ServiceLocalStorage(key: 'test').get(), '{"id" : 1}');
  });

  test('delete', () async {
    await ServiceLocalStorage(key: 'test').put(value: '{"id" : 1}');
    expect(await ServiceLocalStorage(key: 'test').delete(), null);
  });

  test('put and get json', () async {
    await ServiceLocalStorage(key: 'test').put(value: {"id": 1}, isJson: true);

    Map<String, dynamic> jsonValue =
        await ServiceLocalStorage(key: 'test').get(isJson: true);

    expect(jsonValue['id'], 1);
  });
}
