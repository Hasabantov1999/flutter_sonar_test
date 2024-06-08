// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_theme_extensions.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$ThemeExtensionMixin on ThemeExtension<AppThemeExtensions> {
  @override
  ThemeExtension<AppThemeExtensions> copyWith({
    AppColors? colors,
  }) {
    final object = this as AppThemeExtensions;

    return AppThemeExtensions(
      colors: colors ?? object.colors,
    );
  }

  @override
  ThemeExtension<AppThemeExtensions> lerp(
    ThemeExtension<AppThemeExtensions>? other,
    double t,
  ) {
    final otherValue = other;

    if (otherValue is! AppThemeExtensions) {
      return this;
    }

    return AppThemeExtensions(
      colors: otherValue.colors,
    );
  }

  @override
  bool operator ==(Object other) {
    final value = this as AppThemeExtensions;

    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppThemeExtensions &&
            identical(value.colors, other.colors));
  }

  @override
  int get hashCode {
    final value = this as AppThemeExtensions;

    return Object.hash(
      runtimeType,
      value.colors,
    );
  }
}

extension AppThemeExtensionsBuildContext on BuildContext {
  AppThemeExtensions get appThemeExtensions =>
      Theme.of(this).extension<AppThemeExtensions>()!;
}
