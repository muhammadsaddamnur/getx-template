import 'package:flutter_test/flutter_test.dart';
import 'package:getxtemplate/cores/core_services/service_convertion.dart';

void main() {
  test('int to rupiah', () async {
    expect(ServiceConvertion().currency(value: 10000), 'Rp. 10,000');
  });

  test('double to rupiah', () async {
    expect(ServiceConvertion().currency(value: 10000.0), 'Rp. 10,000');
  });

  test('string to rupiah', () async {
    expect(ServiceConvertion().currency(value: '10000'), 'Rp. 10,000');
  });

  test('N/A', () async {
    expect(ServiceConvertion().currency(value: 'N/A'), 'N/A');
  });
  test('null', () async {
    expect(ServiceConvertion().currency(value: null), null);
  });
}
