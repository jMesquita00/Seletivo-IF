import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  final String pdfUrl;

  const PdfViewerScreen({
    super.key,
    required this.pdfUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF'),
      ),
      body: SfPdfViewer.network(
        pdfUrl,
        onDocumentLoaded: (PdfDocumentLoadedDetails details) {
          print('PDF carregado: ${details.document.pages.count} páginas');
        },
        onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
          print('Falha ao carregar: ${details.error}');
        },
      ),
    );
  }
}