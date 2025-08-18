import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class MainWebPage extends StatelessWidget {
  const MainWebPage({super.key});

  // URLs
  final String googleUrl = "https://www.google.com";
  final String facebookUrl = "https://www.facebook.com";
  final String twitterUrl = "https://www.twitter.com";

  // Open URL function
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: SizedBox(
                height: 40,
                width: 40,
                child: SvgPicture.asset(
                  "assets/icons/google-icon.svg",
                  fit: BoxFit.contain,
                ),
              ),

              onPressed: () => _launchURL(googleUrl),
            ),
            SizedBox(width: 5),
            IconButton(
              icon: SizedBox(
                height: 40,
                width: 40,
                child: SvgPicture.asset(
                  "assets/icons/facebook-2.svg",
                  fit: BoxFit.contain,
                ),
              ),

              onPressed: () => _launchURL(facebookUrl),
            ),
            SizedBox(width: 5),
            IconButton(
              icon: SizedBox(
                height: 40,
                width: 40,
                child:  SvgPicture.asset(
                  "assets/icons/twitter.svg",
                  fit: BoxFit.contain,
                ),
              ),

              onPressed: () => _launchURL(twitterUrl),
            ),
          ],
        )
      ],
    );
  }
}
