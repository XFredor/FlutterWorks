import 'package:material_ui/material_ui.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.network(
                            'https://picsum.photos/id/1005/200/200',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'azamat_travel',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Бишкек, Кыргызстан',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.more_vert),
                  ],
                ),
              ),

              Image.network(
                'https://picsum.photos/id/1018/1080/1080',
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite_border, size: 28),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(Icons.chat_bubble_outline, size: 26),
                        ),
                        Icon(Icons.send_outlined, size: 26),
                      ],
                    ),
                    Icon(Icons.bookmark_border, size: 28),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Нравится: 1 254',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Text(
                            'azamat_travel ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Горы зовут, и я должен идти!'),
                        ],
                      ),
                    ),
                    Text(
                      'Посмотреть все комментарии',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        '2 часа назад',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
