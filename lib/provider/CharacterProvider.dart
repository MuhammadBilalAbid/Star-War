import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:star_wars/model/CharacterModel.dart';
import 'package:star_wars/utilis/App_Api.dart';

class CharacterProvider with ChangeNotifier {
  List<Character> _character = [];
  bool _isLoading = true;

  List<Character> get character => _character;
  bool get isLoading => _isLoading;

  CharacterProvider() {
    fetchCharacter();
  }

  Future<void> fetchCharacter() async {
    try {
      Map<String, dynamic> header = {
        'Accept': 'application/json',
        'Device-ID': '12345',
      };
      final response = await Dio().get(
        ApiLinks.getCharacter,
        options: Options(headers: header),
      );

      PeopleResponse responseData = PeopleResponse.fromJson(response.data);
      _character = responseData.results;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print('Error fetching persons: $error');
      _isLoading = false;
      notifyListeners();
    }
  }
}
