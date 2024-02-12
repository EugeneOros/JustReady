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
    await collection.doc(dto.number.toString()).set(dto.toJson());
    return dto.number.toString();
  }

  Future<void> editMeal(MealDto dto, int oldNumber) async {
    if (dto.number != oldNumber) await deleteMeal(oldNumber);
    final CollectionReference collection = firestore.collection(DatabaseCollections.meals);
    await collection.doc(dto.number.toString()).set(dto.toJson());
  }

  Future<void> deleteMeal(int mealNumber) async {
    final CollectionReference collection = firestore.collection(DatabaseCollections.meals);
    final documentReference = collection.doc(mealNumber.toString());

    // await _deleteSubCollection(documentReference, DatabaseCollections.meals);

    await documentReference.delete();
  }

  Future<List<MealDto>> getMeals() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firestore.collection(DatabaseCollections.meals).get();

    return snapshot.docs.map((docSnapshot) {
      Map<String, dynamic> data = docSnapshot.data();
      return MealDto.fromJson(data);
    }).toList();
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
}
