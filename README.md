# buymed_app

A Flutter example app (BuyMed) demonstrating a small product catalogue with a layered architecture.

**Project Snapshot**
- **Framework:** Flutter
- **State management / DI:** GetX (`get` package)
- **Architecture:** Feature-based with Domain, Data and Presentation layers (usecases + repositories)
- **Dart SDK constraint:** ^3.8.1 (see `pubspec.yaml`)

To see the exact Flutter SDK installed on your machine run:

```bash
flutter --version
```

**How to run**
- Install dependencies: `flutter pub get`
- Run on a device or simulator: `flutter run -d <device-id>`
- Run tests: `flutter test`

**What I used / choices**
- UI framework: Flutter (Material widgets)
- State management: GetX (`get`) used for simple routing/state and DI convenience
- Pattern: Clean-ish layered approach (features -> domain -> data -> presentation). Repositories expose interfaces in `domain` and implementations live in `data`.

**Trade-offs & possible improvements**
- Tests: Add Unit-test, UI Test, Integration Test.
- Dependency injection: `Get` works, but for larger apps I'd prefer `get_it` + `injectable` for clearer separation and easier testing.
- Models: Consider using `freezed` + `json_serializable` for immutable value types, equality, and safe copyWith.
- Error handling: Centralize network/error mapping and add retry/caching layers (e.g., Hive or local DB) for offline support.
- CI: Add GitHub Actions to run `flutter analyze` and `flutter test` on PRs.
- Performance: Add pagination/lazy loading for large product lists and avoid rebuilding large widget subtrees.

**Files of interest**
- Domain usecase: [lib/features/products/domain/usecases/get_products_usecase.dart](lib/features/products/domain/usecases/get_products_usecase.dart#L1-L50)
- Repository interface: [lib/features/products/domain/repositories/product_repository.dart](lib/features/products/domain/repositories/product_repository.dart#L1-L30)
- Presentation pages: [lib/features/products/presentation/pages/page.dart](lib/features/products/presentation/pages/page.dart#L1-L200)

