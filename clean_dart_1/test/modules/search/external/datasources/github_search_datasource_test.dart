import 'dart:convert';

import 'package:clean_dart_1/modules/search/domain/entities/search_exception.dart';
import 'package:clean_dart_1/modules/search/external/datasources/github_search_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final source = GithubSearchDatasource(dio);

  test('successful getSearch should complete the future', () {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: responseData, statusCode: 200));
    final futureResult = source.getSearch('term');
    expect(futureResult, completes);
  });

  test('unsuccessful getSearch should throw SearchFailedException', () {
    when(dio.get(any)).thenAnswer((_) async => Response(statusCode: 401));
    final futureResult = source.getSearch('term');
    expect(futureResult, throwsA(isA<SearchFailedException>()));
  });

  test('exception on getSearch should throw the Exception', () {
    when(dio.get(any)).thenThrow(Exception());
    final futureResult = source.getSearch('term');
    expect(futureResult, throwsA(isA<Exception>()));
  });
}

final responseData = jsonDecode(githubJsonResult);

const githubJsonResult = """
{
  "total_count": 1,
  "incomplete_results": false,
  "items": [
    {
      "login": "gacordeiro-luizalabs",
      "id": 17988998,
      "node_id": "MDQ6VXNlcjE3OTg4OTk4",
      "avatar_url": "https://avatars1.githubusercontent.com/u/17988998?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/gacordeiro-luizalabs",
      "html_url": "https://github.com/gacordeiro-luizalabs",
      "followers_url": "https://api.github.com/users/gacordeiro-luizalabs/followers",
      "following_url": "https://api.github.com/users/gacordeiro-luizalabs/following{/other_user}",
      "gists_url": "https://api.github.com/users/gacordeiro-luizalabs/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/gacordeiro-luizalabs/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/gacordeiro-luizalabs/subscriptions",
      "organizations_url": "https://api.github.com/users/gacordeiro-luizalabs/orgs",
      "repos_url": "https://api.github.com/users/gacordeiro-luizalabs/repos",
      "events_url": "https://api.github.com/users/gacordeiro-luizalabs/events{/privacy}",
      "received_events_url": "https://api.github.com/users/gacordeiro-luizalabs/received_events",
      "type": "User",
      "site_admin": false,
      "score": 1.0
    }
  ]
}
""";
