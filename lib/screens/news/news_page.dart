import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal/core/routes/app_routes.dart';
import 'package:royal/generated/l10n.dart';
import 'package:royal/screens/news/news_details_page.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_drawer.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

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

    return WillPopScope(
      onWillPop: () async {
        AppRoutes.navigateTo(context, AppRoutes.customDrawer);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          onMenuTap: () => AppRoutes.navigateTo(context, AppRoutes.customDrawer),
        ),
        drawer: CustomDrawer(
          onMenuItemTap: (route) {
            Navigator.of(context).pop();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (ModalRoute.of(context)?.settings.name != route) {
                Navigator.of(context).pushReplacementNamed(route);
              }
            });
          },
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, color: const Color(0xFF00B4D8), size: 24.sp),
                  onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.customDrawer),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Center(
                  child: Text(
                    s.newsTitle,
                    style: TextStyle(
                      color: const Color(0xFF00B4D8),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: newsItems.length,
                  separatorBuilder: (_, __) => SizedBox(height: 16.h),
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
          currentIndex: -1,
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
  const NewsCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            child: Image.asset(
              item.image,
              height: 140.h,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Text(
              item.title,
              style: TextStyle(
                fontSize: 15.sp,
                color: const Color(0xFF222222),
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
