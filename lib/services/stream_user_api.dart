import 'package:chatdemo/services/api_service.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamUserApi {
  static Future createUser({
    String idUser,
    String username,
    String urlImage,
  }) async {
    final token = StreamApi.client.devToken(idUser);
    final user =
        User(id: idUser, extraData: {'name': username, 'image': urlImage});
    await StreamApi.client.setUser(user, token);
  }

  static Future login({String idUser}) async {
    final token = StreamApi.client.devToken(idUser);
    final user = User(id: idUser);
    await StreamApi.client.setUser(user, token);
  }
}
