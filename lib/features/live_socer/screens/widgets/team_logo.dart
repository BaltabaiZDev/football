import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TeamLogo extends StatelessWidget {
  final String? logoUrl;

  const TeamLogo({super.key, this.logoUrl});

  @override
  Widget build(BuildContext context) {
    if (logoUrl == null || !logoUrl!.startsWith("http")) {
      return Image.asset('assets/images/df.png', width: 80, height: 80, fit: BoxFit.contain);
    }
    return CachedNetworkImage(
      imageUrl: logoUrl!,
      placeholder: (context, url) => const SizedBox(width: 80, height: 80, child: CircularProgressIndicator()),
      errorWidget:
          (context, url, error) => Image.asset('assets/images/df.png', width: 80, height: 80, fit: BoxFit.contain),
      width: 80,
      height: 80,
      fit: BoxFit.contain,
    );
  }
}
