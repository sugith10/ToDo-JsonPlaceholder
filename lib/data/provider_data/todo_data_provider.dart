import 'package:http/http.dart' as http;

final class TodoDataProvider {
  Future<String> getTodo() async {
    const String apiKey = 'https://jsonplaceholder.typicode.com/todos';
    final Uri uri = Uri.parse(apiKey);
    try {
      final response = await http.get(uri);
      if(response.statusCode != 200){
        throw 'Something went wrong';
      }
      return response.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
