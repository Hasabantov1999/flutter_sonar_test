part of "../__init__.dart";

ThemeData get _appLightTheme => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: LightColors().primary,
      scaffoldBackgroundColor: LightColors().scaffoldBgColor,
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: LightColors().primary,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.black.withOpacity(0.35),
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(
          color: LightColors().primary,
        ),
      ),
      extensions: [
        AppThemeExtensions(
          colors: LightColors(),
        )
      ],
    );
