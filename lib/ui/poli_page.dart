import 'package:flutter/material.dart';
import 'package:nyoba2/service/poli_service.dart';
import 'package:nyoba2/widget/sidebar.dart';
import '../model/poli.dart';
import 'poli_detail.dart';
import 'poli_item.dart';
import 'poli_form.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({Key? key}) : super(key: key);
  _PoliPageState createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  Stream<List<Poli>> getList() async* {
    List<Poli> data = await PoliService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Poli"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PoliForm()));
            },
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder(
        stream: getList(),
        builder: (context, AsyncSnapshot Snapshot) {
          if (Snapshot.hasError) {
            return Text(Snapshot.error.toString());
          }
          if (Snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!Snapshot.hasData &&
              Snapshot.connectionState == ConnectionState.done) {
            return Text('Data Kosong');
          }

          return ListView.builder(
            itemCount: Snapshot.data.length,
            itemBuilder: (context, index) {
              return PoliItem(poli: Snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}
