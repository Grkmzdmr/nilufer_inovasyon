------------------------------------KAZANIMLAR VE PROJE AKIŞI--------------------------------------------------------------------------

İlk olarak hazırlanan projeyi temizliyoruz.

 

Kullanacağım Kısayollar :

 

Ctrl+Ö yorum satırına alıp, kaldırma,

Ctrl+Boşluk widgetin özelliklerini görüntülemek,

Ctrl+Nokta yapabileceğimiz aksiyonları görüntülemek ve widgetı sarmalama işlemlerini kullanabilmek.

Ctrl+S kayıt etmek

 

MyApp oluşturuyoruz.

 

Uygulamamızı MaterialApp ile sarmalıyoruz. MaterialApp'in ne işe yaradığını öğreniyoruz

    -  Flutter uygulamasının genel tasarımını ve yapılandırmasını belirlemek için kullanılır.

 

MaterialApp'in içine container veriyoruz ve tasarım bozukluğunu gözlemliyoruz.

    - Scaffold olmadan widgetlar tasarım özelliklerine kavuşamıyor.

 

Scaffold'un ne işe yaradığını öğreniyoruz.

    - Scaffold, bir Flutter uygulamasının temel yapı taşlarından biridir ve genellikle bir ekranın temel tasarımını ve düzenini belirlemek için kullanılır.

 

Sayfalar klasörü oluşturuyoruz. Sebebi sayfalarımızın düzenli durması.

 

Giriş Yap sayfasını oluşturuyoruz

 

Scaffold'un elementlerini öğreniyoruz.

    - AppBar, BottomNavigationBar, Body vb.

 

Login sayfasına container içinde 'Merhaba Dünya' textini basıyoruz.

 

SafeArea widgetını öğreniyoruz.

    - Bu widget, cihazın ekranındaki çeşitli kenarlık bölgelerinin (örneğin, üst, alt, sol, sağ) içeriği kaplamamasını sağlar

 

Sizedbox widgetını öğreniyoruz.

    - SizedBox widget'ı, bir Flutter uygulamasındaki arayüz elemanlarının boyutunu belirlemek veya arasındaki boşluğu ayarlamak için kullanılır.

 

const kelimesi ne işe yarar öğreniyoruz.

    - Performans geliştirmesi için kullanılır bir widgetın yaşam döngüsü boyunca değişmeyeceğini programa önceden belirtmiş oluruz.

    -// ignore_for_file: prefer_const_constructors ile bu derse özel bu uyarıyı kapatıyoruz.

 

Column ve Row widgetı ne işe yarar onu öğreniyoruz.

    - Widgetları dikey ya da yatay düzeyde sıralamaya yarar.


 -Svg paketini ogreniyoruz ve ekliyoruz.

Text widgetının style özelliğini öğreniyoruz

    - Bu sayede widget'ın özelliklerini değiştirebiliyoruz, bunun dışında Theme.of(context).textTheme. alternatifini öğreniyoruz.

 

TextField widgetını öğreniyoruz.

    - Widgetın sınırlarını vermediğimiz için uygulamanın hata vermesini gözlemliyoruz.

    - decoration kısmını öğreniyoruz.

    - OutlineInputBorder'ı öğreniyoruz

    -OutlineInputBorder(

                      borderSide: BorderSide(color: Colors.blue),

                      borderRadius: BorderRadius.circular(10.0),

                    ),

 

- resizeToAvoidBottomInset komutunu öğreniyoruz.

    - Klavye çakışmalarını önlemek için sayfa yeniden ölçeklenir.



-TextButton'u öğreniyoruz.

 

-TextDecoration'ı öğreniyoruz

    - textimizin altına çizgi ekleyebiliriz.

 

-Giriş sayfamızın tasarımı hazır.

 

- Sizer paketini öğreniyoruz

    - Kullanma sebebimiz responsive tasarım yapabilmek.
    - main.dart'ı sizer ile sarmalıyoruz.

 

- Kayıt Ol Sayfasını oluşturuyoruz.

 

- Çoğu elementi giriş sayfasından kopyalıyoruz.

 

