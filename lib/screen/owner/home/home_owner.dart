// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kostlon/components/card_toko.dart';
import 'package:kostlon/screen/owner/kos/kos_detail.dart';
import 'package:kostlon/screen/owner/kos/kos_form.dart';
import 'package:kostlon/services/kos_service.dart';

class HomeOwnerScreen extends StatefulWidget {
  const HomeOwnerScreen({super.key});

  @override
  State<HomeOwnerScreen> createState() => _HomeOwnerScreenState();
}

class _HomeOwnerScreenState extends State<HomeOwnerScreen> {
  // 1. import service
  KosServices _kosServices = KosServices();

  @override
  Widget build(BuildContext context) {
    // 2. tarik data dengan stream builder
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _kosServices.getData(),
        builder: (context, snapshot) {
          //3 check apakan services menerima data atau tidak
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          // 3. inisiai items dari data
          var items = snapshot.data?.docs;
          // [ data array ]

          if (items!.isNotEmpty) {
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 3.5,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    final String? id = items[index]?.id;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OwnerKosDetailPage(id: id),
                      ),
                    );
                  },
                  child: CardToko(
                    title: items[index]['name'],
                    image: items[index]['image'],
                    alamat: items[index]['owner'],
                    harga: items[index]['price'].toString(),
                  ),
                );
              },
              shrinkWrap: true,
            );
          }

          return Center(
            child: Text('Data kos kosong, tambah data'),
          );
          // 5. tampilkan dalam bentuk list
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OwnerKostFormPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
