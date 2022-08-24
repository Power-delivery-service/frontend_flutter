import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);
  List lst = [];

  void addText(String text) {
    lst.add(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: Image.asset('assets/Log1.png'),
              ),
              Text('Служба доставки мощности')
            ],
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Stack(
          children: <Widget>[
            Container(
                decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/seti.jpg"),
                fit: BoxFit.cover,
              ),
            )),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 250,
                          height: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                addText("Владелец электромобиля");
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (route) => true);
                              },
                              child: const Text('Владелец электромобиля')),
                        ),
                        SizedBox(
                          width: 250,
                          height: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                addText("Организатор мероприятия");
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (route) => true);
                              },
                              child: const Text('Организатор мероприятия')),
                        ),
                        SizedBox(
                          width: 250,
                          height: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                addText("Застройщик");
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (route) => true);
                              },
                              child: const Text('Застройщик')),
                        ),
                        SizedBox(
                          width: 250,
                          height: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                addText("Добывающая компания");
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (route) => true);
                              },
                              child: const Text('Добывающая компания')),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 250,
                          height: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                addText("Временное отключение");
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (route) => true);
                              },
                              child: const Text('Временное отключение')),
                        ),
                        SizedBox(
                          width: 250,
                          height: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                addText("Временное поселение");
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (route) => true);
                              },
                              child: const Text('Временное поселение')),
                        ),
                        SizedBox(
                          width: 250,
                          height: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                addText("Киносъемки");
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (route) => true);
                              },
                              child: const Text('Киносъемки')),
                        ),
                        SizedBox(
                          width: 250,
                          height: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                addText("Базовая станция");
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (route) => true);
                              },
                              child: const Text('Базовая станция')),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )),
          ],
        ));
  }
}
