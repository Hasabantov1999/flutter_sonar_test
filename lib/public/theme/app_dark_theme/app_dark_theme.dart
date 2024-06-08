part of "../__init__.dart";

ThemeData get _appDarkTheme => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: DarkColors().primary,
      scaffoldBackgroundColor: DarkColors().scaffoldBgColor,
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: DarkColors().primary,
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
          color: DarkColors().primary,
        ),
      ),
      extensions: [
        AppThemeExtensions(
          colors: DarkColors(),
        ),
      ],
    );
