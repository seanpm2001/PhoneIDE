import 'package:flutter/material.dart';
import 'package:flutter_code_editor/controller/editor_view_controller.dart';

class FileIDE extends StatefulWidget {
  const FileIDE(
      {Key? key,
      required this.fileName,
      required this.filePath,
      required this.fileContent,
      required this.parentDirectory})
      : super(key: key);

  final String fileName;
  final String filePath;
  final String fileContent;
  final String parentDirectory;
  @override
  State<StatefulWidget> createState() => FileIDEState();

  static Map<String, dynamic> fileToMap(FileIDE file) {
    Map<String, dynamic> fileMap = {
      "fileName": file.fileName,
      "fileContent": file.fileContent,
      "filePath": file.filePath,
      "parentDirectory": file.parentDirectory
    };

    return fileMap;
  }

  factory FileIDE.fromJSON(Map<String, dynamic> data) {
    return FileIDE(
      fileContent: data["fileContent"],
      fileName: data["fileName"],
      filePath: data["filePath"],
      parentDirectory: data["parentDirectory"],
    );
  }
}

class FileIDEState extends State<FileIDE> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(left: BorderSide(width: 1, color: Colors.grey))),
      child: ListTile(
          leading: const Icon(Icons.insert_drive_file),
          dense: true,
          title: Text(widget.fileName),
          onTap: () {
            Navigator.pop(context);

            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    transitionDuration: Duration.zero,
                    pageBuilder: (context, animation1, animation2) =>
                        EditorViewController(
                          file: widget,
                          title: widget.fileName,
                        )));
          }),
    );
  }
}
