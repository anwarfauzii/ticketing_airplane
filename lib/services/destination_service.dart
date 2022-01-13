import '../models/destination_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService{
  final CollectionReference _destinationReference = FirebaseFirestore.instance.collection('destination');
  Future<List<DestinationModel>> fetchDestination()async{
    try {
     QuerySnapshot result = await _destinationReference.get();

     List<DestinationModel> destination = result.docs.map(
       (e) {
         return DestinationModel.fromJson(e.id, e.data() as Map<String, dynamic>);
       },).toList();

       return destination;
    } catch (e) {
      rethrow;
    }
  }
}