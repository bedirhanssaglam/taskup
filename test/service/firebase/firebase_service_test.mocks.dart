// Mocks generated by Mockito 5.4.4 from annotations
// in task_management/test/service/firebase/firebase_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:task_management/product/base/model/base_firebase_model.dart'
    as _i4;
import 'package:task_management/product/service/base/firebase_service.dart'
    as _i2;
import 'package:task_management/product/utility/enums/collection_paths.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [FirebaseService].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockFirebaseService extends _i1.Mock implements _i2.FirebaseService {
  MockFirebaseService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<T>> getList<T extends _i4.BaseFirebaseModel<T>>(
    _i5.CollectionPaths? collectionPath,
    T? model,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getList,
          [
            collectionPath,
            model,
          ],
        ),
        returnValue: _i3.Future<List<T>>.value(<T>[]),
      ) as _i3.Future<List<T>>);

  @override
  _i3.Future<void> add<T extends _i4.BaseFirebaseModel<T>>(
    _i5.CollectionPaths? collectionPath,
    T? model,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #add,
          [
            collectionPath,
            model,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
