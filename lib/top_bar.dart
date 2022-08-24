import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {

  TopBarContents();

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child:
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width:60,
                  height:60,
                  child: Image.asset("assets/logo.png",fit: BoxFit.fitWidth,)),
              const Text(
                'РЭД',
                style: TextStyle(
                  color: Color(0xFF077bd7),
                  fontSize: 26,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                ),
              ),
              SizedBox(width: screenSize.width / 20),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value
                        ? _isHovering[0] = true
                        : _isHovering[0] = false;
                  });
                },
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context,'/registration',(route)=> true);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'О проекте',
                      style: TextStyle(
                          color: _isHovering[0]
                              ? const Color(0xFF077bd7)
                              : const Color(0xFF077bd7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[0],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: const Color(0xFF051441),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: screenSize.width / 20),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value
                        ? _isHovering[1] = true
                        : _isHovering[1] = false;
                  });
                },
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context,'/delivery',(route)=> true);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Условия доставки',
                      style: TextStyle(
                          color: _isHovering[1]
                              ? const Color(0xFF077bd7)
                              : const Color(0xFF077bd7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[1],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: const Color(0xFF051441),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: screenSize.width / 20),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value
                        ? _isHovering[2] = true
                        : _isHovering[2] = false;
                  });
                },
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context,'/registration',(route)=> true);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Прием на работу',
                      style: TextStyle(
                          color: _isHovering[2]
                              ? const Color(0xFF077bd7)
                              : const Color(0xFF077bd7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[2],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: const Color(0xFF051441),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: screenSize.width / 20),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value
                        ? _isHovering[3] = true
                        : _isHovering[3] = false;
                  });
                },
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context,'/registration',(route)=> true);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Контактные данные',
                      style: TextStyle(
                          color: _isHovering[3]
                              ? const Color(0xFF077bd7)
                              : const Color(0xFF077bd7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[3],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: const Color(0xFF051441),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: screenSize.width / 20),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value
                        ? _isHovering[4] = true
                        : _isHovering[4] = false;
                  });
                },
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context,'/registration',(route)=> true);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Зарегистрироваться',
                      style: TextStyle(
                          color: _isHovering[4]
                              ? const Color(0xFF077bd7)
                              : const Color(0xFF077bd7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[4],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: const Color(0xFF051441),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

      ),

    );
    //);
  }
}