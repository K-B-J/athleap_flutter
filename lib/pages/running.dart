import 'package:athleap/pages/runningForm.dart';
import 'package:athleap/pages/registerForm.dart';
import 'package:flutter/material.dart';

var main_color = const Color(0xfffa9b70);

class RunningHistory extends StatefulWidget {
  const RunningHistory({Key? key}) : super(key: key);

  @override
  _RunningHistoryState createState() => _RunningHistoryState();
}

class _RunningHistoryState extends State<RunningHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Running Records",
              style: TextStyle(fontWeight: FontWeight.bold)),
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
                      ],
                    )))),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Align(
          alignment: Alignment(0.9, 0.94),
          child: Transform.scale(
              scale: 1.5,
              child: FloatingActionButton(
                backgroundColor: Color(0xccfa9b70),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddRunningData()));
                },
                tooltip: 'Add Data',
                child: Icon(Icons.add),
              )),
        ));
  }
}
