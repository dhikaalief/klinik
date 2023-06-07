import 'package:flutter/material.dart';
import 'package:nyoba2/model/poli.dart';
import 'poli_detail.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({Key? key}) : super(key: key);
  _PoliFormState createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Poli")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [_filedNamaPoli(), SizedBox(height: 20), _tombolSimpan()],
          ),
        ),
      ),
    );
  }

  _filedNamaPoli() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          Poli poli = new Poli(namaPoli: _namaPoliCtrl.text);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
        },
        child: const Text("Simpan"));
  }
}
