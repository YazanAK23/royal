import 'package:flutter/material.dart';
import 'package:royal/core/routes/app_routes.dart';
import 'package:royal/generated/l10n.dart';
import 'package:royal/screens/news/news_details_page.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_drawer.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    final newsItems = [
      NewsItem(
        image: 'assets/images/news1.png',
        title: s.news1Title,
        subtitle: s.news1Subtitle,
        content: s.news1Content,
      ),
      NewsItem(
        image: 'assets/images/news2.png',
        title: s.news2Title,
        subtitle: s.news2Subtitle,
        content: s.news2Content,
      ),
      NewsItem(
        image: 'assets/images/news3.png',
        title: s.news3Title,
        subtitle: s.news3Subtitle,
        content: s.news3Content,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          onMenuTap: () => AppRoutes.navigateTo(context, AppRoutes.customDrawer),

      ),
      drawer: CustomDrawer(
        onMenuItemTap: (route) {
          Navigator.of(context).pop(); // Close drawer first
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (ModalRoute.of(context)?.settings.name != route) {
              Navigator.of(context).pushReplacementNamed(route);
            }
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF00B4D8)),
                onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.customDrawer),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Center(
                child: Text(
                  s.newsTitle,
                  style: const TextStyle(
                    color: Color(0xFF00B4D8),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: newsItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => NewsDetailsPage(
                            image: newsItems[index].image,
                            title: newsItems[index].title,
                            subtitle: newsItems[index].subtitle,
                            content: newsItems[index].content,
                            onNext: index < newsItems.length - 1
                                ? () => Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (_) => NewsDetailsPage(
                                          image: newsItems[index + 1].image,
                                          title: newsItems[index + 1].title,
                                          subtitle: newsItems[index + 1].subtitle,
                                          content: newsItems[index + 1].content,
                                          onNext: index + 1 < newsItems.length - 1 ? () {} : null,
                                          onPrev: () => Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (_) => NewsDetailsPage(
                                                image: newsItems[index].image,
                                                title: newsItems[index].title,
                                                subtitle: newsItems[index].subtitle,
                                                content: newsItems[index].content,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                : null,
                            onPrev: index > 0
                                ? () => Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (_) => NewsDetailsPage(
                                          image: newsItems[index - 1].image,
                                          title: newsItems[index - 1].title,
                                          subtitle: newsItems[index - 1].subtitle,
                                          content: newsItems[index - 1].content,
                                          onNext: () => Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (_) => NewsDetailsPage(
                                                image: newsItems[index].image,
                                                title: newsItems[index].title,
                                                subtitle: newsItems[index].subtitle,
                                                content: newsItems[index].content,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                : null,
                          ),
                        ),
                      );
                    },
                    child: NewsCard(item: newsItems[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: -1, // No tab selected for NewsPage
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed('/favorite');
          } else if (index == 2) {
            Navigator.of(context).pushReplacementNamed('/profile');
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed('/downloads');
          } else if (index == 4) {
            Navigator.of(context).pushReplacementNamed('/info');
          }
        },
      ),
    );
  }
}

class NewsItem {
  final String image;
  final String title;
  final String subtitle;
  final String content;
  const NewsItem({required this.image, required this.title, required this.subtitle, required this.content});
}

class NewsCard extends StatelessWidget {
  final NewsItem item;
  const NewsCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              item.image,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              item.title,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF222222),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
