import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:just_ready/config/database_config.dart';
import 'package:just_ready/data/orders/models/order_dto.dart';

@injectable
class OrdersDataSource {
  final FirebaseFirestore firestore;

  OrdersDataSource(this.firestore);

  Future<int?> sendOrder(OrderDto dto) async {
    final CollectionReference collection = firestore.collection(DatabaseCollections.orders);
    await collection.doc(dto.number.toString()).set(dto.toJson());
    return dto.number;
  }

  Future<void> editOrder(OrderDto order, String eventId) async {
    final CollectionReference collection = firestore.collection(DatabaseCollections.orders);
    await collection.doc(eventId).set(order.toJson());
  }

  Future<void> deleteOrder(String orderId) async {
    final CollectionReference collection = firestore.collection(DatabaseCollections.orders);
    final documentReference = collection.doc(orderId);

    // await _deleteSubCollection(documentReference, DatabaseCollections.orders);

    await documentReference.delete();
  }

  // Future<void> _deleteSubCollection(
  //   DocumentReference<Object?> documentReference,
  //   String collectionName,
  // ) async =>
  //     documentReference.collection(collectionName).get().then(
  //           (collection) => collection.docs.forEach(
  //             (collectionDocument) => documentReference.collection(collectionName).doc(collectionDocument.id).delete(),
  //           ),
  //         );

  Future<List<OrderDto>> getOrders() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firestore.collection(DatabaseCollections.orders).get();

    return snapshot.docs.map((docSnapshot) {
      Map<String, dynamic> data = docSnapshot.data();
      return OrderDto.fromJson(data);
    }).toList();
  }
}
