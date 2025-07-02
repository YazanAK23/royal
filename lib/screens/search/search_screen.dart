import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/generated/l10n.dart';
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
      'titleKey': 'tankTitle',
      'descKey': 'tankDesc',
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
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF00AEEF), size: 32),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        title: Text(
          s.searchTitle,
          style: const TextStyle(
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
              children: isRTL
                  ? [
                      _buildQRButton(),
                      const SizedBox(width: 8),
                      _buildSearchField(s, isRTL),
                    ]
                  : [
                      _buildSearchField(s, isRTL),
                      const SizedBox(width: 8),
                      _buildQRButton(),
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
                    color: const Color(0xFFF6F7FB),
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
                  final imageWidget = ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      item['image'],
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                  );
                  final textWidget = Expanded(
                    child: Column(
                      crossAxisAlignment: isRTL ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                      children: [
                        Text(_getLocalizedValue(s, item['descKey']), style: const TextStyle(fontSize: 12, color: Colors.grey), textAlign: isRTL ? TextAlign.right : TextAlign.left),
                        const SizedBox(height: 4),
                        Text(_getLocalizedValue(s, item['titleKey']), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue), textAlign: isRTL ? TextAlign.right : TextAlign.left),
                        const SizedBox(height: 8),
                        if (_selectedIndex == index)
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                              children: _buildQuantityRow(s, index, isRTL),
                            ),
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                final actionRow = _buildActionRow(s, item, index, isRTL);
                                return Row(
                                  children: actionRow,
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  );
                  final rowChildren = isRTL
                    ? [imageWidget, const SizedBox(width: 12), textWidget]
                    : [textWidget, const SizedBox(width: 12), imageWidget];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Card(
                      color: const Color(0xFFF5F5F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Directionality(
                          textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: rowChildren,
                          ),
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
    );
  }

  Widget _buildQRButton() {
    return Container(
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
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildQuantityRow(S s, int index, bool isRTL) {
    final children = <Widget>[
      Text(s.quantityLabel),
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
        child: Text(s.confirmLabel),
      ),
      const SizedBox(width: 4),
      OutlinedButton(
        onPressed: _cancelQuantity,
        child: Text(s.cancelLabel),
      ),
    ];
    return isRTL ? children : children.reversed.toList();
  }

  List<Widget> _buildActionRow(S s, Map<String, dynamic> item, int index, bool isRTL) {
    final actionRow = <Widget>[
      Flexible(
        fit: FlexFit.tight,
        child: ElevatedButton(
          onPressed: item['inCart'] ? null : () => _showQuantitySelector(index),
          style: ElevatedButton.styleFrom(
            backgroundColor: item['inCart'] ? const Color(0xFF43BC59) : const Color(0xFF1B3E69),
            disabledBackgroundColor: const Color(0xFF43BC59),
            foregroundColor: Colors.white,
            disabledForegroundColor: Colors.white,
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
                    item['inCart'] ? s.addedToCartLabel : s.addToCartLabel,
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
      Flexible(
        fit: FlexFit.tight,
        child: ElevatedButton(
          onPressed: () => _toggleFavorite(index),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF11B7F3),
            foregroundColor: Colors.white,
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
                    s.addToFavoritesLabel,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.favorite, size: 20, color: Colors.white),
            ],
          ),
        ),
      ),
    ];
    return isRTL ? actionRow : actionRow.reversed.toList();
  }
}
