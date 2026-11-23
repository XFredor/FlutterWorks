import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                PostCard(
                  username: 'azamat_travel',
                  location: 'Бишкек, Кыргызстан',
                  avatarUrl: 'https://picsum.photos/id/1005/200/200',
                  imageUrl: 'https://picsum.photos/id/1018/1080/1080',
                  likes: '1 254',
                  description: 'Горы зовут, и я должен идти!',
                  time: '2 часа назад',
                ),
                // Дополнительное задание: второй пост
                PostCard(
                  username: 'alina.coffee',
                  location: 'Алматы, Казахстан',
                  avatarUrl: 'https://picsum.photos/id/64/200/200',
                  imageUrl: 'https://picsum.photos/id/1060/1080/1080',
                  likes: '873',
                  description: 'Утро начинается с кофе ☕',
                  time: '5 часов назад',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String username;
  final String location;
  final String avatarUrl;
  final String imageUrl;
  final String likes;
  final String description;
  final String time;

  const PostCard({
    super.key,
    required this.username,
    required this.location,
    required this.avatarUrl,
    required this.imageUrl,
    required this.likes,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Шапка поста
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    avatarUrl,
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(location, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                const Icon(Icons.more_vert),
              ],
            ),
          ),

          // 2. Изображение поста на всю ширину
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 375,
            fit: BoxFit.cover,
          ),

          // 3. Панель действий
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.favorite_border, size: 28),
                SizedBox(width: 16),
                Icon(Icons.chat_bubble_outline, size: 26),
                SizedBox(width: 16),
                Icon(Icons.send_outlined, size: 26),
                Spacer(),
                Icon(Icons.bookmark_border, size: 28),
              ],
            ),
          ),

          // 4. Информация о посте
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Нравится: $likes',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '$username ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: Text(description)),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Посмотреть все комментарии',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
