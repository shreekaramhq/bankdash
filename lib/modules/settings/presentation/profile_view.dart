import 'dart:io';

import 'package:bankdash/widgets/barrel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  XFile? _image;

  Future pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    _image = pickedFile;
    setState(() {});
  }

  Widget displayImage(XFile? pickedFile) {
    if (pickedFile != null) {
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: FileImage(File(pickedFile.path)),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: InkWell(
              onTap: () {
                pickImage();
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return InkWell(
        onTap: () {
          pickImage();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: const Icon(Icons.add_a_photo),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 100,
            child: displayImage(_image),
          ),
          const SizedBox(height: 20),
          const DashInput(
            label: "Your Name",
            placeholder: "Please enter your name",
          ),
          const SizedBox(height: 20),
          const DashInput(
            label: "User Name",
            placeholder: "Please enter your username",
          ),
          const SizedBox(height: 20),
          const DashInput(
            label: "Email",
            placeholder: "Please enter your email",
          ),
          const SizedBox(height: 20),
          const DashInput(
            label: "Password",
            placeholder: "Please enter your password",
            obscureText: true,
          ),
          const SizedBox(height: 20),
          const DashInput(
            label: "Date of Birth",
            placeholder: "Please enter your date of birth",
          ),
          const SizedBox(height: 20),
          const DashInput(
            label: "Present Address",
            placeholder: "Please enter your address",
          ),
          const SizedBox(height: 20),
          const DashInput(
            label: "Permanent Address",
            placeholder: "Please enter your address",
          ),
          const SizedBox(height: 20),
          const DashInput(
            label: "City",
            placeholder: "Please enter your city",
          ),
          const SizedBox(height: 20),
          const DashInput(
            label: "Postal Code",
            placeholder: "Please enter your postal code",
          ),
          const SizedBox(height: 20),
          const DashInput(
            label: "Country",
            placeholder: "Please enter your country",
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Save")],
            ),
          ),
        ],
      ),
    );
  }
}
