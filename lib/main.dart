import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'list_page.dart';
import 'halisaha_model.dart';  // Halisaha modelini içe aktar


void main(){


  runApp(HalisahaApp());

}

class HalisahaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halı Saha Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.green,  // Yeşil temalı
      ),
      home: HomePage(),  // Ana açılış sayfası
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCity;
  String? selectedDistrict;

  // Örnek veri yapısı: Halı sahaların bilgilerini içerir
  final Map<String, Map<String, List<Halisaha>>> data = {
    'Tekirdağ': {
      'Süleymanpaşa': [
        Halisaha(
          name: 'Class Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/7y228dRTrSdtvXST8',
          phoneNumber: '02822621151',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: false,
          hasParking: true,
          city: 'Tekirdağ',
          district: 'Süleymanpaşa',
        ),

        Halisaha(
          name: 'Değirmenaltı Bahçe Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/1YRg8bqT2CQ4btLfA',
          phoneNumber: '02822931616',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'Tekirdağ',
          district: 'Süleymanpaşa',
        ),
        Halisaha(
          name: 'Er-Ba Arena Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/G5n1Nni3gr7LFEDJ9',
          phoneNumber: '0282 262 6152',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'Tekirdağ',
          district: 'Süleymanpaşa',
        ),

      ],
      'Çorlu': [
        Halisaha(
          name: 'Ataş Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/kcKHEwoGKbXms7Jy6',
          phoneNumber: '0282 692 2905',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'Tekirdağ',
          district: 'Çorlu',
        ),
        Halisaha(
          name: 'Garp Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/w65ppSafo3XSQfXU8',
          phoneNumber: '02826925354',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'Tekirdağ',
          district: 'Çorlu',
        ),

      ],
    },
    'İstanbul': {
      'Bağcılar': [
        Halisaha(
          name: 'Doğuş Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/t8jJiq57zJYbaU247',
          phoneNumber: '0212 515 90 94',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bağcılar',
        ),

        Halisaha(
          name: 'Ayyıldız Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/5bMLn3p3H91MLQVC8',
          phoneNumber: '(0212) 446 35 90',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bağcılar',
        ),
        Halisaha(
          name: 'Ayar Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/dgJx29jd4NCxcn5PA',
          phoneNumber: '0212 630 50 65',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bağcılar',
        ),

        Halisaha(
          name: 'Cfs Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/DEjYU8x77MYJHCBg7',
          phoneNumber: '0212 446 20 47',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bağcılar',
        ),

        Halisaha(
          name: 'Tunçbilek Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/oTqeSdrSemVcYKMY8',
          phoneNumber: '0212 630 47 25',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bağcılar',
        ),
        Halisaha(
          name: 'Peyami Safa Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/SHKyKvFGNFgYABC9A',
          phoneNumber: '0541 560 28 28',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bağcılar',
        ),


      ],
      'Bahçelievler': [
        Halisaha(
          name: 'Üçler Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/1DxnyEPuDGMmiRYKA',
          phoneNumber: '0533 092 05 22',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bahçelievler',
        ),

        Halisaha(
          name: 'Kocasinan Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/6YbP6P21pPq5RiWM8',
          phoneNumber: '0212 550 71 50',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bahçelievler',
        ),
        Halisaha(
          name: 'Yaşam Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/CY4DkM3dZyH3aEzz8',
          phoneNumber: '0212 474 20 26',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bahçelievler',
        ),
        Halisaha(
          name: 'Çağrı Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/8cXRqYb5EeoVQvNq6',
          phoneNumber: '0212 550 59 70',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bahçelievler',
        ),
        Halisaha(
          name: 'Olimpik Spor Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/AJXHZmZGnJLjmAVP6',
          phoneNumber: '05349262928',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bahçelievler',
        ),
        Halisaha(
          name: 'Kuyumcukent Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/ZzwnQxqQSncZTH7n8',
          phoneNumber: '05327915841',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bahçelievler',
        ),
        Halisaha(
          name: 'Burak Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/w1P8eesogCYgLW4d6',
          phoneNumber: '0212 651 94 15',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bahçelievler',
        ),
        Halisaha(
          name: 'Yenibosna Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/aQYoXwVTCmraxuQMA',
          phoneNumber: '02124843800',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bahçelievler',
        ),
        Halisaha(
          name: 'Hacıoğlu Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/wxXeR88NFEocjKxq6',
          phoneNumber: '05073215751',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bahçelievler',
        ),
        Halisaha(
          name: 'Best Spor Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/K2JefZi2BGtRrAJo7',
          phoneNumber: '05492500561',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Bahçelievler',
        ),
      ],
      'Güngören': [
        Halisaha(
          name: 'Oktay Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/XM2AWVesZdM6TuWQ6',
          phoneNumber: '02125059095',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Güngören',
        ),

        Halisaha(
          name: 'Lider Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/cZVp8kjph881e4HB7',
          phoneNumber: '02125628080',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Güngören',
        ),
        Halisaha(
          name: 'Altınova Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/GsR7kLzbc5rpEe6R9',
          phoneNumber: '0212 600 87 00',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Güngören',
        ),
        Halisaha(
          name: 'Şampiyon 90 Halısahası',
          latitude: 40.97297,
          longitude: 29.15019,
          mapLink: 'https://maps.app.goo.gl/xQK7JWDDkjk9qLpL9',
          phoneNumber: '02125690612',
          primaryImageUrl: 'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          imageUrls: [
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
            'https://th.bing.com/th/id/OIG2.baoCTFoEvQFW51Lk2gew?pid=ImgGn',
          ],
          isIndoor: true,
          hasShower: true,
          hasParking: true,
          city: 'İstanbul',
          district: 'Güngören',
        ),
      ],
    },
  };

  void navigateToListPage(BuildContext context) {
    if (selectedCity != null && selectedDistrict != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ListPage(
            city: selectedCity!,
            district: selectedDistrict!,
            data: data,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     // appBar:AppBar(
      //  title: Text('Halı Saha Seçimi'),
     // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/halisahasis.jpg'), // Eklediğiniz resmin yolunu buraya ekleyin
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(

            width: MediaQuery.of(context).size.width*0.94,  // Dış container genişliği
            padding: EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(220, 223, 224, 1), // Arka plan rengi
              borderRadius: BorderRadius.circular(20.0),  // Yuvarlatılmış köşeler
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),  // Gölgelendirme
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Text(
                      'Sporcularla Spor Merkezlerini Buluşturan Platform!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Hemen Halı Saha merkezlerini bul, rezervasyonunu yap.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),  // Boşluk için
                FractionallySizedBox(
                  widthFactor: 0.90, // İç container'ın %75 oranında genişlemesini sağlar
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Beyaz container rengi
                      borderRadius: BorderRadius.circular(30.0), // Oval köşeler
                    ),
                    padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0), // Padding değerleri
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[200], // Arka plan rengi
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down), // Açılır ok simgesi
                            iconSize: 36.0,
                            underline: SizedBox(), // Seçili değer altını kaldır
                            hint: Text(
                              'İl Seçin',
                              style: TextStyle(
                                color: Colors.grey, // İpucu metninin rengi
                                fontSize: 16.0, // İpucu metninin boyutu
                              ),
                            ),
                            value: selectedCity,
                            onChanged: (newValue) {
                              setState(() {
                                selectedCity = newValue!;
                                selectedDistrict = null; // İlçe sıfırlanır
                              });
                            },
                            items: data.keys.map((city) {
                              return DropdownMenuItem<String>(
                                value: city,
                                child: Text(
                                  city,
                                  style: TextStyle(
                                    color: Colors.black, // Seçenek metinlerinin rengi
                                    fontSize: 16.0, // Seçenek metinlerinin boyutu
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),






                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[200], // Arka plan rengi
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down), // Açılır ok simgesi
                            iconSize: 36.0,
                            underline: SizedBox(), // Seçili değer altını kaldır
                            hint: Text(
                              'İlçe Seçin',
                              style: TextStyle(
                                color: Colors.grey, // İpucu metninin rengi
                                fontSize: 16.0, // İpucu metninin boyutu
                              ),
                            ),
                            value: selectedDistrict,
                            onChanged: (newValue) {
                              setState(() {
                                selectedDistrict = newValue!;
                              });
                            },

                            items: selectedCity != null
                                ? data[selectedCity!]!.keys.map((district) {
                              return DropdownMenuItem<String>(
                                value: district,
                                child: Text(
                                  district,
                                  style: TextStyle(
                                    color: Colors.black, // Seçenek metinlerinin rengi
                                    fontSize: 16.0, // Seçenek metinlerinin boyutu
                                  ),
                                ),
                              );
                            }).toList()
                                : [],
                          ),
                        ),




                        SizedBox(height: 16),
                        FractionallySizedBox(
                          widthFactor: 0.90,
                          child: ElevatedButton(
                            onPressed: selectedCity != null && selectedDistrict != null
                                ? () {
                              navigateToListPage(context);
                            }
                                : null,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(55, 228, 129, 1), // Arka plan rengi
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.search,color: Colors.white,), // Arama ikonu
                                SizedBox(width: 8),
                                Text('Saha Ara',style: TextStyle(color: Colors.white),), // Düğme metni
                              ],
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
      ),









    );
  }
}
