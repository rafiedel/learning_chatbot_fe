part of '_widgets.dart';

/// A drawer that starts at ⅔ width and can be dragged to full‐width or closed.
class SlidingDrawer extends StatefulWidget {
  const SlidingDrawer({super.key, required this.chatbotCubit});
  final ChatbotCubit chatbotCubit;

  @override
  State<SlidingDrawer> createState() => SlidingDrawerState();
}

class SlidingDrawerState extends State<SlidingDrawer> {
  late double _screenW;
  late double _minWidth; // ⅔ of screen
  late double _maxWidth; // full screen
  double _width = 0.0; // current drawer width

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenW = MediaQuery.of(context).size.width;
    _minWidth = _screenW * 2 / 3;
    _maxWidth = _screenW;
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
    final shouldClose = d.velocity.pixelsPerSecond.dx < -300;
    final shouldExpand =
        d.velocity.pixelsPerSecond.dx > 300 || _width > _screenW * 0.85;

    if (shouldClose) {
      widget.chatbotCubit.setIsDrawerOpen(false);
      Navigator.of(context).maybePop();
    } else {
      setState(() {
        _width = shouldExpand ? _maxWidth : _minWidth;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: _width, // dynamic width
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragUpdate: _onDragUpdate,
          onHorizontalDragEnd: _onDragEnd,
          child: Material(
            color: Colors.grey.shade900,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Column(
                children: [
                  BlocBuilder<ChatbotCubit, ChatbotState>(
                    bloc: widget.chatbotCubit,
                    builder: (context, state) {
                      return TextField(
                        controller: state.titleSearchController,
                        onChanged: (value) 
                          => widget.chatbotCubit.onTitleGroupChatSearch(),
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      widget.chatbotCubit.makeNewGroupChat();
                      Navigator.of(context).maybePop();
                    },
                    child: Text(
                      "NEW CHAT +",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Divider(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: BlocBuilder<ChatbotCubit, ChatbotState>(
                        bloc: widget.chatbotCubit,
                        builder: (context, state) {
                          print(state.groupChatList);
                          return Column(
                            children: state.groupChatList.map((groupChat) {
                              return ListTile(
                                title: Text('Group Chat ${groupChat.title}'),
                                onTap: () {
                                  widget.chatbotCubit.chooseGroupChat(groupChat.id);
                                  Navigator.of(context).maybePop();
                                },
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
