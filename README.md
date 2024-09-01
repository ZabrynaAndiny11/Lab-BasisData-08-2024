# Lab-BasisData-08-2024

# Repositori Tugas Praktikum Basis Data 2024

## Requirements:
Buat akun GitHub (https://github.com/)

## Alur pengumpulan tugas ke repositori ini:

1. *Fork* repositori ini

2. *Clone* repositori hasil *fork* anda

   git clone https://github.com/YOUR_USERNAME/Lab-BasisData-08-2024.git

3. Setelah anda *clone, masuk ke folder hasil **clone* tersebut lalu buat *branch* dengan nama *NIM* anda

   cd Lab-BasisData-08-2024
   git branch NIM_ANDA
   git checkout NIM_ANDA
   git config user.name USERNAME_GITHUB
   git config user.email EMAIL_GITHUB

4. Setelah anda pindah ke *branch* yang telah anda buat, buat sebuah folder dengan nama *NIM* anda dan masuk ke folder tersebut.

   mkdir NIM_ANDA
   cd NIM_ANDA

5. Didalam folder tersebut, buat sebuah folder dengan nama *Praktikum-n, **n* = praktikum keberapa

   mkdir "Praktikum-n"
   cd "Praktikum n"

  CATATAN: n DI SINI ADALAH NOMOR PRAKTIKUM KE BERAPA
  CONTOH: Praktikum-1
  
6. Semua file untuk tugas praktikum ke-*n, disimpan kedalam folder **Praktikum n*
7. Setiap membuat file atau melakukan perubahan, lakukan proses *commit* dengan pesan yang deskriptif

   git add . #perintah ini memilih seluruh file sekaligus
   # atau
   git add "Praktikum n/NIM/FileYangBerubahAtauDitambahkan" #perintah ini memilih file tertentu
   git commit -m "pesan mengenai penambahan atau perubahan apa yang anda lakukan"
   
   
8. Setelah asistensi dan tugas anda disetujui, *push* seluruh file jawaban yang telah anda buat

   # pastikan proses commit telah selesai terhadap setiap file
   git push origin NIM_ANDA

   Jika sebelumnya anda belum pernah menghubungkan Git di komputer anda dengan akun GitHub anda, maka anda akan diminta untuk mengisi username dan password untuk
   melakukan push ke repo GitHub anda.

   # username = username anda
   # password = persocal access token anda

   Cara membuat personal access token:
   #1. Klik profile anda pada pojok kanan atas GitHub
   #2. Pilih menu settings
   #3. Scroll ke bagian bawah dan pilih menu Dveloper settings
   #4. Pilih Prsonal access tokens
   #5. Pilih Generate new tokes
   #6. Tuliskan note untuk token anda (ex: Token for Lab-BasisData-08-2024)
   #7. Atur waktu expiration token anda (sesuai keinginan anda)
   #8. Pada select scope, ceklis box repo
   #9. Klik generate new token
   #10. Pastikan untuk meng-copy token anda dan menyimpannya, karena token hanya bisa diliat sekali (*Jika hilang, buat token baru)

   
   
9. Masuk ke akun GitHub anda, dan buka repo yang telah anda *fork* dan *clone*. Lihat perubahan yang terjadi pada repo tersebut dan pastikan bahwa tugas yang
   telah anda *push* sesuai dan berada pada repo tersebut.
   
10. Pilih menu *Pull request* dan lakukan *pull request* pada tugas praktikum anda.


## Hal-hal yang harus diperhatikan:

Cara mengumpulkan tugas sesuai dengan aturan diatas.
Satu Soal, Satu File.
Satu Praktikum, Satu Folder.
Program Berjalan dengan Baik dan Benar Berdasarkan Ketentuan Tugas.
Tugas Sudah di Asistensikan dan Mendapat Acc.
