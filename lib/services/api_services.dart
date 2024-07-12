import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class ApiService {
  final String baseUrl = "https://dog.ceo/api/breeds/image";

  Future<List<Pokemon>> fetchPokemonList() async {
    final response = await http.get(Uri.parse('$baseUrl/random'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];
      return results.map((e) => Pokemon.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }
}