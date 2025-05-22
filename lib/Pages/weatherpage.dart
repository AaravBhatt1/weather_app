import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/apibuilder.dart';
import 'RestorePage.dart';
import 'dart:math';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final List<Map<String, dynamic>> items = [
    {'key': 'blueCard', 'color': Colors.blue, 'label': 'Blue'},
    {'key': 'pinkCard', 'color': Colors.pink, 'label': 'Pink'},
    {'key': 'yellowCard', 'color': Colors.yellow, 'label': 'Yellow'},
    {'key': 'orangeCard', 'color': Colors.orange, 'label': 'Orange'},
    {'key': 'greenCard', 'color': Colors.green, 'label': 'Green'},
    {'key': 'purpleCard', 'color': Colors.purple, 'label': 'Purple'},
    {'key': 'greyCard', 'color': Colors.grey, 'label': 'Grey'},
  ];
  final List<Map<String, dynamic>> unseenItems = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ApiBuilder(
        builder: (context, data) {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/sun.png',
                        key: const ValueKey('sun'),
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CAMBRIDGE',
                              key: ValueKey('text1'),
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10, key: ValueKey('box2')),
                            Text(
                              '23°C',
                              key: ValueKey('text2'),
                              style: TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ReorderableListView(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        final item = items.removeAt(oldIndex);
                        items.insert(newIndex > oldIndex ? newIndex - 1 : newIndex, item);
                      });
                    },
                    children: [
                      for (var item in items)
                        DeletableCard(
                          key: ValueKey(item['key']),
                          color: item['color'],
                          label: item['label'],
                          onDelete: () {
                            setState(() {
                              unseenItems.add(item);
                              items.removeWhere((i) => i['key'] == item['key']);
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final restored = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestorePage(unseenItems: unseenItems),
            ),
          );

          if (restored != null && restored is List<Map<String, dynamic>>) {
            setState(() {
              items.addAll(restored);
              unseenItems.removeWhere((d) => restored.any((r) => r['key'] == d['key']));
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }


}

class DeletableCard extends StatefulWidget {
  final Color color;
  final String label;
  final VoidCallback onDelete;

  const DeletableCard({
    super.key,
    required this.color,
    required this.label,
    required this.onDelete,
  });

  @override
  State<DeletableCard> createState() => _DeletableCardState();
}

class _DeletableCardState extends State<DeletableCard>
    with SingleTickerProviderStateMixin {
  bool _showDelete = false;
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
      if (mounted) setState(() {});
    });

    _shakeAnimation =
        Tween<double>(begin: 0, end: 8 * pi).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.linear,
        ));

    _controller.repeat(period: const Duration(milliseconds: 1000));
    _controller.stop();
  }

  void _toggleDeleteMode() {
    setState(() {
      _showDelete = !_showDelete;
      if (_showDelete) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double get _shakeOffset => sin(_shakeAnimation.value) * 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: _toggleDeleteMode,
      child: Transform.translate(
        offset: _showDelete ? Offset(_shakeOffset, 0) : Offset.zero,
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              elevation: 4,
              color: widget.color,
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: SizedBox(
                height: 200,
                child: Center(
                  child: Text(
                    widget.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            if (_showDelete)
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: widget.onDelete,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}