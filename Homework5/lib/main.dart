import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const FeedScreen(),
    );
  }
}

/// Статические данные одного поста.
class PostData {
  final String username;
  final String location;
  final String avatarUrl;
  final String imageUrl;
  final int likes;
  final String description;
  final int commentsCount;
  final String time;

  const PostData({
    required this.username,
    required this.location,
    required this.avatarUrl,
    required this.imageUrl,
    required this.likes,
    required this.description,
    required this.commentsCount,
    required this.time,
  });
}

const List<PostData> posts = [
  PostData(
    username: 'azamat_travel',
    location: 'Бишкек, Кыргызстан',
    avatarUrl: 'https://picsum.photos/id/1005/200/200',
    imageUrl: 'https://picsum.photos/id/1018/1080/1080',
    likes: 1254,
    description: 'Горы зовут, и я должен идти ⛰️ Лучшие выходные этой осени!',
    commentsCount: 48,
    time: '2 часа назад',
  ),
  PostData(
    username: 'alina.coffee',
    location: 'Алматы, Казахстан',
    avatarUrl: 'https://picsum.photos/id/64/200/200',
    imageUrl: 'https://picsum.photos/id/1060/1080/1080',
    likes: 873,
    description: 'Утро начинается с кофе ☕ А с чего начинается ваше?',
    commentsCount: 21,
    time: '5 часов назад',
  ),
];

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        titleSpacing: 16,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
        ),
        actions: const [
          Icon(Icons.favorite_border, color: Colors.black, size: 28),
          SizedBox(width: 20),
          Icon(Icons.chat_bubble_outline, color: Colors.black, size: 26),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (final post in posts) PostCard(post: post),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

/// Карточка поста: шапка, фото, панель действий, информация.
class PostCard extends StatelessWidget {
  final PostData post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PostHeader(post: post),
          _PostImage(url: post.imageUrl),
          const _ActionsBar(),
          _PostInfo(post: post),
        ],
      ),
    );
  }
}

// 1. Шапка поста
class _PostHeader extends StatelessWidget {
  final PostData post;

  const _PostHeader({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          // Аватар с градиентной обводкой как у сторис
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFFFEDA75),
                  Color(0xFFFA7E1E),
                  Color(0xFFD62976),
                  Color(0xFF962FBF),
                ],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  post.avatarUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) =>
                      Container(color: Colors.grey.shade300),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.username,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  post.location,
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_vert, color: Colors.black),
        ],
      ),
    );
  }
}

// 2. Изображение поста — на всю ширину карточки
class _PostImage extends StatelessWidget {
  final String url;

  const _PostImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade200,
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.network(
          url,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => const Center(
            child: Icon(Icons.image_outlined, size: 64, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

// 3. Панель действий
class _ActionsBar extends StatelessWidget {
  const _ActionsBar();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Icon(Icons.favorite_border, size: 28, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.chat_bubble_outline, size: 26, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.send_outlined, size: 26, color: Colors.black),
          Spacer(),
          Icon(Icons.bookmark_border, size: 28, color: Colors.black),
        ],
      ),
    );
  }
}

// 4. Информация о посте
class _PostInfo extends StatelessWidget {
  final PostData post;

  const _PostInfo({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Нравится: ${_formatNumber(post.likes)}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 6),
          Text.rich(
            TextSpan(
              style: const TextStyle(fontSize: 14, color: Colors.black),
              children: [
                TextSpan(
                  text: '${post.username} ',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(text: post.description),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Посмотреть все комментарии (${post.commentsCount})',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 6),
          Text(
            post.time,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  static String _formatNumber(int value) {
    final s = value.toString();
    final buffer = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buffer.write(' ');
      buffer.write(s[i]);
    }
    return buffer.toString();
  }
}

/// Нижняя панель навигации (статичная).
class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.home_filled, size: 28, color: Colors.black),
              const Icon(Icons.search, size: 28, color: Colors.black),
              const Icon(Icons.add_box_outlined, size: 28, color: Colors.black),
              const Icon(Icons.movie_outlined, size: 28, color: Colors.black),
              ClipOval(
                child: Image.network(
                  'https://picsum.photos/id/1005/200/200',
                  width: 28,
                  height: 28,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const Icon(
                    Icons.account_circle,
                    size: 28,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
