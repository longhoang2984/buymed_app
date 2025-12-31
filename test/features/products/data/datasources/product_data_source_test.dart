import 'package:buymed_app/features/products/data/datasources/product_data_source.dart';
import 'package:buymed_app/features/products/data/models/product_model.dart';
import 'package:buymed_app/shared/network/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductApiClient extends Mock implements ProductApiClient {
  static List<Map<String, dynamic>> sample = [
    {
      "id": 1,
      "name": "Paracetamol 500mg",
      "price": 15000,
      "category": "Pain Relief",
      "isPrescription": false,
    },
    {
      "id": 2,
      "name": "Amoxicillin 500mg",
      "price": 45000,
      "category": "Antibiotic",
      "isPrescription": true,
    },
    {
      "id": 3,
      "name": "Vitamin C 1000mg",
      "price": 30000,
      "category": "Supplement",
      "isPrescription": false,
    },
    {
      "id": 4,
      "name": "Cetirizine 10mg",
      "price": 20000,
      "category": "Allergy",
      "isPrescription": false,
    },
  ];
}

void main() {
  late ProductDataSource dataSource;
  late ProductApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockProductApiClient();
    dataSource = ProductDataSourceImpl(client: mockApiClient);
  });

  test('Return data', () async {
    when(() => mockApiClient.get(any())).thenAnswer(
      (_) =>
          Future<List<Map<String, dynamic>>>.value(MockProductApiClient.sample),
    );

    List<ProductModel> result = await dataSource.getProducts();
    expect(result.length, MockProductApiClient.sample.length);
  });

  test('throw error', () async {
    when(() => mockApiClient.get(any())).thenThrow(Exception());

    expect(
      () async => await dataSource.getProducts(),
      throwsA(const TypeMatcher<Exception>()),
    );
  });
}
