import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_groceries_shop_app_flutter_admin/view/login/login_view.dart';


import '../../common_widget/round_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode( SystemUiMode.leanBack );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            "assets/img/welcom_bg.jpg",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
          
              children: [

               

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      "Welcome\nto our store",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      "Commitment to Authentic Products",
                      style: TextStyle(
                          color: const Color(0xffFCFCFC).withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),


                const SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RoundButton(title: "Start Now", onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInView() ) );
                  },),
                ),
                

                const SizedBox(height: 46,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
