import 'package:flutter/material.dart';
import 'create_post_page.dart';
import 'profile_page.dart';
import 'communities_page.dart';

class FeedPage extends StatelessWidget {

  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Feed"),
      ),

      body: ListView(
        children: const [

          ListTile(
            title: Text("Post exemplo"),
            subtitle: Text("Conteúdo do post"),
          ),

        ],
      ),

      bottomNavigationBar: BottomNavigationBar(

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Feed",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: "Comunidades",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),

        ],

        onTap: (index) {

          if (index == 1) {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CommunitiesPage(),
              ),
            );

          }

          if (index == 2) {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );

          }

        },

      ),

      floatingActionButton: FloatingActionButton(

        child: const Icon(Icons.add),

        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePostPage(),
            ),
          );

        },

      ),

    );
  }
}