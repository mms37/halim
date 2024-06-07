import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'halisaha_model.dart'; // Modeli içe aktar
import 'package:url_launcher/url_launcher.dart';

class ListPage extends StatefulWidget {
  final String city;
  final String district;
  final Map<String, Map<String, List<Halisaha>>> data;

  ListPage({
    required this.city,
    required this.district,
    required this.data,
  });

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Halisaha> filteredFields = [];

  @override
  void initState() {
    super.initState();
    filteredFields = widget.data[widget.city]![widget.district]!;
  }

  void filterFields(String query) {
    setState(() {
      filteredFields = widget.data[widget.city]![widget.district]!
          .where((field) => field.name.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    });
  }

  void searchInMap() async {
    // Google Haritalar'da arama için URL oluşturma
    String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=${widget.city}+${widget.district}+halı+sahaları';

    // URL'yi açma
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Google Haritalar açılamadı: $googleMapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        title: Text('${widget.district}, ${widget.city} - Halı Sahaları'),
      ),
      body: Container(
        color: Color.fromRGBO(250, 250, 250, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '${widget.district} için ${filteredFields.length} saha bulundu',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Saha adı ara...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) {
                  filterFields(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: searchInMap,
                child: Row(
                  children: [
                    Icon(Icons.map,),
                    SizedBox(width: 8),
                    Text(
                      'Haritada Ara',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,


                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(

              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: filteredFields.length,
                itemBuilder: (context, index) {
                  final field = filteredFields[index]; // Halı saha modelini alın
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              halisaha: field, // Tıklanan halı saha modeli
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0), // Yuvarlatılmış köşeler
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3), // Gölgelendirme
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                                child: Image.network(
                                  field.primaryImageUrl, // Resim URL'si
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      field.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '${field.city} - ${field.district}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        'Hemen İncele ->',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
