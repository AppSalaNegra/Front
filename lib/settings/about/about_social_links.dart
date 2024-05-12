import 'package:flutter/material.dart';
import 'package:sala_negra/utilities/app_fonts.dart';
import 'package:sala_negra/utilities/social_logos.dart';

class AboutSocialLinks extends StatelessWidget{
  
  const AboutSocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Text(
              '¡Encuéntranos!', style: AppFonts.largeFont,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {

                },
                icon: const Icon(
                  SocialLogos.whatsapp,
                  color: Colors.black,
                  size: 35,
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(
                    SocialLogos.facebook,
                    color: Colors.black,
                    size: 35,
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(
                    SocialLogos.instagram,
                    color: Colors.black,
                    size: 35,
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(
                    SocialLogos.twitterx,
                    color: Colors.black,
                    size: 35,
                    ),  
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(
                    SocialLogos.youtube,
                    color: Colors.black,
                    size: 45,
                    ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}