import 'package:flutter/material.dart';
import '../model/poli.dart';
import '/ui/poli_detail.dart';

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;

  const PoliUpdateForm({Key? Key, required this.poli}) : super(key: Key);
  _PoliUpdateFormState createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _formkey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  void iniState() {
    super.initState();
    setState(() {
      _namaPoliCtrl.text = widget.poli.namaPoli;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Poli")),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              _filedNamaPoli(_namaPoliCtrl),
              SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          Poli poli = new Poli(namaPoli: _namaPoliCtrl.text);
          Navigator.pop(context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
        },
        child: const Text("Simpan Perubahan"));
  }
}

_filedNamaPoli(TextEditingController _namaPoliCtrl) {
  return TextField(
    decoration: const InputDecoration(labelText: "Nama Poli"),
    controller: _namaPoliCtrl,
  );
}
