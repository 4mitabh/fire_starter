import 'package:fire_starter/ui/components/widgets/glass/glass.dart';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;

  const GlassCard({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bg = Theme.of(context).backgroundColor;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: bg.withAlpha(100),
            border: Border.all(
              color: bg.withAlpha(170),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: child,
      ),
    );
  }
}

/*
// ignore: non_constant_identifier_names
GlassCard(var context) {
  return Glass(
      width: MediaQuery.of(context).size.width * 0.9 - 20,
      height: MediaQuery.of(context).size.height * 0.4 - 20,
      borderRadius: 35,
      blur: 14,
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF0FFFF).withOpacity(0.2),
          Color(0xFF0FFFF).withOpacity(0.2),
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF0FFFF).withOpacity(1),
          Color(0xFFFFFFF),
          Color(0xFF0FFFF).withOpacity(1),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.001),
          Image.network(
            "https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi",
            scale: 1.7,
          ),
          InkWell(
            onTap: () {
              // launchPubDev();
            },
            child: Text(
              'pac',
              style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Text(
            "Published on date",
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.001),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                text: TextSpan(
                  text: 'likes',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nLikes',
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        fontSize: 15.0,
                        color: Colors.white60,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'p',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '/totalPoints',
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text: '\n    Pub Point',
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        fontSize: 15.0,
                        color: Colors.white60,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '%',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nPopularity',
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        fontSize: 15.0,
                        color: Colors.white60,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.001),
          Text(
            "Small Package Discription:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontStyle: FontStyle.italic,
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "details",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'RobotoMono',
                fontStyle: FontStyle.italic,
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.001),
        ],
      ));
}
*/
