import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:test/components/card_list.dart';
import 'package:test/controller/controller_user.dart';
import 'package:test/screens/form_user.dart';

class ListData extends StatefulWidget {
  const ListData({Key? key}) : super(key: key);
  static String namePage = "/list-data";

  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  ControllerUser controllerUser = Get.put(ControllerUser());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: GetBuilder<ControllerUser>(builder: (value) {
          return Column(children: [
            if (value.listUser.isEmpty)
              const Center(
                  child: Padding(
                padding: EdgeInsets.all(20),
                child: Text("Tidak ada list user"),
              ))
            else
              for (var i = 0; i < value.listUser.length; i++)
                cardList(
                  dataUser: value.listUser[i],
                  index: i,
                ),
          ]);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(FormUser.namePage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
