import 'package:flutter/material.dart';
import 'package:map/map.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userToDo = '';
  List lst = [];
  @override
  void initState(){
    super.initState();
    lst.addAll(['Text1','Text2','Text3']);
  }
  void _menuOpen(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(title: Text('Меню '),),
          body: Row(
            children: [
              ElevatedButton(onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context,'/', (route) => false);
              }, child: Text('На главную')),
              Padding(padding: EdgeInsets.only(left: 15)),
              Text('data'),
            ],
          ),
        );
      })
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Список чего-то там'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _menuOpen,
            icon: Icon(Icons.menu_open_outlined),)
        ],
      ),
      body: ListView.builder(
          itemCount:lst.length ,
          itemBuilder: (BuildContext context,int index){
            return Dismissible(
            key: Key(lst[index]),
            child: Card(
              child: ListTile(
                title: Text(lst[index]),
              trailing: IconButton(
                  icon: const Icon(
                    Icons.delete_sweep,
                    color: Colors.deepOrange,
                  ),
                onPressed: (){
                    setState(() {
                      lst.remove(index);
                    });
                },
              ),
              ),
            ),
                onDismissed: (direction){
                  //if (direction == DismissDirection.endToStart)
              setState(() {
                lst.remove(index);
              });
            },
      );
      }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: const Text('Add element'),
              content: TextField(
                onChanged: (String value){
                  setState(() {
                    userToDo = value;
                  });

                },
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    lst.add(userToDo);
                  });
                  Navigator.of(context).pop();
                }, child: const Text('add'))
              ],
            );
          });

        },
        child: const Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}
