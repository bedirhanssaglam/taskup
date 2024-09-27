import 'package:cloud_firestore/cloud_firestore.dart';

class GeoParser {
  const GeoParser._();

  // JSON'dan GeoPoint oluşturma
  static GeoPoint fromJsonGeoPoint(Map<String, dynamic> geoPoint) {
    return GeoPoint(
      geoPoint['latitude'] as double,
      geoPoint['longitude'] as double,
    );
  }

  // GeoPoint'i JSON'a dönüştürme
  static Map<String, dynamic> toJsonGeoPoint(GeoPoint geoPoint) {
    return {
      'latitude': geoPoint.latitude,
      'longitude': geoPoint.longitude,
    };
  }
}
