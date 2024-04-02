import 'dart:convert';
import 'package:http/http.dart' as http;

class VillagerService {
  static const String baseUrl = 'http://your_api_base_url'; // Replace with your API base URL

  static Future<void> createVillager(Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse('$baseUrl/villagers'), body: json.encode(data), headers: {
      'Content-Type': 'application/json', // Set the content type as JSON
    });
    if (response.statusCode == 201) {
      print('Villager created successfully');
    } else {
      throw Exception('Failed to create villager');
    }
  }
}
