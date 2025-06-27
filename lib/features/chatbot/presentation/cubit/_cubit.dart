import 'dart:async';

import 'package:either_dart/src/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_chatbot/core/errors/failure.dart';
import 'package:learning_chatbot/core/extenstions/_extensions.dart';
import 'package:learning_chatbot/features/chatbot/data/models/chat.dart';
import 'package:learning_chatbot/features/chatbot/data/models/group_chat.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_messages_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_messages_usecase.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_sessions_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_sessions_usecase.dart';
import 'package:learning_chatbot/features/chatbot/presentation/widgets/_widgets.dart';
import 'package:learning_chatbot/services/logger_service.dart';

part 'chatbot_cubit.dart';
part 'chatbot_state.dart';
