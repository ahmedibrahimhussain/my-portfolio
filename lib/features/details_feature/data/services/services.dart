import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/details_model.dart';

class DetailsServices {
 static Future<DetailsModel?> fetchProject({required String projectId}) async {
    try {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance
              .collection('projects')
              .doc(projectId)
              .get();

      if (snapshot.exists) {
        return DetailsModel.fromMap(snapshot.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching project: $e');
    }
    return null;
  }
}
