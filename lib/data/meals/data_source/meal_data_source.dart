import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:just_ready/config/database_config.dart';
import 'package:just_ready/data/meals/models/meal_dto.dart';

@injectable
class MealsDataSource {
  final FirebaseFirestore firestore;

  MealsDataSource(this.firestore);

  Future<String> addMeal(MealDto dto) async {
    final CollectionReference collection = firestore.collection(DatabaseCollections.meals);
    final DocumentReference documentReference = await collection.add(dto.toJson());
    await collection.doc(documentReference.id).update({'id': documentReference.id});
    return documentReference.id;
  }

  Future<void> editMeal(MealDto dto) async {
    final CollectionReference collection = firestore.collection(DatabaseCollections.meals);
    await collection.doc(dto.id).set(dto.toJson());
  }

  Future<void> deleteMeal(String mealId) async {
    final CollectionReference collection = firestore.collection(DatabaseCollections.meals);
    final documentReference = collection.doc(mealId);

    // await _deleteSubCollection(documentReference, DatabaseCollections.meals);

    await documentReference.delete();
  }

  Future<void> _deleteSubCollection(
    DocumentReference<Object?> documentReference,
    String collectionName,
  ) async =>
      documentReference.collection(collectionName).get().then(
            (collection) => collection.docs.forEach(
              (collectionDocument) => documentReference.collection(collectionName).doc(collectionDocument.id).delete(),
            ),
          );

  Future<List<MealDto>> getMeals() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firestore.collection(DatabaseCollections.meals).get();

    return snapshot.docs.map((docSnapshot) {
      Map<String, dynamic> data = docSnapshot.data();
      data['id'] = docSnapshot.id;
      return MealDto.fromJson(data);
    }).toList();
  }
}
