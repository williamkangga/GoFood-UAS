import 'package:flutter/material.dart';
import 'package:gojek/UTS/datas/news.dart';
import 'package:gojek/UTS/models/news.dart';
import 'package:gojek/UTS/theme.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required News news});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...news
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsWidget(news: item)),
                    );
                  },
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: dark4),
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/images2/${item.image}'),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: bold16.copyWith(color: dark1),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                item.description,
                                style: regular14.copyWith(color: dark2),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
