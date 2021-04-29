import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ja_paguei_meus_boletos/core/constants/string.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> _customColors = new List();
  int _currentIndex = 0;

  @override
  void initState() {
    //initialize all streams controllers and all custom Colors
    for (int i = 0; i < 7; i++) {
      setState(() {
        _customColors.add({
          "primary": i < 4
              ? Colors.blue
              : i == 4
                  ? Colors.white
                  : Colors.grey,
          "bkg": i < 4
              ? Colors.blue[50]
              : i == 4
                  ? Colors.blue
                  : Colors.white
        });
      });
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    double safeAreaVertical = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
    double safeAreaHorizontal = MediaQuery.of(context).padding.right +
        MediaQuery.of(context).padding.left;

    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 230, 239, 1),
      appBar: AppBar(),
      drawer: Drawer(),
      body: Builder(
        builder: (context) => Stack(children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Card(
                    elevation: 15,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: SvgPicture.asset(
                                  'assets/svg/Shopping/Money.svg',
                                  color: Colors.redAccent,
                                  width: screenSize.width / 5,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    SnackBar snackBar = new SnackBar(
                                      content: Text("Em construção!"),
                                    );
                                    Scaffold.of(context).showSnackBar(snackBar);
                                  },
                                  splashColor: _customColors[0]['bkg'],
                                  child: Column(
                                    children: [
                                      Text(
                                        meuBoletos,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: orientation ==
                                                    Orientation.portrait
                                                ? (screenSize.width -
                                                        safeAreaHorizontal) /
                                                    100 *
                                                    3
                                                : null),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                          color: _customColors[0]['bkg'],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '5',
                                            style: TextStyle(
                                                color: _customColors[0]
                                                    ['primary']),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SvgPicture.asset(
                                  'assets/svg/General/Like.svg',
                                  color: Colors.lightGreen,
                                  width: screenSize.width / 5,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    SnackBar snackBar = new SnackBar(
                                      content: Text("Em construção!"),
                                    );
                                    Scaffold.of(context).showSnackBar(snackBar);
                                  },
                                  splashColor: _customColors[1]['bkg'],
                                  child: Column(
                                    children: [
                                      Text(
                                        meusBoletosPagos,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: orientation ==
                                                    Orientation.portrait
                                                ? (screenSize.width -
                                                        safeAreaHorizontal) /
                                                    100 *
                                                    3
                                                : null),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                          color: _customColors[1]['bkg'],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '2',
                                            style: TextStyle(
                                              color: _customColors[1]
                                                  ['primary'],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 15,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(dicas,
                              style: TextStyle(
                                  fontSize: screenSize.width / 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          height: orientation == Orientation.portrait
                              ? (screenSize.height - safeAreaVertical) /
                                  100 *
                                  30
                              : (screenSize.height - safeAreaVertical) /
                                  100 *
                                  100,
                          child: ListView.builder(
                            scrollDirection:
                                3 > 1 ? Axis.horizontal : Axis.vertical,
                            itemCount: 3,
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () async {},
                                child: SizedBox(
                                  width: 250,
                                  child: Card(
                                    color: Colors.deepPurple[100],
                                    elevation: 10,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Dica de finanças',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize:
                                                      screenSize.width / 23,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Gaste todo seu dinheiro como se não houvesse amanhã',
                                            maxLines: 4,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                                fontSize:
                                                    screenSize.width / 23),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: FlatButton(
                                            textColor: Colors.indigoAccent[200],
                                            child: Text('Veja Mais'),
                                            onPressed: () async {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 15,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(resumoDividas,
                              style: TextStyle(
                                  fontSize: screenSize.width / 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          height: orientation == Orientation.portrait
                              ? (screenSize.height - safeAreaVertical) /
                                  100 *
                                  30
                              : (screenSize.height - safeAreaVertical) /
                                  100 *
                                  100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 250,
                                child: Card(
                                  color: Colors.amberAccent[100],
                                  elevation: 10,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(historicoDividas,
                                            style: TextStyle(
                                                fontSize: screenSize.width / 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      ListTile(
                                        dense: true,
                                        title: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Center(
                                            child: Text(
                                              "03/2021",
                                              style: TextStyle(
                                                fontSize: screenSize.width / 23,
                                              ),
                                            ),
                                          ),
                                        ),
                                        subtitle: Center(
                                          child: Text(
                                            'R\$ 20.000.00',
                                            style: TextStyle(
                                                fontSize: screenSize.width / 24,
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        dense: true,
                                        title: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0,
                                              right: 12.0,
                                              bottom: 12.0),
                                          child: Center(
                                            child: Text(
                                              "04/2021",
                                              style: TextStyle(
                                                  fontSize:
                                                      screenSize.width / 23),
                                            ),
                                          ),
                                        ),
                                        subtitle: Center(
                                          child: Text(
                                            'R\$ 25.000.00',
                                            style: TextStyle(
                                                fontSize: screenSize.width / 24,
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 250,
                                child: Card(
                                  color: Colors.amberAccent[100],
                                  elevation: 10,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(valorizacaoDividas,
                                            style: TextStyle(
                                                fontSize: screenSize.width / 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      ListTile(
                                        dense: true,
                                        title: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Center(
                                            child: Text(
                                              "03/2021",
                                              style: TextStyle(
                                                fontSize: screenSize.width / 23,
                                              ),
                                            ),
                                          ),
                                        ),
                                        subtitle: Center(
                                          child: Text(
                                            'R\$ 6.000.00',
                                            style: TextStyle(
                                                fontSize: screenSize.width / 24,
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        dense: true,
                                        title: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0,
                                              right: 12.0,
                                              bottom: 12.0),
                                          child: Center(
                                            child: Text(
                                              "04/2021",
                                              style: TextStyle(
                                                  fontSize:
                                                      screenSize.width / 23),
                                            ),
                                          ),
                                        ),
                                        subtitle: Center(
                                          child: Text(
                                            'R\$ 5.000.00',
                                            style: TextStyle(
                                                fontSize: screenSize.width / 24,
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 250,
                                child: Card(
                                  color: Colors.amberAccent[100],
                                  elevation: 10,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(totalDividas,
                                            style: TextStyle(
                                                fontSize: screenSize.width / 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      ListTile(
                                        dense: true,
                                        leading: SvgPicture.asset(
                                            'assets/svg/Design/Rectangle.svg',
                                            color: Colors.redAccent),
                                        title: Text(
                                          'Geral: R\$ 45.000.00',
                                          style: TextStyle(
                                              fontSize: screenSize.width / 24,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      ListTile(
                                        dense: true,
                                        leading: SvgPicture.asset(
                                            'assets/svg/Design/Rectangle.svg',
                                            color: Colors.redAccent),
                                        title: Text(
                                          'Mês: R\$ 5.000.00',
                                          style: TextStyle(
                                              fontSize: screenSize.width / 24,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      ListTile(
                                        dense: true,
                                        leading: SvgPicture.asset(
                                            'assets/svg/Design/Rectangle.svg',
                                            color: Colors.greenAccent),
                                        title: Text(
                                          'Crédito: R\$ 8.000.00',
                                          style: TextStyle(
                                              fontSize: screenSize.width / 24,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: TextStyle(fontSize: 15),
        currentIndex: _currentIndex,
        onTap: (value) async {
          setState(() {
            _currentIndex = value;
          });
          navigatorPage();
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/Cooking/Knife2.svg',
                color: Colors.white,
              ),
              label: "novo boleto",
              backgroundColor: Colors.deepPurpleAccent[400]),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/Shopping/Dollar.svg',
                color: Colors.white,
              ),
              label: "crédito",
              backgroundColor: Colors.deepPurpleAccent[400]),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/Home/Library.svg',
                color: Colors.white,
              ),
              label: "me ajuda",
              backgroundColor: Colors.deepPurpleAccent[400]),
        ],
      ),
    );
  }

// TODO: move for viewmodel
  navigatorPage() {
    switch (_currentIndex) {
      case 0:
        Navigator.pushNamed(
            context, '/newBoleto');
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }
}