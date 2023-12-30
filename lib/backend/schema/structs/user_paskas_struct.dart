// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserPaskasStruct extends FFFirebaseStruct {
  UserPaskasStruct({
    String? email,
    String? displayName,
    String? photoUrl,
    String? phoneNumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _email = email,
        _displayName = displayName,
        _photoUrl = photoUrl,
        _phoneNumber = phoneNumber,
        super(firestoreUtilData);

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;
  bool hasPhoneNumber() => _phoneNumber != null;

  static UserPaskasStruct fromMap(Map<String, dynamic> data) =>
      UserPaskasStruct(
        email: data['email'] as String?,
        displayName: data['display_name'] as String?,
        photoUrl: data['photo_url'] as String?,
        phoneNumber: data['phone_number'] as String?,
      );

  static UserPaskasStruct? maybeFromMap(dynamic data) => data is Map
      ? UserPaskasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'display_name': _displayName,
        'photo_url': _photoUrl,
        'phone_number': _phoneNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserPaskasStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserPaskasStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        photoUrl: deserializeParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserPaskasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserPaskasStruct &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([email, displayName, photoUrl, phoneNumber]);
}

UserPaskasStruct createUserPaskasStruct({
  String? email,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserPaskasStruct(
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
      phoneNumber: phoneNumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserPaskasStruct? updateUserPaskasStruct(
  UserPaskasStruct? userPaskas, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userPaskas
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserPaskasStructData(
  Map<String, dynamic> firestoreData,
  UserPaskasStruct? userPaskas,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userPaskas == null) {
    return;
  }
  if (userPaskas.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userPaskas.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userPaskasData = getUserPaskasFirestoreData(userPaskas, forFieldValue);
  final nestedData = userPaskasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userPaskas.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserPaskasFirestoreData(
  UserPaskasStruct? userPaskas, [
  bool forFieldValue = false,
]) {
  if (userPaskas == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userPaskas.toMap());

  // Add any Firestore field values
  userPaskas.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserPaskasListFirestoreData(
  List<UserPaskasStruct>? userPaskass,
) =>
    userPaskass?.map((e) => getUserPaskasFirestoreData(e, true)).toList() ?? [];
