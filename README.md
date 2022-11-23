# Assignment 7

## Stateless widget and Stateful widget.
Stateless widget adalah widget pada flutter yang tidak pernah berubah sejak app dibuild. Widget ini bersifat immutable. Contohnya adalah Text dan Icon. 

Sedangkan stateful widget adalah widget pada flutter yang dapat berubah ketika. Widget ini bersifat mutable dan dapat berubah terus seiring berjalannya app. Contohnya adalah TextField, RadioButton, Checkbox, dll.

## Widgets that being used in this project.
1. **Container** type widget seperti Coloumn, Row, Padding, dan Align. Fungsinya adalah sebagai tempat untuk meletakkan widget lain dengan aturan-aturan tertentu seperti Row yang meletakkannya secara berbaris.
2. **Visibility**. Fungsinya sebagai container yang dapat diatur visibility dari child-nya. Digunakan untuk implementasi bonus.
3. **FloatingActionButton**. Fungsinya sebagai button yang menempel di layar.
4. **Icon**. Fungsinya untuk menampilkan icon.
5. **Text**. Fungsinya untuk menampilkan text.
6. **TextStyle**. Fungsinya untuk mendefinisikan style dari suatu text.

## What is the function of setState()? Explain what variables can be affected by the function.
function `setState()` adalah function yang dipanggil untuk memberitahu Flutter Framework jika sesuatu telah berubah di dalam state (dalam case app ini, state HomePageState) sehingga meminta app untuk build ulang state tersebut untuk apply perubahan.

fungsi ini bisa merubah keseluruhan attribute/property instance dari state (dalam case ini, state dari HomePage) seperti variable _counter.

## Explain the difference between const and final.
Value dari **const** diinitialized ketika compile-time. Jadi, value dari **const** sudah harus ada saat compile-time.
Sedangkan value dari **final** baru diinitialized ketika run-time sehingga value dari **final** dapat berisi code yang akan mereturn nilai saat run-time.

Contoh ilustrasinya:
```
final String date = DateTime.now().toString() // oke

const String date = "01/01/2022" // oke

const String date = DateTime.now().toString() // akan menyebabkan error
```

## Explain how you implement the checklist above.
1. buat app baru dengan `flutter create counter_7`
2. membuat function baru `decrementCounter` pada class _HomePageState yang melakukan `setState()` yabg didalamnya mengurangi value `_counter` jika value tidak nol
3. membuat conditional statement untuk widget text yang menampilkan **EVEN** jika genap dan **ODD** jika ganjil
4. mendefinisikan property floatingactionbutton dari Scaffold yang berisi widget Padding yang didalamnya ada Row yang berisi button increment dan decrement.
5. membungkus button decrement dengan widget Visibility dan mendefinisikan status visible sesuai value `_counter` (jika `counter` 0. maka visibile = false)
6. melakukan git add, commit, dan push.


# Assignment 8

## Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement`.
`Navigator.push` akan "menimpa" halaman baru di atas halaman sebelumnya. Layaknya struktur data stack, untuk kembali ke halaman sebelumnya memerlukan `Navigator.pop`.
Dedangkan `Navigator.pushReplacement` akan menggantikan halaman lama dengan halaman baru. Halaman lama akan otomatis di-pop setelah halaman baru berhasil dirender secara asyncronus

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- `Drawer`: widget navigasi yang dapat disembunyikan pada samping layar.
- `ListTile`: widget container yang terdapat property berguna seperti leading dan trailing.
- `ListView`: widget container scrollable yang berguna untuk menampung banyak baris widget.
- `TextFormField`: widget form untuk input berupa text.
- `DropdownButtonFormField`: widget form untuk input berupa pilihan yang dapat di-dropdown.
- `DateTime`: widget representatif dari sistem penanggalan.
- `TextEditingController`: widget yang membantu mengontrol text yang terdapat pada TextFormField dan DropdownButtonFormField.

