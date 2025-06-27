import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_chatbot/core/client/_client.dart';
import 'package:learning_chatbot/core/environments/_environments.dart';
import 'package:learning_chatbot/core/extenstions/_extensions.dart';
import 'package:learning_chatbot/features/chatbot/data/models/chat.dart';
import 'package:learning_chatbot/features/chatbot/data/models/group_chat.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_messages_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_sessions_params.dart';
import 'package:learning_chatbot/services/logger_service.dart';

part 'chatbot_remote_data_source.dart';
part 'chatbot_remote_data_source_impl.dart';