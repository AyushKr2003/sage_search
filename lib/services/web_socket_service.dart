import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web_socket_client/web_socket_client.dart';

class ChatWebSocket {
  static final _instance = ChatWebSocket._internal();
  WebSocket? _socket;
  bool _isConnected = false;

  factory ChatWebSocket() => _instance;
  ChatWebSocket._internal();
  final _searchResultController =
      StreamController<Map<String, dynamic>>.broadcast();
  final _contentController = StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get searchResultStream =>
      _searchResultController.stream;
  Stream<Map<String, dynamic>> get contentStream => _contentController.stream;

  void connect() {
    // Close any existing connection first
    if (_isConnected) {
      close();
    }

    String url = dotenv.env['BACKEND_URL'] ?? 'url not found';
    _socket = WebSocket(Uri.parse(url));
    _isConnected = true;
    print("Socket connected");

    _socket!.messages.listen((message) {
      final data = jsonDecode(message);
      if (data['type'] == 'search_result') {
        _searchResultController.add(data);
      } else if (data['type'] == 'content') {
        _contentController.add(data);
      }
    }, onDone: () {
      _isConnected = false;
      print("WebSocket connection closed");
    }, onError: (error) {
      _isConnected = false;
      print("WebSocket error: $error");
    });
  }

  void chat(String query) {
    // Always reconnect for a fresh connection
    connect();
    _socket!.send(jsonEncode({'query': query}));
  }

  void close() {
    if (_isConnected) {
      _socket!.close();
      _isConnected = false;
    }
  }

  bool get isConnected => _isConnected;
}
