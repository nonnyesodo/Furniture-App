import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart';

class HomeRepo {
  Future<StreamedResponse> makerequestToBgRemove(String imagePath) async {
    // Replace with your API key
    String apiKey = dotenv.env['BGRemoveApiKey'] ?? '';
    // Set up the API endpoint and headers
    String url = 'https://api.remove.bg/v1.0/removebg';
    var request = MultipartRequest('POST', Uri.parse(url));
    request.headers['X-Api-Key'] = apiKey;

    // Add the image file to the request
    request.files.add(
      MultipartFile.fromBytes(
        'image_file',
        await File(imagePath).readAsBytes(),
        filename: 'image.jpg',
        contentType: MediaType('image', 'jpg'),
      ),
    );

    // Add the size parameter to the request
    request.fields['size'] = 'auto';

    // Send the request
    return await request.send();
  }
}