- Şifre tekrar widgetını ekliyoruz.

 

- Navigasyon işlemlerini öğreniyoruz.

    - Push, Pop , Push Replacement'ları tanıyoruz.

 

Buraya kadar yaptıklarımızı tartışıyoruz.

 

-Services klasörü oluşturuyoruz.

 

-api_services.dart sayfasını oluşturuyoruz.

    - Artık dış dünyayla haberleşeceğimiz aşamadayız.

 

- fonksiyonları yönetebilmemiz adına sadece fonksiyon isimlerinin bulunduğu bir abstract class oluşturuyoruz.

 

- fonksiyonların işlevselliğini yazmak için de yeni bir class oluşturup abstract classdan implement ediyoruz.

   

-Login fonksiyonu yazarken Future yapısını öğreniyoruz.

    - Models klasörünü ve LoginResponse modelini oluşturuyoruz.

 

-Http paketini tanıyoruz ve ekliyoruz.


-Giriş yap fonksiyonumuzu yazmaya başlıyoruz. 

-ApiUrl tanımlıyoruz

    - https://reqres.in/api/login bizim uygulamamızda kullandığımız örnek adres


-Sonuç olarak döneceğimiz modelimizi tanımlıyoruz.
    -varsayılan deger olarak false veriyoruz.


-http.post islemini cagırıyoruz.

-Dönen cevapta statusCode kontrolü yapıyoruz ve buna göre işlem sonucunu döneceğiz.

-İşlem başarılıysa json.decode komutuyla dönen cevabı ayrıştırıp içerisinde 'token' anahtar kelimesiyle bize dönen değeri alıyoruz.

-Giriş yap sayfasında ApiServicesden bir nesne oluşturup fonksiyonları kullanabilir hale getiriyoruz.


-Giriş yap sayfasında texteditingcontroller oluşturup ne işe yaradıklarını öğreniyoruz.


-Giriş yap fonksiyonunu kullanmayı öğreniyoruz. 


-.then methodunun ne işe yaradığını öğreniyoruz.
    -Dart dilinde, then metodu, bir Future nesnesinin tamamlandığında (yani başarıyla tamamlandığında veya hata aldığında) belirli bir işlemi gerçekleştirmek için kullanılır.

- Snackbar'ı öğreniyoruz ve dönen cevaba göre kullanıyoruz.
    - Snackbar, bir uygulama içinde geçici bir bildirim veya kullanıcıya bilgi vermek için kullanılan bir arayüz öğesidir.


- Ana sayfayı oluşturuyoruz.

- Listview.builder, card ve listtile widgetlarını öğreniyoruz.
    
    -Flutter'da ListView.builder, dinamik bir liste oluşturmak için kullanılan bir widget'tir. Bu widget, veri kaynağından (genellikle bir liste) gelen verilere dayalı olarak liste elemanlarını oluşturmanıza ve görüntülemenize olanak tanır.

    -Card widget'ı, genellikle bir kutu içinde bir içerik parçasını sarmak ve bu içeriği düzenli ve stilize bir şekilde görüntülemek için kullanılır.

    -ListTile, genellikle bir satırda görünen bir öğeyi temsil eder ve tipik olarak başlık, alt başlık, bir ikon veya öğeye tıklanabilirlik gibi özellikleri içerir.


- Örnek olarak 5 adet card basıyoruz ekrana.

-AppBar widgetını öğreniyoruz.
    - AppBar, genellikle üst kısımda bulunan bir arayüz öğesidir ve uygulama veya web sitesinin başlık, menüler, arama çubuğu ve diğer önemli kontrolleri içerebilir.


-IconButton widgetını öğreniyoruz.
    - Icon şeklinde buton.

-GetHome fonksiyonunu yazmaya başlıyoruz.
    - HomeResponse ve HomeDataResponse'ı bize dönecek data ışığında oluşturuyoruz.


- InitState methodunu öğreniyoruz.
    -getHome methodunu çalıştırıyoruz.

- HomeDataResponse için fromJson methodu yaziyoruz.


- StreamBuilder ve StreamController'ı öğreniyoruz.













