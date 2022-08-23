import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> createAlbum(startX, startY, targetX, targetY) async  {
  return  await http.post(
    Uri.parse('http://192.168.43.172:7777/set_geodata'),
    headers: <String, String>{
      'Content-Type': 'application/json'
    },
    body: jsonEncode(<String, String>{
      'point_start_x': startX,
      'point_start_y': startY,
      'point_target_x': targetX,
      'point_target_y': targetY
    }),
  );
  // return http.get(Uri.parse("http://192.168.43.172:7777/set_geodata"));
}