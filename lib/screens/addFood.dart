import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodrecipe/screens/addFood.dart';
import 'package:image_picker/image_picker.dart';

import 'addFood.dart';
import 'addFood.dart';
import 'addFood.dart';
import 'home.dart';
import 'ingredients.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  var firestore = FirebaseFirestore.instance;
  String nameController = "";
  String categoryController = "";
  List ingredientsController = [];
  String imageController = "";
  String stepsController = "";

  Future AddFood(name, category, ingredients, Image, stepsController) async {
    await firestore.collection('Foods').add({
      'name': name,
      'category': category,
      'ingredients': ingredients,
      'image': Image,
      'steps': stepsController,
    });
    if (name == "" ||
        category == "" ||
        ingredients == "" ||
        Image == "" ||
        stepsController == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Food added successfully'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[400],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Ingredients',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
          ],
          currentIndex: 2,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ingredients()),
                );
                break;
              // case 2:
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const AddFood()),
              //   );
              //   break;
            }
          },
        ),
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Add Food',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Add a new food to your list',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Food Name',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        onChanged: (value) => {
                          nameController = value,
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter food name',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Food Category',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        onChanged: (value) => {
                          categoryController = value,
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter food Category',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Enter Ingredients',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        onChanged: (value) => {
                          setState(() {
                            ingredientsController = value.split(',');
                          }),
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Ingredients',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Enter Image URL',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        onChanged: (value) => {
                          setState(() {
                            imageController = value;
                          }),
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Image URL',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Steps',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        onChanged: (value) => {
                          setState(() {
                            stepsController = value;
                          }),
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Steps',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AddFood(
                          nameController,
                          categoryController,
                          ingredientsController,
                          imageController,
                          stepsController,
                        );
                      },
                      child: const Text('Add Food'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
