import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = ModalRoute.of(context)!.settings.arguments as User?;
    user = user ??= User.users[0];

    return Scaffold(
      bottomNavigationBar: const CustomBottomAppBar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            _buildProfileInformation(user),
            SizedBox(height: 20),
            _buildProfileContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInformation(User user) {
    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(user.imagePath),
        ),
        SizedBox(height: 20),
        Text(
          user.username,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          '@${user.username}',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileContent() {
    return Column(
      children: [
      
        Container(
          height: 300,
          child: ListView.builder(
            //itemCount: user?.pastRequests.length ?? 0,
            itemBuilder: (context, index) {
             
              return ListTile(
                title: Text('Request #$index'), 
                subtitle: Text('Details about the repair request'),
     
              );
            },
          ),
        ),
      ],
    );
  }
}
