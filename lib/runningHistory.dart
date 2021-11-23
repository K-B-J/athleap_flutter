import 'package:athleap/runningForm.dart';
import 'package:athleap/registerForm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RunningHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Running", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade300,
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
                        label: Text(
                          'DATE',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'DISTANCE',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'TIME',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'ELEVATION',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'CALORIES',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: const <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text("22/11/2021")),
                          DataCell(Text('1.5')),
                          DataCell(Text('00:30')),
                          DataCell(Text('1')),
                          DataCell(Text('1.5')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('22/11/2021')),
                          DataCell(Text('1.5')),
                          DataCell(Text('00:30')),
                          DataCell(Text('1')),
                          DataCell(Text('1.5')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('22/11/2021 ')),
                          DataCell(Text('1.5')),
                          DataCell(Text('00:30')),
                          DataCell(Text('1')),
                          DataCell(Text('1.5')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('22/11/2021 ')),
                          DataCell(Text('1.5')),
                          DataCell(Text('00:30')),
                          DataCell(Text('1')),
                          DataCell(Text('1.5')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('22/11/2021 ')),
                          DataCell(Text('1.5')),
                          DataCell(Text('00:30')),
                          DataCell(Text('1')),
                          DataCell(Text('1.5')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('22/11/2021 ')),
                          DataCell(Text('1.5')),
                          DataCell(Text('00:30')),
                          DataCell(Text('1')),
                          DataCell(Text('1.5')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('22/11/2021 ')),
                          DataCell(Text('1.5')),
                          DataCell(Text('00:30')),
                          DataCell(Text('1')),
                          DataCell(Text('1.5')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('22/11/2021 ')),
                          DataCell(Text('1.5')),
                          DataCell(Text('00:30')),
                          DataCell(Text('1')),
                          DataCell(Text('1.5')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('22/11/2021 ')),
                          DataCell(Text('1.5')),
                          DataCell(Text('00:30')),
                          DataCell(Text('1')),
                          DataCell(Text('1.5')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('22/11/2021 ')),
                          DataCell(Text('1.5')),
                          DataCell(Text('00:30')),
                          DataCell(Text('1')),
                          DataCell(Text('1.5')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('22/11/2021 ')),
                          DataCell(Text('1.5')),
                          DataCell(Text('00:30')),
                          DataCell(Text('1')),
                          DataCell(Text('1.5')),
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
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddRunningData()));
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
