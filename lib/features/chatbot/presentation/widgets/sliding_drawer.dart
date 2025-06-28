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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  BlocBuilder<ChatbotCubit, ChatbotState>(
                    bloc: widget.chatbotCubit,
                    builder: (context, state) {
                      return TitleTextField(
                        titleSearchController: 
                          state.titleSearchController, 
                        onChanged: (_) =>
                          widget.chatbotCubit.onTitleGroupChatSearch()
                      );
                    }
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 5),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.chatbotCubit.makeNewGroupChat();
                        Navigator.of(context).maybePop();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.deepPurple),
                        ),
                        elevation: 4,
                      ),
                      child: Text(
                        "NEW CHAT +",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Divider(),

                  // Group chat list
                  Expanded(
                    child: BlocBuilder<ChatbotCubit, ChatbotState>(
                      bloc: widget.chatbotCubit,
                      builder: (context, state) {
                        if (state.isLoadingGroupChats &&
                              state.groupChatList.isEmpty) {
                          return SkeletonGroupChatListView(
                            howMuchItems: 10,
                          );
                        }

                        return ListView.builder(
                          controller: state.groupChatScrollController,
                          itemCount: state.groupChatList.length,
                          itemBuilder: (context, index) {
                            final groupChat = state.groupChatList[index];
                            return ListTile(
                              selected: groupChat.id == state.selectedGroupChatId,
                              selectedColor: Colors.grey.shade200,
                              // ignore: deprecated_member_use
                              selectedTileColor: Colors.grey.shade800.withOpacity(0.5),
                              contentPadding: EdgeInsets.symmetric(horizontal: 5),
                              title: Text(
                                groupChat.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              subtitle: Text(
                                DateFormat('MMM d, yyyy • h:mm a').format(groupChat.createdAt),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              trailing: MorePopUpMenuButton(
                                onDelete: () async {
                                  final bool? confirmed = await 
                                    showDialog<bool>(
                                      context: context,
                                      builder: (BuildContext dialogContext) =>
                                        DeleteConfirmDialog(
                                          content: groupChat.title
                                        ),
                                    );
                                  if (confirmed == true) {
                                    widget.chatbotCubit.
                                      deleteGroupChatById(
                                        groupChat.id);
                                  }
                                }, 
                                onRename: () async {
                                  final String? newTitle = await 
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext dialogContext) =>
                                        EditTitleDialog(
                                          oldTitle: groupChat.title,
                                        )
                                    );
                                  if (newTitle != null) {
                                    widget.chatbotCubit.
                                      renameGroupChatById(
                                        groupChat.id, newTitle);
                                  }
                                } 
                              ),
                              onTap: () {
                                widget.chatbotCubit.chooseGroupChat(groupChat.id);
                                Navigator.of(context).maybePop();
                              },
                            );
                          },
                        );
                      },
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
