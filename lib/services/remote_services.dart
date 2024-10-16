import '../model/post_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<Post>?> getPosts() async {
    try {
      var client = http.Client();

      var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

      var response = await client.get(uri);
      print('------Response api $response');
      if (response.statusCode == 200) {
        var json = response.body;
        print('------Response json $json');
        print(postFromJson(json));
        return postFromJson(json);
      }
    } catch (e) {
      print('====== error to get data from api $e');
      return null;
    }
  }
}
