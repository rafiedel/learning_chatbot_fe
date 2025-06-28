import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_chatbot/core/client/_client.dart';
import 'package:learning_chatbot/core/environments/_environments.dart';
import 'package:learning_chatbot/core/extenstions/_extensions.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/completions_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/delete_session_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_messages_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_sessions_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/rename_session_params.dart';

part 'chatbot_remote_data_source.dart';
part 'chatbot_remote_data_source_impl.dart';