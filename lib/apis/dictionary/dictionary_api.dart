import 'package:chopper/chopper.dart';
import 'package:diction/constants/api_constants.dart';

part 'dictionary_api.chopper.dart';

@ChopperApi(baseUrl: APIConstants.dictionaryBaseURL)
abstract class DictionaryService extends ChopperService {
  static DictionaryService create([ChopperClient? client]) =>
      _$DictionaryService(client);

  @Get(path: "api/v2/entries/en/{word}")
  Future<Response> getMeaning(
    @Path('word') String word,
  );
}
