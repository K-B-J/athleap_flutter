import 'package:flutter/material.dart';
import 'package:athleap/firebase/database.dart';
import 'package:athleap/helpers/loading.dart';
import 'package:athleap/firebase/auth.dart';

var main_color = const Color(0xfffa9b70);

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  bool loading = true;
  final _email = AuthService().userEmail();
  List _items = [];
  dynamic _userFcoins;

  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shop",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: main_color,
      ),
      body: loading
          ? Loading()
          : Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "Your Fcoins: $_userFcoins",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ..._items.map((item) {
                        return Container(
                          width: 300,
                          margin: EdgeInsets.all(10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Image.network(
                                    item.data()["image"],
                                    width: 200,
                                    height: 200,
                                  ),
                                  Text(
                                    item.data()["title"],
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(children: [
                                      Text(
                                        "Sizes: ",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Spacer(),
                                      Row(children: [
                                        ...item.data()["sizes"].map((size) {
                                          return Card(
                                            elevation: 10,
                                            child: Container(
                                              width: 32,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: Text(
                                                  "$size",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          );
                                        })
                                      ])
                                    ]),
                                  ),
                                  Text(
                                    "${item.data()["price"]} FC",
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  ElevatedButton(
                                    child: Text("+ Add to Cart"),
                                    onPressed: () {},
                                    style: (_userFcoins >= item.data()["price"])
                                        ? ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              Color(0xfffa9b70),
                                            ),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                            ),
                                          )
                                        : ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              Color(0xff707070),
                                            ),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                            ),
                                          ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
              ),
            ),
    );
  }

  Future fetchData() async {
    DatabaseService().fetch("Users", _email).then((userSnapshot) {
      if (userSnapshot == null) {
        //Something went wrong
      } else {
        DatabaseService().fetchAll("Shop").then((snapshot) {
          if (snapshot == null) {
            // Something went wrong
          } else {
            setState(() {
              _userFcoins = userSnapshot.docs[0].data()["fcoins"];
              _items.addAll(snapshot.docs);
              loading = false;
            });
          }
        });
      }
    });
  }
}
