import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class ReadChapitre extends StatefulWidget {
  final String  chap;
  final String title;

  const ReadChapitre({Key key, this.title,this.chap}) : super(key: key);
  @override
  _ReadChapitreState createState() => _ReadChapitreState();
}

class _ReadChapitreState extends State<ReadChapitre> {
   PDFDocument _doc;
   bool _loading;

  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(widget.chap);
    setState(() {
      _doc = doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewer(
              document: _doc,
              showIndicator: true,
              showPicker: false,
            ),
    );
  }
}