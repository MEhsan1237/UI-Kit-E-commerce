import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String ,Widget>> profileListItems = [
    { "leading" : SvgPicture.asset("assets/icons/user.svg", width: 20,
      height: 20,
     ),
      "text" :  Text("My Account",style: TextStyle(fontSize: 18,color: Colors.red),),
      "trailing" : SvgPicture.asset("assets/icons/arrow_right.svg",width: 16,color: Colors.red,
        height: 16,),
    },
    { "leading" : SvgPicture.asset("assets/icons/bell.svg", width: 20,
      height: 20,),
      "text" :  Text("Notifications",style: TextStyle(fontSize: 18,color: Colors.red),),
      "trailing" : SvgPicture.asset("assets/icons/arrow_right.svg",width: 16,color: Colors.red,
        height: 16,),
    },
    { "leading" : SvgPicture.asset("assets/icons/settings.svg", width: 20,
      height: 20,),
      "text" :  Text("Settings",style: TextStyle(fontSize: 18,color: Colors.red),),
      "trailing" : SvgPicture.asset("assets/icons/arrow_right.svg",width: 16,color: Colors.red,
        height: 16,),
    },
    { "leading" : SvgPicture.asset("assets/icons/question_mark.svg", width: 20,
      height: 20,),
      "text" : Text("Help Center",style: TextStyle(fontSize: 18,color: Colors.red),) ,
      "trailing" : SvgPicture.asset("assets/icons/arrow_right.svg",width: 16,color: Colors.red,
        height: 16,),
    },
    { "leading" : SvgPicture.asset("assets/icons/log_out.svg", width: 20,
      height: 20,),
      "text" :  Text("Log Out",style: TextStyle(fontSize: 18,color: Colors.red),),
      "trailing" : SvgPicture.asset("assets/icons/arrow_right.svg",width: 16,color: Colors.red,
        height: 16,),
    }



  ];


  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery, // gallery ya camera dono use ho sakte
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(

          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icons/back_icon.svg"),
        ),

        title: Text("Profile", style: TextStyle(fontSize: 15)),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 65,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset("assets/icons/shop_icon.svg", width: 20, // custom width
                height: 20, ),
              onPressed: () {
                Navigator.pop(context);

              },
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/heart_icon.svg", width: 20, // custom width
                height: 20,  ),
              onPressed: () {

              },
            ),

            IconButton(
              icon: SvgPicture.asset("assets/icons/chat_bubble_Icon.svg", width: 20, // custom width
                height: 20, ),
              onPressed: () {

              },
            ),
            IconButton(
              icon:  SvgPicture.asset("assets/icons/user.svg", width: 20, // custom width
                height: 20, ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));

              },
            ),
          ],
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 60,
                  backgroundImage:
                      _image != null
                          ? FileImage(_image!)
                          : AssetImage('assets/images/default_dp.png')
                              as ImageProvider,
                ),
                // Camera Icon
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.camera_alt, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),  

 
            Expanded(
                child: ListView.builder(
                              itemCount: profileListItems.length,
                              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding:  EdgeInsets.symmetric(vertical: 8,horizontal: 30.0),
                  onTap: (){},
                  leading:  profileListItems[index]["leading"],

                  title: profileListItems[index]["text"],
                  trailing:   profileListItems[index]["trailing"],


                );
                              },))
        ],
      ),
    );
  }
}
