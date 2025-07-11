import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../core/constants/app_assets.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _query = '';
  int? _selectedIndex;
  int _quantity = 12;
  final List<Map<String, dynamic>> _results = List.generate(
    5,
    (i) => {
      'titleKey': 'tankTitle',
      'descKey': 'tankDesc',
      'image': 'assets/images/tank7.png',
      'isFavorite': false,
      'inCart': false,
    },
  );

  void _onSearch(String value) {
    setState(() => _query = value);
  }

  void _toggleFavorite(int index) {
    setState(() {
      _results[index]['isFavorite'] = !_results[index]['isFavorite'];
    });
  }

  void _showQuantitySelector(int index) {
    setState(() => _selectedIndex = index);
  }

  void _addToCart(int index) {
    setState(() {
      _results[index]['inCart'] = true;
      _selectedIndex = null;
    });
  }

  void _cancelQuantity() {
    setState(() => _selectedIndex = null);
  }

  String _getLocalizedValue(S s, String key) {
    switch (key) {
      case 'tankTitle':
        return s.tankTitle;
      case 'tankDesc':
        return s.tankDesc;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 24.sp, color: const Color(0xFF00AEEF)),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
        title: Text(
          s.searchTitle,
          style: TextStyle(color: const Color(0xFF00AEEF), fontWeight: FontWeight.w400, fontSize: 20.sp),
        ),
        centerTitle: true,
        actions: [SizedBox(width: 48.w)],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: isRTL
                  ? [_buildQRButton(), SizedBox(width: 8.w), _buildSearchField(s, isRTL)]
                  : [_buildSearchField(s, isRTL), SizedBox(width: 8.w), _buildQRButton()],
            ),
          ),
          if (_query.isEmpty)
            Expanded(
              child: Center(
                child: Opacity(
                  opacity: 0.6,
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    width: 250.w,
                    height: 250.h,
                    colorFilter: const ColorFilter.mode(Color(0xFFF6F7FB), BlendMode.srcIn),
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: ListView.separated(
                itemCount: _results.length,
                separatorBuilder: (_, __) => Divider(height: 1.h),
                itemBuilder: (context, index) {
                  final item = _results[index];

                  final image = Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F7),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.all(8.w),
                    child: Image.asset(
                      item['image'],
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.contain,
                    ),
                  );

                  Widget content;
                  if (_selectedIndex == index) {
                    content = Directionality(
                      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          image,
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(s.searchQuantityLabel),
                                    SizedBox(width: 6.w),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () => setState(() => _quantity++),
                                    ),
                                    Text(
                                      '$_quantity',
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.arrow_drop_down),
                                          Text(s.searchPackLabel),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                Text(s.searchPackDetails, style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () => _addToCart(index),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                      ),
                                      child: Text(s.searchDoneButton),
                                    ),
                                    SizedBox(width: 8.w),
                                    OutlinedButton(
                                      onPressed: _cancelQuantity,
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: Colors.red,
                                        side: const BorderSide(color: Colors.red),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                      ),
                                      child: Text(s.searchCancelButton),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    content = Directionality(
                      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          image,
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _getLocalizedValue(s, item['descKey']),
                                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  _getLocalizedValue(s, item['titleKey']),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16.sp, color: Colors.blue),
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  children: _buildActionRow(s, item, index, isRTL),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: content,
                  );
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: -1,
        onTap: (index) {
          final routes = ['/home', '/favorite', '/profile', '/downloads', '/info'];
          if (index >= 0 && index < routes.length) {
            Navigator.of(context).pushReplacementNamed(routes[index]);
          }
        },
      ),
    );
  }

  Widget _buildQRButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [BoxShadow(color: Colors.grey.withAlpha(51), blurRadius: 4.r)],
      ),
      child: IconButton(
        icon: SizedBox(
          width: 28.w,
          height: 28.h,
          child: SvgPicture.asset(AppAssets.qrCode),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildSearchField(S s, bool isRTL) {
    return Expanded(
      child: TextField(
        controller: _controller,
        onChanged: _onSearch,
        textAlign: isRTL ? TextAlign.right : TextAlign.left,
        decoration: InputDecoration(
          hintText: s.searchHintDetails,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildActionRow(S s, Map<String, dynamic> item, int index, bool isRTL) {
    final bool inCart = item['inCart'] == true;
    return [
      Expanded(
        child: inCart
            ? ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rectangle with small radius
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          s.addedToCartLabel,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    const Icon(Icons.shopping_cart, size: 20, color: Colors.white),
                  ],
                ),
              )
            : ElevatedButton(
                onPressed: () => _showQuantitySelector(index),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B3E69),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rectangle with small radius
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          s.addToCartLabel,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    const Icon(Icons.shopping_cart, size: 20, color: Colors.white),
                  ],
                ),
              ),
      ),
      SizedBox(width: 8.w),
      Expanded(
        child: ElevatedButton(
          onPressed: () => _toggleFavorite(index),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF11B7F3),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rectangle with small radius
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: FittedBox(
                  child: Text(
                    s.addToFavoritesLabel,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(width: 6.w),
              const Icon(Icons.favorite, size: 20, color: Colors.white),
            ],
          ),
        ),
      ),
    ];
  }
}
