import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:intl/intl.dart';
import 'package:learning_chatbot/app.dart';
import 'package:learning_chatbot/features/chatbot/data/models/chat.dart';
import 'package:learning_chatbot/features/chatbot/presentation/cubit/_cubit.dart';
import 'package:learning_chatbot/features/chatbot/presentation/widgets/delete_confirm_dialog.dart';
import 'package:learning_chatbot/features/chatbot/presentation/widgets/edit_title_dialog.dart';
import 'package:learning_chatbot/features/chatbot/presentation/widgets/more_pop_up_menu_button.dart';
import 'package:learning_chatbot/features/profile/presentation/pages/_pages.dart';
import 'package:shimmer/shimmer.dart';

part 'symbol_sheet.dart';
part 'sliding_drawer.dart';
part 'user_bubble_chat.dart';
part 'assistant_markdown.dart';
part 'chat_app_bar.dart';
part 'chat_list_view.dart';
part 'title_text_field.dart';
part 'skeleton_chat_listview.dart';
part 'skeleton_group_chat_listview.dart';
part 'waving_type_indicator.dart';
part 'empty_chat_listview.dart';
