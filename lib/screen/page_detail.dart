import 'package:flutter/material.dart';
import 'package:case1_kamus_talawi/model/list_kosa_kata.dart';

class KamusDetail extends StatelessWidget {
  final Datum? data;

  const KamusDetail(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Kosa Kata ${data?.kosaKata}"),
        backgroundColor: Colors.blue[100],
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(label: Text("Talawi ")),
            DataColumn(label: Text(":",)),
            DataColumn(label: Text("${data?.kosaKata}")),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text("Indonesia")),
                DataCell(Text(":")),
                DataCell(Text("${data?.arti}")),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text("Keterangan")),
                DataCell(Text(":")),
                DataCell(Text("${data?.detail}")),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text("Contoh Kalimat")),
                DataCell(Text(":")),
                DataCell(Text("${data?.ucapanTalawi}")),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text("Terjamahan")),
                DataCell(Text(":")),
                DataCell(Text("${data?.ucapanIndonesia}")),
              ],
            ),
          ],
        ),
      ),
        // children: [
        //   ListTile(
        //     title: Text(
        //       data?.kosaKata ?? "",
        //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        //     ),
        //     subtitle: Row(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text("Talawi: ${data?.kosaKata}"),
        //         Text("Indonesia: ${data?.arti}"),
        //         Text("Keterangan: ${data?.detail}"),
        //         Text("Contoh Kalimat Bahasa Talawi: ${data?.ucapanTalawi}"),
        //         Text(
        //             "Terjemahan Kalimat Bahasa Indonesia: ${data?.ucapanIndonesia}"),
        //       ],
        //     ),
        //   ),
        // ],

    );
  }
}
