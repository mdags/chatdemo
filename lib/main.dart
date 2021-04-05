import 'package:chatdemo/screens/home.dart';
import 'package:chatdemo/services/api_service.dart';
import 'package:chatdemo/services/stream_channel_api.dart';
import 'package:chatdemo/services/stream_user_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:uuid/uuid.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await StreamUserApi.createUser(
      idUser: Uuid().v4(),
      username: 'MD',
      urlImage:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Faremaconnect.com%2Fwp-content%2Fuploads%2F2013%2F03%2Fchat-1873536_1280-1080x675.png&imgrefurl=https%3A%2F%2Faremaconnect.com%2F2013%2F03%2Flive-chat-channel-research-findings%2F&tbnid=HwtopBRfaIQKdM&vet=12ahUKEwjMopWC4MruAhXcgM4BHXkBB8kQMygEegUIARCeAQ..i&docid=JOYmq9XMKy_9rM&w=1080&h=675&q=chat%20channel&ved=2ahUKEwjMopWC4MruAhXcgM4BHXkBB8kQMygEegUIARCeAQ');

  // await StreamChannelApi.createChannelWithUsers(
  //   name: 'My First Channel',
  //   urlImage:
  //       'https://www.google.com/imgres?imgurl=https%3A%2F%2Faremaconnect.com%2Fwp-content%2Fuploads%2F2013%2F03%2Fchat-1873536_1280-1080x675.png&imgrefurl=https%3A%2F%2Faremaconnect.com%2F2013%2F03%2Flive-chat-channel-research-findings%2F&tbnid=HwtopBRfaIQKdM&vet=12ahUKEwjMopWC4MruAhXcgM4BHXkBB8kQMygEegUIARCeAQ..i&docid=JOYmq9XMKy_9rM&w=1080&h=675&q=chat%20channel&ved=2ahUKEwjMopWC4MruAhXcgM4BHXkBB8kQMygEegUIARCeAQ',
  //   idMembers: [],
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Demo',
      debugShowCheckedModeBanner: false,
      home: StreamChat(
        client: StreamApi.client,
        child: ChannelsBloc(
          child: HomePage(),
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
