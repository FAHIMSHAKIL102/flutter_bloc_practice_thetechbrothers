import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/post/data/repository/post_repository_impt.dart';
import 'package:http/testing.dart';

void main() {
  test('includes the socket error details when fetching posts fails', () async {
    final repository = PostRepositoryImpt(
      client: MockClient((_) async {
        throw SocketException(
          'Failed host lookup: jsonplaceholder.typicode.com',
        );
      }),
    );

    await expectLater(
      repository.fetchPost(),
      throwsA(
        isA<Exception>().having(
          (error) => error.toString(),
          'message',
          contains('Failed host lookup'),
        ),
      ),
    );
  });
}
