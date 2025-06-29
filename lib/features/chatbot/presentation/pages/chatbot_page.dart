part of '_pages.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  late ChatbotCubit _chatbotCubit;

  @override
  void initState() {
    _chatbotCubit = get<ChatbotCubit>();
    _chatbotCubit.initChatScrollController();
    _chatbotCubit.initGroupChatScrollController();
    _chatbotCubit.initImagePickerService();
    _chatbotCubit.initNewChatController();
    initialPageLoad();
    super.initState();
  }

  @override
  void dispose() {
    _chatbotCubit.close();
    super.dispose();
  }

  Future<void> initialPageLoad() async => _chatbotCubit.getGroupChats();
  Future<void> onDrawerChanged(bool newIsDrawerOpen) async =>
      _chatbotCubit.setIsDrawerOpen(newIsDrawerOpen);
  Future<void> onOpenSymbolKeyboard(String initString) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      builder: (_) => FractionallySizedBox(
        heightFactor: 0.80,
        child: SymbolSheete(initial: initString),
      ),
    );
    _chatbotCubit.openSymbolKeyboard(result!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatbotCubit, ChatbotState>(
      bloc: _chatbotCubit,
      listenWhen: (previous, current) => 
        previous.isError != current.isError && current.isError == true,
      listener: (context, state) {
        ErrorMessenger(state.errorMessage).show(context);       
      },
      child: BlocSelector<ChatbotCubit, ChatbotState, bool>(
        bloc: _chatbotCubit,
        selector: (state) => state.isDrawerOpen,
        builder: (context, isDrawerOpen) {
          return LearningChatbotScaffold(
            padding: false,
            resizeToAvoidBottomInset: !isDrawerOpen,
            onDrawerChanged: onDrawerChanged,
            drawer: BlocBuilder<ChatbotCubit, ChatbotState>(
              bloc: _chatbotCubit,
              builder: (context, state) {
                return SlidingDrawer(chatbotCubit: _chatbotCubit);
              },
            ),
            body: Column(
              children: [
                ChatAppBar(),
                Expanded(
                  child: BlocBuilder<ChatbotCubit, ChatbotState>(
                    bloc: _chatbotCubit,
                    builder: (context, state) => ChatListView(
                      chatScrollController: state.chatScrollController,
                      chatList: state.chatList,
                      isLoadingChats: state.isLoadingChats,
                      isWaitingAI: state.isLoading,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Divider(),
                    Padding(
                      padding: const EdgeInsetsGeometry.symmetric(
                        horizontal: 10,
                      ),
                      child: BlocBuilder<ChatbotCubit, ChatbotState>(
                        bloc: _chatbotCubit,
                        builder: (context, state) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Scrollbar(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: state.isLoading
                                        ? ''
                                        : 'Enter text...',
                                    ),
                                    controller: state.newChatController,
                                    minLines: 1,
                                    maxLines: 5,
                                    readOnly: state.isLoading,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (state.isNewChatController3Lines)
                                    Transform.scale(
                                      scale: 0.6,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            nav.push(FullscreenTextfieldPage(
                                              controller: state.newChatController,
                                            ));
                                          },
                                          iconSize: 30,
                                          padding: EdgeInsets.zero,
                                          icon: Icon(
                                            Icons.open_in_full_rounded,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (state.imageFile != null && !state.isLoading)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.file(
                                            state.imageFile!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => _chatbotCubit.takePhoto(),
                              icon: Icon(Icons.camera_alt),
                            ),
                            IconButton(
                              onPressed: () => _chatbotCubit.pickImage(),
                              icon: Icon(Icons.image),
                            ),
                            BlocBuilder<ChatbotCubit, ChatbotState>(
                              bloc: _chatbotCubit,
                              builder: (context, state) {
                                return IconButton(
                                  onPressed: () => onOpenSymbolKeyboard(
                                    state.titleSearchController.text,
                                  ),
                                  icon: Icon(Icons.functions),
                                );
                              },
                            ),
                          ],
                        ),
                        BlocBuilder<ChatbotCubit, ChatbotState>(
                          bloc: _chatbotCubit,
                          builder: (context, state) {
                            return IconButton(
                              onPressed: () {
                                if (state.isLoading) return ;
                                if (state.newChatController.text.trim() == "") {
                                  WarningMessenger("Please prompt something").show(context);
                                  return ;
                                }
                                _chatbotCubit.onSubmitNewChat();
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  state.isLoading
                                    ? Colors.grey.shade700 : Colors.purple,
                                ),
                              ),
                              icon: Icon(Icons.arrow_upward),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
