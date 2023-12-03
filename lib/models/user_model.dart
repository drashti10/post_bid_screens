class User {
  final String id;
  final String username;
  final String imagePath;
  final int followers;
  final int followings;
  final int likes;

  User({
    required this.id,
    required this.username,
    required this.imagePath,
    this.followers = 0,
    this.followings = 0,
    this.likes = 0,
  });

  static List<User> users = [
    User(
      id: '1',
      username: 'Massimo',
      imagePath: 'assets/images/image_1.jpg',
    
    ),
    User(
      id: '2',
      username: 'John',
      imagePath: 'assets/images/image_2.jpg',
      
    ),
    User(
      id: '3',
      username: 'Laura',
      imagePath: 'assets/images/image_3.jpg',
    
    ),
    User(
      id: '4',
      username: 'Graphics10',
      imagePath: 'assets/images/image_4.jpg',
      
    ),
    User(
      id: '5',
      username: 'Massimo',
      imagePath: 'assets/images/image_1.jpg',
     
    ),
    User(
      id: '6',
      username: 'John',
      imagePath: 'assets/images/image_2.jpg',
    
    ),
    User(
      id: '7',
      username: 'Laura',
      imagePath: 'assets/images/image_3.jpg',
    
    ),
    User(
      id: '8',
      username: 'Graphics10',
      imagePath: 'assets/images/image_4.jpg',
   
    ),
  ];
}
