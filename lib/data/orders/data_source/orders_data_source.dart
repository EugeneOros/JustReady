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

  Future<void> editOrder(OrderDto dto, int oldNumber) async {
    if (dto.number != oldNumber) await deleteOrder(oldNumber);
    final CollectionReference collection = firestore.collection(DatabaseCollections.orders);
    await collection.doc(dto.number.toString()).set(dto.toJson());
  }

  Future<void> deleteOrder(int number) async {
    final CollectionReference collection = firestore.collection(DatabaseCollections.orders);
    final documentReference = collection.doc(number.toString());

    await documentReference.delete();
  }

  Future<void> addToDeletedOrders(OrderDto dto) async {
    final CollectionReference collection = firestore.collection(DatabaseCollections.deletedOrders);
    await collection.doc(dto.number.toString() + DateTime.now().toUtc().toString()).set(dto.toJson());
  }

  Future<List<OrderDto>> getOrders() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firestore.collection(DatabaseCollections.orders).get();

    return snapshot.docs.map((docSnapshot) {
      Map<String, dynamic> data = docSnapshot.data();
      return OrderDto.fromJson(data);
    }).toList();
  }

  Stream<List<OrderDto>> orders() async* {
    final collection = firestore.collection(DatabaseCollections.orders).snapshots();
    await for (final snapshots in collection) {
      yield snapshots.docs.map((order) => OrderDto.fromJson(order.data())).toList(growable: false);
    }
  }

  Future<List<OrderDto>> getDeletedOrders() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firestore.collection(DatabaseCollections.deletedOrders).get();

    return snapshot.docs.map((docSnapshot) {
      Map<String, dynamic> data = docSnapshot.data();
      return OrderDto.fromJson(data);
    }).toList();
  }

  Stream<List<OrderDto>> deletedOrders() async* {
    final collection = firestore.collection(DatabaseCollections.deletedOrders).snapshots();
    await for (final snapshots in collection) {
      yield snapshots.docs.map((order) => OrderDto.fromJson(order.data())).toList(growable: false);
    }
  }

  Future<int> getOrderCounter() async {
    final doc = await firestore
        .collection(DatabaseCollections.config)
        .doc(DatabaseDocuments.orderCounter)
        .get();
    if (!doc.exists || doc.data() == null) return 1;
    return (doc.data()!['value'] as int?) ?? 1;
  }

  Future<void> setOrderCounter(int value) async {
    await firestore
        .collection(DatabaseCollections.config)
        .doc(DatabaseDocuments.orderCounter)
        .set({'value': value});
  }
}
