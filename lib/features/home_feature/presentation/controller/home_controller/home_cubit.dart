import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/developer_state_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> fetchStats() async {
    emit(HomeLoading());
    try {
      final doc = await FirebaseFirestore.instance
          .collection('developerStats')
          .doc('main')
          .get();

      final model = DeveloperStatsModel.fromJson(doc.data()!);
      emit(HomeSuccess(model));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
