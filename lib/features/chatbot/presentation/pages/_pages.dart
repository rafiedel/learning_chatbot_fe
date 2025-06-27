import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_chatbot/app.dart';
import 'package:learning_chatbot/auth_gate.dart';
import 'package:learning_chatbot/core/bases/widgets/layouts/learningchatbot_scaffold.dart';
import 'package:learning_chatbot/features/chatbot/data/models/group_chat.dart';
import 'package:learning_chatbot/features/chatbot/presentation/cubit/_cubit.dart';
import 'package:learning_chatbot/features/chatbot/presentation/widgets/_widgets.dart';
import 'package:learning_chatbot/services/dependencies/di.dart';
import 'package:learning_chatbot/services/logger_service.dart';
import 'package:learning_chatbot/services/navigations/_navigations.dart';

part 'chatbot_page.dart';