import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            // top: true,
            // bottom: true,
            // left: false,
            // right: true,
            minimum: const EdgeInsets.only(top: 50.0),
            child: Column(children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: const [
                    Expanded(
                        flex: 1,
                        child: Image(
                          image: AssetImage('assets/purple_twitter_logo.png'),
                        )),
                    Expanded(
                      flex: 3,
                      child: Text('tweether',
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic)),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/purple_background.jpg'),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "A DECENTRALIZED UNCENSORABLE TWITTER CLONE ON ETHEREUM",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                            height: 100.0,
                            child: Image(image: AssetImage('assets/eth.png'))),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/signup_page',
                                (Route<dynamic> route) => false);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * .6,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  SizedBox(
                                    height: 30.0,
                                    width: 30.0,
                                    child: Image(
                                      image: AssetImage(
                                        "assets/metamask.png",
                                      ),
                                    ),
                                  ),
                                  const Text("Create your account"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "Metamask will automatically open and ask you to confirm a transation."
                          "Please note that creating an account on the Ethereum blockchain costs a small amount of Ether",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ])));
  }
}
