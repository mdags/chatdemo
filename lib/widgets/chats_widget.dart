import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final idUser = StreamChat.of(context).user.id;

    return ChannelListView(
      filter: {
        'member': {
          '\$in': [idUser],
        }
      },
      sort: [SortOption('last_message_at')],
      pagination: PaginationParams(limit: 20),
    );
  }
}
