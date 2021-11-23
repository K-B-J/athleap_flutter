import 'package:athleap/runningForm.dart';
import 'package:athleap/registerForm.dart';
import 'package:flutter/material.dart';

class RunningHistory extends StatelessWidget {
  var main_color = const Color(0xfffa9b70);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Running", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: main_color,
      ),
      body: Container(
          margin: EdgeInsets.all(10.0),
          width: double.infinity,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Center(
                            child: Text(
                          'DATE',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                      ),
                      DataColumn(
                        label: Center(
                            child: Text(
                          'DISTANCE',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                      DataColumn(
                        label: Center(
                            child: Text(
                          'TIME',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                      DataColumn(
                        label: Center(
                            child: Text(
                          'ELEVATION',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                      DataColumn(
                        label: Center(
                            child: Text(
                          'CALORIES',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                    rows: const <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text("22/11/2021"))),
                          DataCell(Center(child: Text('1.5'))),
                          DataCell(Center(child: Text('00:30'))),
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Text('1.5'))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text("22/11/2021"))),
                          DataCell(Center(child: Text('1.5'))),
                          DataCell(Center(child: Text('00:30'))),
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Text('1.5'))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text("22/11/2021"))),
                          DataCell(Center(child: Text('1.5'))),
                          DataCell(Center(child: Text('00:30'))),
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Text('1.5'))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text("22/11/2021"))),
                          DataCell(Center(child: Text('1.5'))),
                          DataCell(Center(child: Text('00:30'))),
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Text('1.5'))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text("22/11/2021"))),
                          DataCell(Center(child: Text('1.5'))),
                          DataCell(Center(child: Text('00:30'))),
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Text('1.5'))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text("22/11/2021"))),
                          DataCell(Center(child: Text('1.5'))),
                          DataCell(Center(child: Text('00:30'))),
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Text('1.5'))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text("22/11/2021"))),
                          DataCell(Center(child: Text('1.5'))),
                          DataCell(Center(child: Text('00:30'))),
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Text('1.5'))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text("22/11/2021"))),
                          DataCell(Center(child: Text('1.5'))),
                          DataCell(Center(child: Text('00:30'))),
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Text('1.5'))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text("22/11/2021"))),
                          DataCell(Center(child: Text('1.5'))),
                          DataCell(Center(child: Text('00:30'))),
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Text('1.5'))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text("22/11/2021"))),
                          DataCell(Center(child: Text('1.5'))),
                          DataCell(Center(child: Text('00:30'))),
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Text('1.5'))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text("22/11/2021"))),
                          DataCell(Center(child: Text('1.5'))),
                          DataCell(Center(child: Text('00:30'))),
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Center(child: Text('1.5')))),
                        ],
                      ),
                    ],
                  )))),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.power, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('Power'))
        ],
        onTap: (index) {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: new Opacity(
          opacity: 0.7,
          child: new FloatingActionButton(
            backgroundColor: main_color,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddRunningData()));
            },
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          )),
    );
  }
}
