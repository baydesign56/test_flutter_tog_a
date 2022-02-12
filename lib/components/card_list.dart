import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/controller_user.dart';
import 'package:test/models/model_user.dart';

Widget cardList({required ModelUser dataUser, int? index}) {
  ControllerUser controllerUser = Get.put(ControllerUser());
  return Container(
    width: Get.width,
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 2,
          )
        ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: dataUser.foto == null
                        ? null
                        : Image.file(
                            dataUser.foto!,
                            fit: BoxFit.cover,
                          ),
                    width: 50,
                    height: 50,
                  )),
              const SizedBox(
                width: 15,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  dataUser.nama ?? "-",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(dataUser.alamat ?? "-"),
                const SizedBox(
                  height: 10,
                ),
                Text("Tanggal lahir : " + dataUser.tanggallahir.toString()),
                const SizedBox(
                  height: 2,
                ),
                Text("Tinggi : " + dataUser.tinggi.toString() + " Cm"),
                const SizedBox(
                  height: 2,
                ),
                Text("Berat : " + dataUser.berat.toString() + " Kg"),
              ]),
            ]),
            IconButton(
              onPressed: () {
                controllerUser.delete(index: index!);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
