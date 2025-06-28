import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_chatbot/features/chatbot/data/models/chat.dart';
import 'package:learning_chatbot/features/chatbot/data/models/group_chat.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/completions_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/completions_usecase.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/delete_session_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/delete_session_usecase.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_messages_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_messages_usecase.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_sessions_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_sessions_usecase.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/rename_session_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/rename_session_usecase.dart';
import 'package:learning_chatbot/services/logger_service.dart';

part 'chatbot_cubit.dart';
part 'chatbot_state.dart';
