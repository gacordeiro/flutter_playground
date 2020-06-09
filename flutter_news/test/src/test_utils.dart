import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';

MockClient clientRespondsWith(dynamic body, [code = 200]) => MockClient((request) async => successWith(body, code));

MockClient clientFailsWith(dynamic error, [code = 400]) => MockClient((request) async => failWith(error, code));

Response failWith(dynamic error, [code = 400]) => Response(json.encode(error), code);

Response successWith(dynamic body, [code = 200]) => Response(json.encode(body), code);
