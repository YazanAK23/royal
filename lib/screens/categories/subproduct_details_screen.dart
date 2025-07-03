import 'package:flutter/material.dart';
import 'package:royal/widgets/custom_app_bar.dart';
import 'package:royal/widgets/custom_bottom_nav_bar.dart';
import 'package:royal/widgets/custom_drawer.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';

final List<Map<String, String>> _tableRows = [
  {'productNo': '01-0010', 'itemName': 'Nipple', 'size': '3', 'length': '-'},
  {'productNo': '01-0010', 'itemName': 'Pipe', 'size': '4', 'length': '4'},
  {'productNo': '01-0010', 'itemName': 'Nipple', 'size': '4', 'length': '0.5'},
  {'productNo': '01-0010', 'itemName': 'Pipe', 'size': '6', 'length': '4'},
  {'productNo': '01-0010', 'itemName': 'Pipe', 'size': '4', 'length': '-'},
  {'productNo': '01-0010', 'itemName': 'Pipe', 'size': '4', 'length': '4'},
  {'productNo': '01-0010', 'itemName': 'Nipple', 'size': '6', 'length': '3'},
  {'productNo': '01-0010', 'itemName': 'Pipe', 'size': '6', 'length': '1'},
];

class SubProductDetailsScreen extends StatelessWidget {
  const SubProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      endDrawer: CustomDrawer(
        onMenuItemTap: (route) {
          Navigator.pop(context);
          Navigator.pushNamed(context, route);
        },
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppDimensions.appBarHeight),
        child: Builder(
          builder: (context) => CustomAppBar(
            onMenuTap: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Breadcrumb with left-aligned title and background color
              Container(
                width: double.infinity,
                color: const Color(0xFFEFEFEF),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Sanitary Ware / ... / 200 Liters Water Tank',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              // Title and navigation with background color
              Container(
                width: double.infinity,
                color: const Color(0xFFFBFCFC),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Center(
                        child: Text(
                          'U-PVC Drain & Sewer Pipe (SN-2)',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed('/subProductDetail', arguments: {'direction': 'previous'});
                            },
                            child: Row(
                              children: [
                                Icon(Icons.chevron_left, color: Colors.blue, size: 18),
                                SizedBox(width: 2),
                                Text('Previous product',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.blue, fontSize: 12)),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed('/subProductDetail', arguments: {'direction': 'next'});
                            },
                            child: Row(
                              children: [
                                Text('Next product',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.lightBlue, fontSize: 12)),
                                SizedBox(width: 2),
                                Icon(Icons.chevron_right, color: Colors.lightBlue, size: 18),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Product image and carousel with left/right buttons
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: _ImageCarousel(
                  images: [
                    'assets/images/tank6.png',
                    'assets/images/tank6.png',
                    'assets/images/tank6.png',
                  ],
                ),
              ),
              // Description with See more functionality
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: _ExpandableDescription(
                  text: 'U-PVC Pipes are the ideal substitute for cast-iron and asbestos. Because of its special...',
                  maxLength: 60,
                  textAlign: TextAlign.left,
                ),
              ),
              // Size tabs (order and style as in image)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: _SelectableSizeTabs(),
              ),
              // Table header (order: Length, Size, Item Name, Product No., Arrow)
              Container(
                color: Colors.blue[50],
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                child: Row(
                  children: const [
                    Expanded(child: Text('Length (m)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey))),
                    Expanded(child: Text('Size (inch)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey))),
                    Expanded(child: Text('Item Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey))),
                    Expanded(child: Text('Product No.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey))),
                    SizedBox(width: 32), // For the arrow icon at the end
                  ],
                ),
              ),
              // Table rows with divider and icon at the end
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: _tableRows.length + 1, // Add one for the last divider
                        separatorBuilder: (context, i) => Divider(thickness: 1, height: 1),
                        itemBuilder: (context, i) {
                          if (i == _tableRows.length) {
                            // Last divider under the last row
                            return Divider(thickness: 2, height: 2);
                          }
                          final row = _tableRows[i];
                          final isFirst = i == 0;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(row['length'] ?? '',
                                      style: TextStyle(
                                        color: isFirst ? Colors.lightBlue : Colors.grey,
                                        fontWeight: isFirst ? FontWeight.bold : FontWeight.normal,
                                        fontSize: 14,
                                      ), textAlign: TextAlign.center)),
                                Expanded(
                                  child: Text(row['size'] ?? '',
                                      style: TextStyle(
                                        color: isFirst ? Colors.lightBlue : Colors.grey,
                                        fontWeight: isFirst ? FontWeight.bold : FontWeight.normal,
                                        fontSize: 14,
                                      ), textAlign: TextAlign.center)),
                                Expanded(
                                  child: Text(row['itemName'] ?? '',
                                      style: TextStyle(
                                        color: isFirst ? Colors.lightBlue : Colors.grey,
                                        fontWeight: isFirst ? FontWeight.bold : FontWeight.normal,
                                        fontSize: 14,
                                        decoration: isFirst ? TextDecoration.underline : null,
                                      ), textAlign: TextAlign.center)),
                                Expanded(
                                  child: Text(row['productNo'] ?? '',
                                      style: TextStyle(
                                        color: isFirst ? Colors.lightBlue : Colors.grey,
                                        fontWeight: isFirst ? FontWeight.bold : FontWeight.normal,
                                        fontSize: 14,
                                      ), textAlign: TextAlign.center)),
                                SizedBox(
                                  width: 32,
                                  child: Icon(Icons.reply, color: isFirst ? Colors.lightBlue : Colors.grey, size: 20),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              // Centered action icons below the table
              // Right-align the action icons using an Align widget
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _CircleActionButton(icon: Icons.inventory_2),
                      const SizedBox(width: 16),
                      _CircleActionButton(icon: Icons.attachment),
                      const SizedBox(width: 16),
                      _CircleActionButton(icon: Icons.copy),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
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

class _SizeTab extends StatelessWidget {
  final String label;
  final bool selected;
  const _SizeTab({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.blue),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ImageCircle extends StatelessWidget {
  final String image;
  final bool selected;
  const _ImageCircle({required this.image, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: selected ? Colors.blue : Colors.grey[300]!, width: 2),
      ),
      child: ClipOval(
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}

class _ExpandableDescription extends StatefulWidget {
  final String text;
  final int maxLength;
  final TextAlign textAlign;
  const _ExpandableDescription({required this.text, this.maxLength = 60, this.textAlign = TextAlign.right});

  @override
  State<_ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<_ExpandableDescription> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    final isLong = widget.text.length > widget.maxLength;
    final displayText = expanded || !isLong
        ? widget.text
        : widget.text.substring(0, widget.maxLength) + '...';
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isLong && !expanded)
          GestureDetector(
            onTap: () => setState(() => expanded = true),
            child: Text('See more', style: TextStyle(color: Colors.blue, fontSize: 12)),
          ),
        if (isLong && !expanded) SizedBox(width: 4),
        Expanded(
          child: Text(
            displayText,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            textAlign: widget.textAlign,
          ),
        ),
      ],
    );
  }
}

class _ImageCarousel extends StatefulWidget {
  final List<String> images;
  const _ImageCarousel({required this.images});

  @override
  State<_ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<_ImageCarousel> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.images.length - 1;
  }

  void _goLeft() {
    if (currentIndex > 0) setState(() => currentIndex--);
  }

  void _goRight() {
    if (currentIndex < widget.images.length - 1) setState(() => currentIndex++);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left, color: currentIndex == 0 ? Colors.grey[300] : Colors.lightBlue, size: 36),
                onPressed: currentIndex == 0 ? null : _goLeft,
              ),
              Expanded(
                child: Center(
                  child: Image.asset(widget.images[currentIndex], height: 100),
                ),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right, color: currentIndex == widget.images.length - 1 ? Colors.grey[300] : Colors.lightBlue, size: 36),
                onPressed: currentIndex == widget.images.length - 1 ? null : _goRight,
              ),
            ],
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _ImageCircle(image: widget.images[i], selected: i == currentIndex),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectableSizeTabs extends StatefulWidget {
  @override
  State<_SelectableSizeTabs> createState() => _SelectableSizeTabsState();
}

class _SelectableSizeTabsState extends State<_SelectableSizeTabs> {
  final List<String> sizes = ['"1/2"', '"3/4"', '"3/4"', '"3/4"'];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.ltr, // Force left-to-right order
      children: List.generate(sizes.length, (i) => GestureDetector(
        onTap: () => setState(() => selected = i),
        child: _SizeTab(label: sizes[i], selected: selected == i),
      )),
    );
  }
}

// Add this at the end of the file (replace _CircleButton):
class _CircleActionButton extends StatelessWidget {
  final IconData icon;
  const _CircleActionButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.lightBlue,
      radius: 24,
      child: Icon(icon, color: Colors.white, size: 26),
    );
  }
}
