// lib/presentation/screens/teaser/teaser_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mind_twist/presentation/screens/teaser/teaser_state.dart';

extension GroupByExtension<T> on List<T> {
  Map<K, List<T>> groupListsBy<K>(K Function(T) keyFunction) {
    final Map<K, List<T>> grouped = {};
    for (final element in this) {
      final key = keyFunction(element);
      grouped.update(key, (value) => [...value, element],
          ifAbsent: () => [element]);
    }
    return grouped;
  }
}

class TeaserCubit extends Cubit<TeaserState> {
  TeaserCubit() : super(TeaserStateInitial());

  Future<void> fetchTeasers() async {
    emit(TeaserStateLoading());
    try {
      final response =
          await http.get(Uri.parse('http://192.168.42.1:3000/api/teasers'));
      if (response.statusCode == 200) {
        final List<dynamic> teaserData = json.decode(response.body);
        final groupedTeasers =
            teaserData.groupListsBy((teaser) => teaser['category'] as String);
        emit(TeaserStateSuccess(categories: groupedTeasers.keys.toList()));
      } else {
        emit(TeaserStateFailure(message: 'Failed to load teasers'));
      }
    } catch (error) {
      emit(TeaserStateFailure(message: 'Error fetching teasers: $error'));
    }
  }

  @override
  Future<void> close() async {
    super.close();
  }
}
