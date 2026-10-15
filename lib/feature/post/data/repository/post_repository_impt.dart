import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_practice_thetechbrothers/feature/post/data/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepositoryImpt {
  PostRepositoryImpt({http.Client? client}) : _client = client;

  final http.Client? _client;

  Future<List<PostModel>> fetchPost() async {
    try {
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/comments');
      final response = await (_client?.get(uri) ?? http.get(uri));

      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;

        return body.map((dynamic toElement) {
          return PostModel(
            postId: toElement['postId'] as int,
            id: toElement['id'] as int,
            name: toElement['name'] as String,
            email: toElement['email'] as String,
            body: toElement['body'] as String,
          );
        }).toList();
      }
      //throw Exception('Failed to fetch posts: ${response.statusCode}');
    } on SocketException catch (error, stackTrace) {
      Error.throwWithStackTrace(
        Exception('Unable to connect to the post service: $error'),
        stackTrace,
      );
    } on TimeoutException catch (error, stackTrace) {
      Error.throwWithStackTrace(
        Exception('Timed out while fetching posts: $error'),
        stackTrace,
      );
    }
    throw Exception(' Error while fetching data');
    //  catch(e){
    //    throw Exception(' Error while fetching data');
    //  }
  }
}
