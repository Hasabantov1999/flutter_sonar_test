import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../gen/assets.gen.dart';

class AppMarkerWidget extends StatelessWidget {
  const AppMarkerWidget({
    super.key,
    required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.1),
            ),
          ),
        ),
        Positioned.fill(
          child: FractionallySizedBox(
            widthFactor: 0.7,
            heightFactor: 0.7,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              alignment: Alignment.center,
              child: FractionallySizedBox(
                widthFactor: 0.7,
                heightFactor: 0.7,
                child: SvgPicture.asset(
                  Assets.svgs.map.iconBolt,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
