// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kostlon/services/rules_service.dart';

class RulesOwnerScreen extends StatefulWidget {
  const RulesOwnerScreen({super.key});

  @override
  State<RulesOwnerScreen> createState() => _RulesOwnerScreenState();
}

class _RulesOwnerScreenState extends State<RulesOwnerScreen> {
  final RuleService ruleService = RuleService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: ruleService.getData(),
      builder: (context, snapshot) {
        // 1. check data ada atau tidak
        // 1.1 check apakah firebase/jaringan ini terhubung atau enda ?
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        // 2. inisiai items dari data
        var items = snapshot.data?.docs;
        // 3. data list berhasil di ambil tapi datanyakosong
        if (items == null) {
          return Center(
            child: Text('Data kos kosong'),
          );
        }
        // hasil akhir yang akan menampilkan item dalam bentuk tampilan
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            //[ 0, 1, 2, 3 ,4 ]
            // variael
            DocumentSnapshot item = items[index];
            String docId = items[index].id;

            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: BorderDirectional(
                  bottom: BorderSide(
                    width: 0.5,
                    color: Colors.black12,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(item['rule']),
                    ],
                  ),
                  IconButton(
                    onPressed: () async {
                      // context.loaderOverlay.show();
                      try {
                        await ruleService.deleteData(docId);
                        // context.loaderOverlay.hide();
                      } catch (e) {
                        // context.loaderOverlay.hide();
                      }
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 18,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
