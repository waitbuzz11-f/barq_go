import 'package:flutter/material.dart';

abstract final class ColorsManager {
  // =========================
  // Core Colors
  // =========================

  static const Color brandPrimary = Color(0xFFFFCC03);
  static const Color textPrimary = Color(0xFF0F0F0F);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color background = Color(0xFFF7F7F7);
  static const Color surfacePrimary = Color(0xFFFFFFFF);
  static const Color surfaceSecondary = Color(0xFFEFEFEF);
  static const Color border = Color(0xFFE2E2E2);
  // =========================
  // Status Colors
  // =========================
  static const Color success = Color(0xFF16A34A);
  static const Color danger = Color(0xFFDC2626);

  // =========================
  // Dark Theme Colors
  // =========================
  static const Color darkBackground = Color(0xFF0F0F0F);
  static const Color darkSurface = Color(0xFF1A1A1A);
  static const Color darkInput = Color(0xFF111111);
  static const Color darkLight = Color(0xFF000000);

  // =========================
  // Category Accent Colors
  // =========================
  static const Color categoryRide = Color(0xFFFFCC03);
  static const Color categoryTransport = Color(0xFF6366F1);
  static const Color categoryParcel = Color(0xFF0EA5E9);
  static const Color categoryInterCity = Color(0xFFF59E0B);
}
