import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

abstract final class FilePickerService {
  FilePickerService._();

  static const List<String> imageExtensions = ['jpg', 'jpeg', 'png'];
  static const List<String> pdfExtensions = ['pdf'];

  static const List<String> imageOrPdfExtensions = [
    ...imageExtensions,
    ...pdfExtensions,
  ];

  /// Pick single file
  static Future<PlatformFile?> pick({
    required List<String> extensions,
    bool withData = false,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: extensions.map((e) => e.toLowerCase()).toList(),
        withData: withData,
      );

      if (result == null || result.files.isEmpty) return null;

      return result.files.first;
    } catch (e) {
      debugPrint('FilePicker Error: $e');
      return null;
    }
  }

  static Future<PlatformFile?> pickImage() {
    return pick(extensions: imageExtensions);
  }

  static Future<PlatformFile?> pickPdf() {
    return pick(extensions: pdfExtensions);
  }

  static Future<PlatformFile?> pickImageOrPdf() {
    return pick(extensions: imageOrPdfExtensions);
  }

  static bool isPdf(PlatformFile file) {
    return file.extension?.toLowerCase() == 'pdf';
  }

  static bool isImage(PlatformFile file) {
    return imageExtensions.contains(file.extension?.toLowerCase());
  }
}