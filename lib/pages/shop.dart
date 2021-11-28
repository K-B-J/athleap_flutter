import 'package:flutter/material.dart';
import 'dart:math';
import 'package:athleap/pages/afterForm.dart';
import 'package:athleap/helpers/ageCalculator.dart';
import 'package:athleap/firebase/database.dart';
import 'package:athleap/helpers/loading.dart';
import 'package:athleap/firebase/auth.dart';
import 'package:athleap/helpers/sort.dart';
import 'package:flutter/material.dart';

var main_color = const Color(0xfffa9b70);

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  bool loading = false;
  final _email = AuthService().userEmail();
  List _items = [];
  int _userFcoins = 0;

  void initState() {
    super.initState();
    fetchShopData();
    fetchUserData();
  }

  void _buy(int price) {
    setState(() {
      _userFcoins = _userFcoins - (price);
      print("Item added to cart");
    });
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
                                              width: 25,
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
                                      color: Color(0xfffa9b70),
                                    ),
                                  ),
                                  ElevatedButton(
                                    child: Text("+ Add to Cart"),
                                    onPressed:
                                        (_userFcoins >= item.data()["price"])
                                            ? () {
                                                _buy(int.parse(
                                                    item.data()["price"]));
                                              }
                                            : null,
                                    style: ButtonStyle(
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
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ]),
              ),
            ),
    );
  }

  Future fetchShopData() async {
    await Future.delayed(const Duration(milliseconds: 80),
        () {}); // Added this so that the refresh indicator stays
    if (this.mounted) {
      setState(() {
        loading = true;
      });
    }
    DatabaseService().fetchAll("Shop").then((snapshot) {
      if (snapshot == null) {
        // Either some error occured or no data found
        setState(() {
          loading = false;
        });
      } else {
        setState(() {
          _items.addAll(snapshot.docs);
          loading = false;
        });
      }
    });
  }

  Future fetchUserData() async {
    await Future.delayed(const Duration(milliseconds: 80),
        () {}); // Added this so that the refresh indicator stays
    if (this.mounted) {
      setState(() {
        loading = true;
      });
    }
    DatabaseService().fetch("Users", _email).then((snapshot) {
      if (snapshot == null) {
        // Either some error occured or no data found
        setState(() {
          loading = false;
        });
      } else {
        setState(() {
          _userFcoins = int.parse(snapshot.docs[0].data()["fcoins"]);
          loading = false;
        });
      }
    });
  }
}
