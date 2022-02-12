import 'dart:io';

class ModelUser {
  ModelUser(
      {this.nama,
      this.alamat,
      this.tanggallahir,
      this.tinggi,
      this.berat,
      this.foto});
  String? nama;
  String? alamat;
  String? tanggallahir;
  int? tinggi;
  int? berat;
  File? foto;
}
