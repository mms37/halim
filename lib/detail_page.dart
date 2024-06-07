import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'halisaha_model.dart'; // Halisaha modelini içe aktar

class DetailPage extends StatelessWidget {
  final Halisaha halisaha; // Halı saha modeli

  DetailPage({required this.halisaha});

  final PageController _pageController = PageController(); // PageController tanımla

  // Telefon numarasını aramak için
  void _callPhone(BuildContext context, String number) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: number,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Telefon araması yapılamadı.")),
      );
    }
  }

  // Harita bağlantısını açmak için
  void _openMaps(BuildContext context) async {
    if (await canLaunch(halisaha.mapLink)) {
      await launch(halisaha.mapLink);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Harita açılamadı.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final nearbyFields = _getNearbyFields(); // Yakındaki halı sahaları al

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250,250,250, 1),
        title: Text('${halisaha.name} Detayları'),
      ),
      body: Container(
        color: Color.fromRGBO(250,250,250, 1),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  halisaha.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                // Resim galerisi için PageView widget'ı
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: PageView.builder(
                        controller: _pageController, // PageController kullan
                        itemCount: halisaha.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            halisaha.imageUrls[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      left: 16,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                        onPressed: () {
                          _pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                      ),
                    ),
                    Positioned(
                      right: 16,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                        onPressed: () {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Saha Özellikleri',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                _buildFeatureTile('Otopark', halisaha.hasParking),
                _buildFeatureTile('Duş', halisaha.hasShower),
                _buildFeatureTile('Kapalı Saha', halisaha.isIndoor),
                // Buraya saha özelliklerini ekleyebilirsiniz
                SizedBox(height: 16),
                Text(
                  'Halı Saha Hakkında',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '${halisaha.name} sahası ${halisaha.city} - ${halisaha.district} ilçesinde bulunmaktadır.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _openMaps(context), // Harita açmak için düğme
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.map),
                      SizedBox(width: 8),
                      Text('Haritada Göster'),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () =>
                      _callPhone(context, halisaha.phoneNumber), // Telefon Et düğmesi
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 8),
                      Text('Telefon Et'),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Yakındaki Halı Sahalar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: nearbyFields.map((field) {
                      return _buildNearbyFieldCard(context, field);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Saha özelliği için widget oluşturur
  Widget _buildFeatureTile(String title, bool hasFeature) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: hasFeature ? Colors.green : Colors.grey,
        ),
      ),
      leading: Icon(
        hasFeature ? Icons.check_circle : Icons.cancel,
        color: hasFeature ? Colors.green : Colors.grey,
      ),
    );
  }

  // Yakındaki halı sahaları alır
  List<Halisaha> _getNearbyFields() {
    // Yakındaki halı sahaların listesi
    List<Halisaha> nearbyFields = [];

    // Tüm halı sahaları içeren veri kaynağınızdan veya bir API'den yakınlardaki sahaları alın
    // Burada örnek bir veri kullanıyorum, siz kendi veri kaynağınıza uygun şekilde doldurmalısınız
    final List<Halisaha> allFields =
    data[halisaha.city]![halisaha.district]!;

    // Seçilen halı sahanın ilçesindeki diğer halı sahaları listeye eklenir
    for (final Halisaha field in allFields) {
      if (field.name != halisaha.name) {
        nearbyFields.add(field);
      }
    }

    return nearbyFields;
  }

  // Yakındaki halı sahalar için kart oluşturur
  Widget _buildNearbyFieldCard(
      BuildContext context, Halisaha nearbyField) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(halisaha: nearbyField),
          ),
        );
      },
      child: Container(
        width: 200,
        margin: EdgeInsets.only(right: 16),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                nearbyField.primaryImageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  nearbyField.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${nearbyField.city} - ${nearbyField.district}',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