## Sebutkan jenis-jenis event yang ada pada Flutter
- `onPressed`: event yang akan dipanggil ketika sebuah button diklik
- `onChanged`: event yang dipanggil ketika terjadi sebuah perubahan pada widget, misalnya perubahan value input pada TextFormField.
- `onSaved`: event yang dipanggil ketika sebuah form di-save.

## Jelaskan bagaimana cara kerja `Navigator` dalam "mengganti" halaman dari aplikasi Flutter
`Navigator` mengganti halaman dengan memanfaatkan sebuah `Stack`. Halaman yang ditampilkan di paling atas (dilihat oleh user) adalah halaman yang terdapat pada top of stack. Mengganti halaman dapat memanfaatkan `push` untuk menimpa halaman sebelumnya, `pushReplacement` untuk mengganti halaman sebelumnya, `pop` untuk menghapus halaman yang sedang ditampilkan ke user.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas
- Membuat widget `Drawer` yang berisi tombol navigasi ke halaman counter_7, form, dan list budget.
- Membuat file `budget_data.dart` yang berisi listBudget yang akan menyimpan semua budget yang telah diinput user. Dibuat juga class Budget untuk memudahkan penyimpanan data.
- Menambahkan halaman baru yang berisi form pada sebuah file `budget_form.dart`. Di halaman ini terdapat widget input judul, nominal, jenis, tanggal, dan button untuk menyimpan.
- Menambahkan halaman baru yang berisi list budget yang sudah ditambahkan pada sebuah file `budget_list.dart`. Pada halaman ini terdapat semua data yang sudah diinput user pada halaman form.


# Assignment 9

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Bisa dengan menggunakan ```manual serialization``` built-in JSON decoder dari ```dart:convert```. Kita bisa gunakan jsonDecode untuk mengubah ```raw JSON``` menjadi ```Map<String, dynamic>```.

Namun, membuat model akan lebih baik karena meminimalisir ```field typo``` sehingga tidak akan error saat runtime serta memudahkan maintaining code jika ada perubahan field pada data.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

- Column : widget yang menampilkan widgets children dalam format kolom vertikal<br>
- Row : widget yang menampilkan widgets children dalam format baris horizontal<br>
- Text : widget untuk menampilkan string<br>
- Drawer : widget untuk menampilkan tautan navigasi<br>
- Padding : widget untuk memberikan padding<br>
- Container : widget multifungsi yang bisa digunakan untuk mengatur ukuran serta posisi dari widgets lainnya<br>
- SizedBox : kotak dengan ukuran tertentu<br>
- ListView : display children satu per satu
- Checkbox : input checkbox bernilai true/false<br>
- FutureBuilder : builder berdasarkan objek Future secara asynchronous
- 

## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.

1. Lakukan ```flutter pub add http``` pada terminal proyek Flutter untuk menambahkan package http dan potongan kode ```<uses-permission android:name="android.permission.INTERNET" />``` pada ```android/app/src/main/AndroidManifest.xml``` untuk enable permission internet access ke app kita.
2. Membuat model pada ```model/mywatchlist.dart``` menggunakan ```https://app.quicktype.io/```.
3. Melakukan pengambilan data menggunakan method ```http.get```.
4. Mengkonversikan objek yang didapatkan menjadi model yang telah kita buat.
5. Menampilkan data pada Flutter menggunakan ```FutureBuilder```.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas
- Menambahkan `mywatchlist` ke `Drawer` untuk navigasi ke page tersebut.
- Membuat model ```MyWatchList``` pada ```model/mywatchlist.dart``` menggunakan ```https://app.quicktype.io/```.
- Membuat method untuk fetch data dari ```https://tugas2dafi.herokuapp.com/mywatchlist/json/``` pada ```api/fetch_watch_list.dart```.
- Menampilkan data pada Flutter menggunakan ```FutureBuilder```.
- Membuat ```pages/mywatchlist_detail.dart``` sebagai halaman detail untuk tiap watchlist.
