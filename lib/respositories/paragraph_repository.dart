import 'package:chopper/chopper.dart';
import 'package:diction/apis/paragraph/paragraph_api.dart';
import 'package:diction/constants/api_constants.dart';

class ParagraphRepository {
  final ChopperClient chopper;

  ParagraphRepository()
      : chopper = ChopperClient(
          baseUrl: Uri.parse(APIConstants.paragraphBaseURL),
          services: [ParagraphService.create()],
        );

  Future<String?> fetchParagraph() async {
    final paragraphService = chopper.getService<ParagraphService>();
    final response = await paragraphService.getPragraph();
    if (response.isSuccessful) {
      // Successful request
      return response.body;
    } else {
      // Error code received from server
      // final error = response.error;
      return null;
    }
  }
}
