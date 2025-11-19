import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class CrossPlatformDropzone extends StatefulWidget {
  const CrossPlatformDropzone({super.key});

  @override
  _CrossPlatformDropzoneState createState() => _CrossPlatformDropzoneState();
}

class _CrossPlatformDropzoneState extends State<CrossPlatformDropzone> {
  late DropzoneViewController controller;
  Uint8List? fileBytes;
  String? fileName;
  bool isHovered = false;

  static const int maxFileSize = 50 * 1024 * 1024; // 50MB

  // Mobile file picker
  Future<void> pickFileMobile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.image,
    );

    if (result != null && result.files.isNotEmpty) {
      final picked = result.files.first;
      if (picked.size > maxFileSize) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('File exceeds 50MB limit'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      setState(() {
        fileBytes = picked.bytes;
        fileName = picked.name;
      });
    }
  }

  // Web click-to-upload
  Future<void> pickFileWeb() async {
    if (!kIsWeb) return;
    final ev = await controller.pickFiles(mime: ['image/*'], multiple: false);
    if (ev.isEmpty) return;

    final bytes = await controller.getFileData(ev.first);
    final name = await controller.getFilename(ev.first);

    if (bytes.length > maxFileSize) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('File exceeds 50MB limit'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      fileBytes = bytes;
      fileName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: kIsWeb ? pickFileWeb : pickFileMobile,
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: isHovered
              ? Colors.grey[800]
              : const Color(0xFF0080DC).withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            if (kIsWeb)
              DropzoneView(
                onCreated: (ctrl) => controller = ctrl,
                onHover: () => setState(() => isHovered = true),
                onLeave: () => setState(() => isHovered = false),
                onDrop: (ev) async {
                  setState(() => isHovered = false);
                  final bytes = await controller.getFileData(ev);
                  final name = await controller.getFilename(ev.first);

                  if (bytes.length > maxFileSize) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('File exceeds 50MB limit'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  setState(() {
                    fileBytes = bytes;
                    fileName = name;
                  });
                },
              ),
            // Dashed border overlay and content
            Center(
              child: DottedBorder(
                color: Color(0xFF444444),
                strokeWidth: 2,
                dashPattern: [8, 4],
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: fileBytes != null
                      ? Image.memory(fileBytes!, fit: BoxFit.cover)
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Image
                            Image.asset(
                              '/images/upload.png',
                              width: 36, // adjust size as needed
                              height: 30,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 6),

                            // Texts
                            Text(
                              'Drag & drop',
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'or select files from device',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'max. 50MB',
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
