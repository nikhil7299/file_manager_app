import 'package:flutter/material.dart';

class FolderModel {
  final Color color;
  final String folderName;
  final String folderInfo;

  FolderModel({
    required this.color,
    required this.folderName,
    required this.folderInfo,
  });
}

List<FolderModel> recentFolders = [
  FolderModel(
      color: Colors.deepPurple.shade300,
      folderName: "Dribbles",
      folderInfo: "38 files, 2.9 GB"),
  FolderModel(
      color: Colors.orange,
      folderName: "Illustrations",
      folderInfo: "53 files, 2.2 GB"),
  FolderModel(
      color: Colors.pink.shade300,
      folderName: "Fav Songs",
      folderInfo: "10 files, 55 MB"),
  FolderModel(
      color: Colors.blue, folderName: "Mockup", folderInfo: "41 files, 485 MB"),
];
