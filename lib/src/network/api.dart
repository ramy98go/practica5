
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practica5/src/models/rickandmorty_model.dart';

class  ApiRM {

  var URL = Uri.parse('https://rickandmortyapi.com/api/character');

  Future<List<RickAndMortyModel>?> getAllCaracter() async{
    final response = await http.get(URL);
    if( response.statusCode == 200){
      var popular = jsonDecode(response.body)['results'] as List;
      List<RickAndMortyModel> listPopular = popular.map((character) => RickAndMortyModel.fromMap(character)).toList();
      return listPopular;
    }else{
      return null;
    }

  }


}