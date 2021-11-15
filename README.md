# Shortly

## Kullandığım paketler

* [Get](https://pub.dev/packages/get) (Route&state managment)
* [flutter_svg](https://pub.dev/packages/flutter_svg) (Svg gösterimi)
* [carousel_slider](https://pub.dev/packages/carousel_slider) (Welcome sayfası slider gösterimi)
* [http](https://pub.dev/packages/http) (Api bağlantısı)
* [string_validator](https://pub.dev/packages/string_validator) (Url doğrulaması)
* [fluttertoast](https://pub.dev/packages/fluttertoast) (Toast mesajı)
* [sqflite](https://pub.dev/packages/sqflite) (Veritabanı)
* [clipboard](https://pub.dev/packages/clipboard) (Bağlantı kopyalama)

## Apk dosyası

* [app-release.apk](https://github.com/fluttertests/grisoft_code_challange/blob/main/demo/app-release.apk) 

## Uygulama önizlemesi

<p float="left">
  <img src="demo/1.png" width="100" />
  <img src="demo/2.png" width="100" />
  <img src="demo/3.png" width="100" />
  <img src="demo/4.png" width="100" />
  <img src="demo/5.png" width="100" />
</p>



Assets erişim
Const asset yolları, tek seferde tekrar erişim
Flutter svg paketi
Getx route management
Slider
Tekrarlanan arayüz widgetları tek classdan



## Uygulamanın hazırlanışı
İlk iş olarak uygulamada kullanılacak olan görselleri [assets](https://github.com/fluttertests/grisoft_code_challange/tree/main/assets) klasörüne yükleyip [pubspec.yaml](https://github.com/fluttertests/grisoft_code_challange/blob/main/pubspec.yaml) dosyasından assets klasörüne erişim izni verdim.

Daha sonra uygulamanın arayüzünü design klasörü ve demo videosuna göre kodlamaya başladım. Buton, slider widget'ı gibi birden fazla kez kullanılacak widgetları [view/component](https://github.com/fluttertests/grisoft_code_challange/tree/main/lib/view/component) klasöründe sakladım.

Arayüz tamamlandıktan sonra butonlara işlevler atamaya başladım. Veritabanı ve api bağlantısını kurdum.