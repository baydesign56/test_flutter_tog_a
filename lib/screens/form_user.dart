import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/controller/controller_image_picker.dart';
import 'package:test/controller/controller_user.dart';
import 'package:test/models/model_user.dart';

class FormUser extends StatefulWidget {
  const FormUser({Key? key}) : super(key: key);
  static String namePage = "/form-user";

  @override
  _FormUserState createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  ControllerUser controllerUser = Get.put(ControllerUser());
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController tinggi = TextEditingController();
  TextEditingController berat = TextEditingController();
  TextEditingController tanggallahir = TextEditingController();
  DateTime date = DateTime.now();
  File? foto;

  Timer? _timer60;
  int _start60 = 60;
  startTimer10() {
    const sec60 = Duration(seconds: 1);
    _timer60 = Timer.periodic(
      sec60,
      (Timer timer) {
        if (_start60 == 0) {
          setState(() {
            _timer60!.cancel();
          });
        } else {
          setState(() {
            _start60--;
            log(_start60.toString());
          });
        }
      },
    );
  }

  _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1999),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        tanggallahir.text = date.day.toString() +
            "-" +
            date.month.toString() +
            "-" +
            date.year.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer10();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                _start60.toString(),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                ControllerImagePicker.imagePick(source: ImageSource.gallery)
                    .then((value) {
                  setState(() {
                    foto = value;
                  });
                });
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: foto == null
                        ? null
                        : Image.file(
                            foto!,
                            fit: BoxFit.cover,
                          ),
                    width: 100,
                    height: 100,
                  )),
            ),
            TextField(
              controller: nama,
              onChanged: (v) {
                setState(() {});
              },
              decoration: const InputDecoration(
                hintText: "Nama",
                label: Text("Nama"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: alamat,
              onChanged: (v) {
                setState(() {});
              },
              decoration: const InputDecoration(
                hintText: "Alamat",
                label: Text("Alamat"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: tanggallahir,
              // onChanged: (v) {
              //   setState(() {});
              // },
              readOnly: true,
              onTap: () {
                _selectDate();
              },
              decoration: const InputDecoration(
                hintText: "Tanggal lahir",
                label: Text("Tanggal lahir"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: tinggi,
              onChanged: (v) {
                setState(() {});
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Tinggi",
                label: Text("Tinggi"),
                suffix: Text("Cm"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: berat,
              onChanged: (v) {
                setState(() {});
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Berat",
                label: Text("Berat"),
                suffix: Text("Kg"),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            _start60 == 0
                ? IconButton(
                    color: Colors.blue,
                    onPressed: () {
                      Get.rawSnackbar(
                          message: "Waktu pengisian habis",
                          backgroundColor: Colors.red);
                    },
                    icon: const Icon(Icons.save, color: Colors.grey),
                  )
                : nama.text.isEmpty ||
                        alamat.text.isEmpty ||
                        tinggi.text.isEmpty ||
                        berat.text.isEmpty ||
                        tanggallahir.text.isEmpty ||
                        foto == null
                    ? IconButton(
                        color: Colors.blue,
                        onPressed: () {
                          Get.rawSnackbar(
                              message: "Form tidak boleh kosong",
                              backgroundColor: Colors.red);
                        },
                        icon: const Icon(Icons.save, color: Colors.grey),
                      )
                    : IconButton(
                        onPressed: () {
                          controllerUser.addUser(
                            dataUser: ModelUser(
                              nama: nama.text,
                              alamat: alamat.text,
                              tanggallahir: tanggallahir.text,
                              tinggi: int.tryParse(tinggi.text),
                              berat: int.tryParse(berat.text),
                              foto: foto,
                            ),
                          );
                        },
                        icon: const Icon(Icons.save, color: Colors.blue),
                      )
          ],
        ),
      )),
    );
  }
}
