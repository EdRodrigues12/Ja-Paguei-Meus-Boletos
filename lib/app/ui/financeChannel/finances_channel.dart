import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ja_paguei_meus_boletos/app/model/youtube_channels.dart';
import 'finances_channel_viewmodel.dart';

class FinanceChannelPage extends StatefulWidget {
  @override
  _FinanceChannelPageState createState() => _FinanceChannelPageState();
}

class _FinanceChannelPageState extends State<FinanceChannelPage> {
  int _currentIndex = 0;
  var vm = FinancesChannelViewModel();

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
      appBar: AppBar(
        title: Text('Canais com dicas'),
      ),
      body: Builder(
        builder: (context) => Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: orientation == Orientation.portrait
                  ? (screenSize.height - safeAreaVertical) / 100 * 100
                  : (screenSize.height - safeAreaVertical) / 100 * 100,
              child: FutureBuilder<List<YoutubeChannel>>(
                  future: vm.getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              SnackBar snackBar = new SnackBar(
                                content: Text("Em construção!"),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            },
                            child: SizedBox(
                              width: 250,
                              child: Card(
                                elevation: 15,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          //image
                                          Expanded(
                                            child: Image.asset(
                                              snapshot.data[i].urlToImage,
                                              width: screenSize.width / 2,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  //titulo
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      snapshot.data[i].title,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: orientation ==
                                                                Orientation
                                                                    .portrait
                                                            ? (screenSize
                                                                        .width -
                                                                    safeAreaHorizontal) /
                                                                100 *
                                                                3
                                                            : null,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  //descricao
                                                  Text(
                                                    snapshot
                                                        .data[i].description,
                                                    maxLines: 8,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: orientation ==
                                                                Orientation
                                                                    .portrait
                                                            ? (screenSize
                                                                        .width -
                                                                    safeAreaHorizontal) /
                                                                100 *
                                                                3
                                                            : null,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                            ),
                          );
                        },
                        itemCount: snapshot.data.length,
                      );
                    } else {
                      return Scaffold(
                        body: Center(child: CircularProgressIndicator()),
                      );
                    }
                  }),
            ),
          ],
        ),
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
                'assets/svg/Media/Youtube.svg',
                color: Colors.white,
              ),
              label: "canais youtube",
              backgroundColor: Colors.deepPurpleAccent[400]),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/Files/File.svg',
                color: Colors.white,
              ),
              label: "artigos",
              backgroundColor: Colors.deepPurpleAccent[400]),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/Media/Music-cloud.svg',
                color: Colors.white,
              ),
              label: "podcasts",
              backgroundColor: Colors.deepPurpleAccent[400]),
        ],
      ),
    );
  }

// TODO: move for viewmodel
  navigatorPage() {
    switch (_currentIndex) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }
}
