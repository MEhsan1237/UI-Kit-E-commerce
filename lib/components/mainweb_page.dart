import 'package:flutter/material.dart';
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
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg",
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
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg",
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
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg",
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
