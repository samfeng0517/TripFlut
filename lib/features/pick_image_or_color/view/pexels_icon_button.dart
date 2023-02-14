import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PexelsIconButton extends StatelessWidget {
  const PexelsIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    String iconUrl = 'https://images.pexels.com/lib/api/pexels.png';

    if (Theme.of(context).brightness == Brightness.dark) {
      iconUrl = 'https://images.pexels.com/lib/api/pexels-white.png';
    }

    return TextButton(
      onPressed: () async => await launchUrlString('https://www.pexels.com'),
      child: CachedNetworkImage(
        imageUrl: iconUrl,
        width: 70,
      ),
    );
  }
}
