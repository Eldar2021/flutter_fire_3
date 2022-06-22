import 'package:cloud_firestore/cloud_firestore.dart';

class FStoreClient {
  static FStoreClient? _instance;
  static FStoreClient instance(FirebaseFirestore firestore) {
    _instance ??= FStoreClient._init(firestore);
    return _instance!;
  }

  FStoreClient._init(this.firestore);

  final FirebaseFirestore firestore;

  
}
