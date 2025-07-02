import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../core/constants/app_assets.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _query = '';
  int? _selectedIndex;
  int _quantity = 1;
  final List<Map<String, dynamic>> _results = List.generate(
    5,
    (i) => {
      'title': 'خزان ١٠٠٠ لتر',
      'desc': 'خزانات مياه > خزانات طبقة واحدة',
      'image': 'assets/images/tank7.png',
      'isFavorite': false,
      'inCart': false,
      'quantity': 1,
    },
  );

  void _onSearch(String value) {
    setState(() {
      _query = value;
    });
  }

  void _toggleFavorite(int index) {
    setState(() {
      _results[index]['isFavorite'] = !_results[index]['isFavorite'];
    });
  }

  void _showQuantitySelector(int index) {
    setState(() {
      _selectedIndex = index;
      _quantity = _results[index]['quantity'];
    });
  }

  void _addToCart(int index) {
    setState(() {
      _results[index]['inCart'] = true;
      _results[index]['quantity'] = _quantity;
      _selectedIndex = null;
    });
  }

  void _cancelQuantity() {
    setState(() {
      _selectedIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF00AEEF), size: 32),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          title: const Text(
            'البحث',
            style: TextStyle(
              color: Color(0xFF00AEEF),
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          actions: const [SizedBox(width: 48)],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: SizedBox(
                        width: 28,
                        height: 28,
                        child: SvgPicture.asset(AppAssets.qrCode),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onChanged: _onSearch,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: 'ابحث باسم الصنف أو كود الصنف',
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_query.isEmpty)
              Expanded(
                child: Center(
                  child: Opacity(
                    opacity: 0.6, // subtle faded effect
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 250,
                      height: 250,
                      color: Color.fromRGBO(246, 247, 251, 0.984), // Use the requested color for the icon itself
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.separated(
                  itemCount: _results.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final item = _results[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Card(
                        color: const Color(0xFFF5F5F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  item['image'],
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item['desc'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                    const SizedBox(height: 4),
                                    Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue)),
                                    const SizedBox(height: 8),
                                    if (_selectedIndex == index)
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text('الكمية:'),
                                            const SizedBox(width: 8),
                                            IconButton(
                                              icon: const Icon(Icons.remove),
                                              onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
                                            ),
                                            Text('$_quantity', style: const TextStyle(fontWeight: FontWeight.bold)),
                                            IconButton(
                                              icon: const Icon(Icons.add),
                                              onPressed: () => setState(() => _quantity++),
                                            ),
                                            const SizedBox(width: 8),
                                            ElevatedButton(
                                              onPressed: () => _addToCart(index),
                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                              child: const Text('تأكيد'),
                                            ),
                                            const SizedBox(width: 4),
                                            OutlinedButton(
                                              onPressed: _cancelQuantity,
                                              child: const Text('إلغاء'),
                                            ),
                                          ],
                                        ),
                                      )
                                    else
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        child: LayoutBuilder(
                                          builder: (context, constraints) {
                                            return Row(
                                              children: [
                                                // 🛒 Cart Button on the right
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: ElevatedButton(
                                                    onPressed: item['inCart'] ? null : () => _showQuantitySelector(index),
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: item['inCart'] ? const Color(0xFF43BC59) : const Color(0xFF1B3E69),
                                                      disabledBackgroundColor: const Color(0xFF43BC59), // Keep green when disabled
                                                      foregroundColor: Colors.white,
                                                      disabledForegroundColor: Colors.white, // Keep text/icon white when disabled
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                                      elevation: 0,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Flexible(
                                                          child: FittedBox(
                                                            child: Text(
                                                              item['inCart'] ? 'تمت الإضافة' : 'أضف للسلة',
                                                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 6),
                                                        const Icon(Icons.shopping_cart, size: 20, color: Colors.white),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                // ❤️ Favorite Button on the left
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: ElevatedButton(
                                                    onPressed: () => _toggleFavorite(index),
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: const Color(0xFF11B7F3), // Bright blue from image
                                                      foregroundColor: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                                      elevation: 0,
                                                    ),
                                                    child: const Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Flexible(
                                                          child: FittedBox(
                                                            child: Text(
                                                              'أضف للمفضلة',
                                                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 6),
                                                        Icon(Icons.favorite, size: 20, color: Colors.white),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
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
