import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:rosseti/top_bar.dart';

import 'Response.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  var size, height, width;
  final controller = MapController(
    location: const LatLng(55.1425, 61.5396),
  );
  List lst = [];
  String startX = '55.09';
  String startY = '61.25';
  String targetX = '0';
  String targetY = '0';
  void _gotoDefault() {
    controller.center = const LatLng(55.09, 61.25);
    setState(() {});
  }

  double clamp(double x, double min, double max) {
    if (x < min) x = min;
    if (x > max) x = max;

    return x;
  }

  void _onDoubleTap(MapTransformer transformer, Offset position) {
    const delta = 0.5;
    final zoom = clamp(controller.zoom + delta, 2, 18);

    transformer.setZoomInPlace(zoom, position);
    setState(() {});
  }



  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details, MapTransformer transformer) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      transformer.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  String name = ""; //user's response will be assigned to this variable


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 70),
        child: TopBarContents()),
      body: MapLayout(
        controller: controller,
        builder: (context, transformer) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onDoubleTapDown: (details) =>
                  _onDoubleTap(
                    transformer,
                    details.localPosition,
                  ),
              onScaleStart: _onScaleStart,
              onScaleUpdate: (details) => _onScaleUpdate(details, transformer),
              child: Listener(
                behavior: HitTestBehavior.opaque,
                onPointerSignal: (event) {
                  if (event is PointerScrollEvent) {
                    final delta = event.scrollDelta.dy / -1000.0;
                    final zoom = clamp(controller.zoom + delta, 2, 18);
                    transformer.setZoomInPlace(zoom, event.localPosition);
                    print(event.localPosition);
                    setState(() {});
                  }
                },
                child: Stack(
                  children: <Widget>[
                    Center(
                      child:
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: Image.asset('assets/point.png'),
                      ),


                    ),
                    TileLayer(
                      builder: (context, x, y, z) {
                        //x = 23;
                        //y = 12;
                        //z = 5;
                        //print(x.toString()+' '+ y.toString()+ ' '+ z.toString());
                        //print(MapController(location: (LatLng(55.68, 61.41),   double zoom = 14,   Projection projection = const EPSG4326())));
                        //print(controller.center.latitude.toString() + " " + controller.center.longitude.toString());
                        final url =
                            'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';
                        return CachedNetworkImage(
                          imageUrl: url,
                          fit: BoxFit.cover,);
                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                    child: SizedBox(

                                      width: 200,
                                      height: 100,
                                      child: ElevatedButton(onPressed: () async {
                                        //Navigator.pushNamedAndRemoveUntil(context,'/categories',(route)=> true);
                                        // await createAlbum(MainPageState().startX,startY,targetX,targetY);
                                        /*
                                        POST /set_geodata HTTP/1.1
                                        Accept: * / * (убрать пробел перед и после /)
                                        Accept-Encoding: gzip, deflate, br
                                        Accept-Language: ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7
                                        Connection: keep-alive
                                        Content-Length: 0
                                        Content-Type: application/x-www-form-urlencoded
                                        Host: 127.0.0.1:7777
                                        Origin: http://127.0.0.1:7777
                                        Referer: http://127.0.0.1:7777/set_geodata
                                        Sec-Fetch-Dest: empty
                                        Sec-Fetch-Mode: cors
                                        Sec-Fetch-Site: same-origin
                                        User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.102 Safari/537.36
                                        sec-ch-ua: "Chromium";v="104", " Not A;Brand";v="99", "Google Chrome";v="104"
                                        sec-ch-ua-mobile: ?0
                                        sec-ch-ua-platform: "Windows"
                                         */
                                        final url = 'http://192.168.43.172:7777/set_geodata';
                                        final response = await http.post(Uri.parse(url),    headers: <String, String>{
                                          'Content-Type': 'application/json'
                                        },
                                          body: jsonEncode(<String, String>{
                                            'point_start_x': startX,
                                            'point_start_y': startY,
                                            'point_target_x': targetX,
                                            'point_target_y': targetY
                                          }),);
                                      },
                                          child: const Text('Заказать доставку'),

                                          style: ElevatedButton.styleFrom(shape: StadiumBorder())),

                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                        ])

                ),
              );
        }),


      floatingActionButton: FloatingActionButton(
        onPressed: _gotoDefault,
        tooltip: 'Я на карте',
        backgroundColor: Colors.red,
        child: const Icon(Icons.my_location),
      ),


    );
  }
}