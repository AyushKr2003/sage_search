import 'dart:async';
import 'dart:convert';

import 'package:web_socket_client/web_socket_client.dart';

class ChatWebSocket {
  static final _instance = ChatWebSocket._internal();
  WebSocket? _socket;

  factory ChatWebSocket() => _instance;
  ChatWebSocket._internal();
  final _searchResultController = StreamController<Map<String, dynamic>>();
  final _contentController = StreamController<Map<String, dynamic>>();

  Stream<Map<String, dynamic>> get searchResultStream =>
      _searchResultController.stream;
  Stream<Map<String, dynamic>> get contentStream => _contentController.stream;

  void connect() {
    _socket = WebSocket(Uri.parse('ws://localhost:8000/ws/chats'));

    _socket!.messages.listen((message) {
      final data = jsonDecode(message);
      if (data['type'] == 'search_result') {
        _searchResultController.add(data);
      } else if (data['type'] == 'content') {
        _contentController.add(data);
      }
    });
  }

  void chat(String query) {
    _socket!.send(jsonEncode({'query': query}));
  }

  void close() {
    _socket!.close();
  }
}
