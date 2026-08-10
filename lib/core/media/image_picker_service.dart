import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerService {
  ImagePickerService._();

  static final ImagePicker _picker = ImagePicker();

  // -----------------------
  // IMAGE - GALLERY
  // -----------------------
  static Future<File?> pickImageFromGallery({
    int imageQuality = 85,
    double? maxWidth,
    double? maxHeight,
  }) async {
    try {
      final granted = await _requestPhotosPermission();
      if (!granted) return null;

      final XFile? file = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );

      return file != null ? File(file.path) : null;
    } catch (e) {
      debugPrint('Gallery Error: $e');
      return null;
    }
  }

  // -----------------------
  // IMAGE - CAMERA
  // -----------------------
  static Future<File?> pickImageFromCamera({
    int imageQuality = 85,
    double? maxWidth,
    double? maxHeight,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    try {
      final granted = await _requestCameraPermission();
      if (!granted) return null;

      final XFile? file = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        preferredCameraDevice: preferredCameraDevice,
      );

      return file != null ? File(file.path) : null;
    } catch (e) {
      debugPrint('Camera Error: $e');
      return null;
    }
  }

  // -----------------------
  // MULTI IMAGE
  // -----------------------
  static Future<List<File>> pickMultipleImages({
    int imageQuality = 85,
    double? maxWidth,
    double? maxHeight,
  }) async {
    try {
      final granted = await _requestPhotosPermission();
      if (!granted) return [];

      final files = await _picker.pickMultiImage(
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );

      return files.map((e) => File(e.path)).toList();
    } catch (e) {
      debugPrint('Multi Image Error: $e');
      return [];
    }
  }

  // -----------------------
  // VIDEO
  // -----------------------
  static Future<File?> pickVideo({
    bool fromCamera = false,
    Duration? maxDuration,
  }) async {
    try {
      if (fromCamera) {
        final granted = await _requestCameraPermission();
        if (!granted) return null;
      }

      final XFile? file = await _picker.pickVideo(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
        maxDuration: maxDuration,
      );

      return file != null ? File(file.path) : null;
    } catch (e) {
      debugPrint('Video Error: $e');
      return null;
    }
  }

  // -----------------------
  // PERMISSIONS (FIXED)
  // -----------------------
  static Future<bool> _requestCameraPermission() async {
    final status = await Permission.camera.request();

    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }

    return status.isGranted;
  }

  static Future<bool> _requestPhotosPermission() async {
    if (await Permission.photos.isGranted ||
        await Permission.photos.isLimited) {
      return true;
    }

    final status = await Permission.photos.request();

    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }

    return status.isGranted || status.isLimited;
  }
}
