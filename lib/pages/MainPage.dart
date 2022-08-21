import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final controller = MapController(
    location: const LatLng(55.1425, 61.5396),
  );

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [SizedBox(
            width: 200,
            height: 50,
            child: Image.asset('assets/Log1.png'),
          ), Text('Служба доставки мощности')],
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: MapLayout(
        controller: controller,
        builder: (context, transformer) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onDoubleTapDown: (details) => _onDoubleTap(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Column(
                        children: [
                          Column(
                            children: [

                              SizedBox(
                                width: 200,
                                height: 50,
                                child: ElevatedButton(onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context,'/registration',(route)=> true);
                                },
                                    child: const Text('Информация о проекте')),
                              ),
                            ],
                          ),

                          Column(
                            children: [

                              SizedBox(
                                width: 200,
                                height: 50,
                                child: ElevatedButton(onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context,'/registration',(route)=> true);
                                },
                                    child: const Text('Условия доставки')),
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              SizedBox(
                                width: 200,
                                height: 50,
                                child: ElevatedButton(onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context,'/registration',(route)=> true);
                                },
                                    child: const Text('Приём на работу')),
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              SizedBox(
                                width: 200,
                                height: 50,
                                child: ElevatedButton(onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context,'/registration',(route)=> true);
                                },
                                    child: const Text('Контактные данные')),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,300,0,0),
                                child: SizedBox(

                                  width: 200,
                                  height: 100,
                                  child: ElevatedButton(onPressed: () {
                                    print(controller.center.latitude.toString() + " " + controller.center.longitude.toString());
                                  },
                                      child: const Text('Заказать доставку'),
                                      style: ElevatedButton.styleFrom(shape: StadiumBorder())),

                                ),
                              ),                            ],
                          ),

                        ],
                      ),


                      Column(

                        children: [CircleAvatar(
                          backgroundImage: AssetImage('assets/reg.png'),
                          radius: 25,
                          //backgroundColor: Colors.orangeAccent,
                        ),
                          SizedBox(
                            width: 200,
                            height: 40,

                            child: ElevatedButton(onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context,'/registration',(route)=> true);
                            },
                                child: const Text('Зарегистрироваться'),
                                style: ElevatedButton.styleFrom(shape: StadiumBorder()),

                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _gotoDefault,
        tooltip: 'Я на карте',
        backgroundColor: Colors.red,
        child: const Icon(Icons.my_location),
      ),


    );
  }
}