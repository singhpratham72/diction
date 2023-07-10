import 'package:chopper/chopper.dart';
import 'package:diction/constants/api_constants.dart';

part 'paragraph_api.chopper.dart';

@ChopperApi(baseUrl: APIConstants.paragraphBaseURL)
abstract class ParagraphService extends ChopperService {
  static ParagraphService create([ChopperClient? client]) =>
      _$ParagraphService(client);

  @Get(path: "paragraphs/1/4")
  Future<Response> getPragraph(
      // @Query('query') required String query,
      );
}
