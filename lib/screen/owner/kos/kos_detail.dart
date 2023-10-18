import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kostlon/components/text_inline.dart';
// import 'package:kostlon/components/text_inline.dart';
import 'package:kostlon/services/kos_service.dart';

class OwnerKosDetailPage extends StatefulWidget {
  const OwnerKosDetailPage({
    super.key,
    this.id,
  });

  final String? id;

  @override
  State<OwnerKosDetailPage> createState() => _OwnerKosDetailPageState();
}

class _OwnerKosDetailPageState extends State<OwnerKosDetailPage> {
  KosServices kosServices = KosServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Kos'),
        ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: kosServices.getDetail(widget.id),
          builder: (context, snapshot) {
            DocumentSnapshot? item = snapshot?.data;
            // ini nampilan data
            return ListView(
              children: [
                Image.network(
                  item?['image'],
                  height: 200,
                  fit: BoxFit.cover,
                ),
                TextInline(label: "Ower", nama: item?['owner']),
                TextInline(label: "Nama Kos", nama: item?['name']),
                TextInline(label: "Alamat", nama: item?['alamat']),
                TextInline(label: "Harga", nama: item?['price'].toString()),
                TextInline(
                    label: "Jumlah Ruangan", nama: item?['jumlah'].toString()),
              ],
            );
          },
        ));
  }
}
