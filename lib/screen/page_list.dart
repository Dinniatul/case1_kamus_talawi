import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:case1_kamus_talawi/model/list_kosa_kata.dart';
import 'package:case1_kamus_talawi/screen/page_detail.dart'; // Sesuaikan dengan lokasi KamusDetail

class PageListKosaKata extends StatefulWidget {
  const PageListKosaKata({Key? key});

  @override
  State<PageListKosaKata> createState() => _PageListKosaKataState();
}

class _PageListKosaKataState extends State<PageListKosaKata> {
  List<Datum> listKosaKata = [];
  List<Datum> searchResults = [];

  TextEditingController txtCari = TextEditingController();

  @override
  void initState() {
    super.initState();
    getKosaKata();
  }

  Future<void> getKosaKata() async {
    try {
      http.Response response = await http.get(Uri.parse('http://127.0.0.1:8000/api/kosa-kata'));
      ModelListKosaKata data = modelListKosaKataFromJson(response.body);
      setState(() {
        listKosaKata = data.data!;
        searchResults = data.data!;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kosa Kata'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txtCari,
              onChanged: (value) {
                filterKosaKata(value);
              },
              decoration: InputDecoration(
                hintText: "Search Data",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.green.withOpacity(0.1),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                Datum data = searchResults[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KamusDetail(data),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(data.kosaKata!),
                        subtitle: Text(data.arti!),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void filterKosaKata(String query) {
    List<Datum> filteredKosaKata = listKosaKata.where((datum) {
      return datum.kosaKata!.toLowerCase().contains(query.toLowerCase()) ||
          datum.arti!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setState(() {
      searchResults = filteredKosaKata;
    });
  }
}
