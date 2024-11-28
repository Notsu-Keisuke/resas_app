import 'package:flutter/material.dart';
import 'package:myapp/city_detail_page.dart';

class CityListPage extends StatefulWidget {
  const CityListPage({
    super.key,
  });

  @override
  State<CityListPage> createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  // ignore: prefer_typing_uninitialized_variables
  var future;

  @override
  void initState() {
    super.initState();
    future = Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    const cities = [
      '札幌市',
      '横浜市',
      '川崎市',
      '名古屋市',
      '京都市',
      '大阪市',
      '神戸市',
      '福岡市',
      '北九州市',
      '広島市',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('市区町村一覧')),
      body: FutureBuilder<Object>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: [
                for (final city in cities)
                  ListTile(
                    title: Text(city),
                    subtitle: const Text('政令指定都市'),
                    trailing: const Icon(Icons.navigate_next),
                    onTap: () {
                      //詳細画面に遷移する
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => CityDetailPage(
                                  city: city,
                                )),
                      );
                    },
                  ),
              ],
            );
          }),
    );
  }
}
