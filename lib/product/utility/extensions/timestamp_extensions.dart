import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';

extension TimestampExtensions on Timestamp {
  String get convertDate => DateFormat('dd.MM.yyyy HH:mm').format(
        toDate(),
      );
}
