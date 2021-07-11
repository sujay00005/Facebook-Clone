import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/circle_button.dart';
import 'package:facebook_clone/widgets/post_container.dart';
import 'package:facebook_clone/widgets/rooms.dart';
import 'package:facebook_clone/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/configuration/pallet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:facebook_clone/widgets/create_post_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () => print('search'),
              ),
              CircleButton(
                icon: FontAwesomeIcons.facebookMessenger,
                iconSize: 30.0,
                onPressed: () => print('Messenger'),
              )
            ],
          ),

          //Other slivers we can pass are SliverPadding, SliverList, SliverGrid
          SliverToBoxAdapter(
            child: CreatePostContainer(
              currentUser: currentUser,
            ),
          ),

          // Room and online user section
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers: onlineUsers),
            ),
          ),

          //story section
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),

          //post section
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              //similar to ListView.Builder
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length,
          )),
        ],
      ),
    );
  }
}
