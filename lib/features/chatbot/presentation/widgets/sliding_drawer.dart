part of '_widgets.dart';

/// A drawer that starts at ⅔ width and can be dragged to full‐width or closed.
class SlidingDrawer  extends StatefulWidget {
  const SlidingDrawer ({
    required this.groupChats,
    super.key
  });

  final List<GroupChatModel> groupChats;

  @override
  State<SlidingDrawer > createState() => SlidingDrawerState();
}

class SlidingDrawerState extends State<SlidingDrawer > {
  late double _screenW;
  late double _minWidth;   // ⅔ of screen
  late double _maxWidth;   // full screen
  double _width = 0.0;     // current drawer width

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenW   = MediaQuery.of(context).size.width;
    _minWidth  = _screenW * 2/3;
    _maxWidth  = _screenW;
    // Only set _width once (on first build)
    _width = _width == 0.0 ? _minWidth : _width;
  }

  // handle horizontal drag
  void _onDragUpdate(DragUpdateDetails d) {
    setState(() {
      _width = (_width + d.delta.dx).clamp(_minWidth, _maxWidth);
    });
  }

  // snap on release
  void _onDragEnd(DragEndDetails d) {
    final shouldClose   = d.velocity.pixelsPerSecond.dx < -300;
    final shouldExpand  = d.velocity.pixelsPerSecond.dx >  300 ||
                          _width > _screenW * 0.85;

    if (shouldClose) {
      Navigator.of(context).maybePop();            // close drawer
    } else {
      setState(() {
        _width = shouldExpand ? _maxWidth : _minWidth;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(                       // still a real Drawer
        width: _width,                     // dynamic width
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragUpdate: _onDragUpdate,
          onHorizontalDragEnd:     _onDragEnd,
          child: Material(
            color: Colors.grey.shade900,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 10, vertical: 20
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder()
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: widget.groupChats.map((chat) {
                          return ListTile(
                            title: Text('Group Chat ${chat.title}'),
                          );
                        }).toList(),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}