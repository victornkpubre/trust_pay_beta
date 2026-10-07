import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/local_data_source.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/data/network/db_api_client.dart';
import 'package:trust_pay_beta/main/data/services/chat_service.dart';
import 'package:trust_pay_beta/main/data/services/voice_service.dart';
import 'package:trust_pay_beta/main/data/network/dio_factory.dart';
import 'package:trust_pay_beta/main/data/repositories/auth_repository.dart';
import 'package:trust_pay_beta/main/data/repositories/transaction_repository.dart';
import 'package:trust_pay_beta/main/data/repositories/user_repository.dart';
import 'package:trust_pay_beta/main/domain/repository/repositories.dart';
import 'package:trust_pay_beta/main/presentation/blocs/auth/auth_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';

class DependencyInjector {
  late SharedPreferences _sharedPreferences;
  late AppPreferences _appPreferences;
  late DioFactory _dioFactory;
  late Dio _dio;
  late AuthRepository _authRepository;
  late UserRepository _userRepository;
  late TransactionRepository _transactionRepository;
  late RemoteDataSource _remoteDataSource;
  late LocalDataSource _localDataSource;
  late DataBaseApiClient _databaseServiceClient;
  late ChatService _chatService;
  late VoiceService _voiceService;

  DependencyInjector();

  initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _appPreferences = AppPreferences(_sharedPreferences);
    _dioFactory = DioFactory(_appPreferences);
    _dio = await _dioFactory.getDio();
    // Explicit baseUrl: the generated client otherwise hardcodes the
    // production URL from codegen time, ignoring API_BASE_URL.
    _databaseServiceClient = DataBaseApiClient(_dio, baseUrl: AppConstants.baseUrl);
    _localDataSource = LocalDataSourceImplementation(_appPreferences);
    _remoteDataSource = RemoteDataSourceImplementation(_databaseServiceClient);
    _authRepository = AuthRepositoryImplementation(_remoteDataSource, _localDataSource, _appPreferences);
    _userRepository = UserRepositoryImplementation(_remoteDataSource, _localDataSource);
    _transactionRepository = TransactionRepositoryImplementation(_remoteDataSource, _localDataSource);
    _chatService = ChatService(_appPreferences);
    _voiceService = VoiceService(_appPreferences);
  }

  List<SingleChildWidget> inject() {
    return [
      Provider<AppPreferences>(create: (_) => _appPreferences),
      Provider<DioFactory>(create: (_) => _dioFactory),
      Provider<RemoteDataSource>(create: (_) => _remoteDataSource),
      Provider<ChatService>(create: (_) => _chatService),
      Provider<VoiceService>(create: (_) => _voiceService),
      BlocProvider(create: (context) => AuthBloc(_authRepository)),
      BlocProvider(create: (context) => UserBloc(_appPreferences, _userRepository)),
      BlocProvider(create: (context) => TransactionBloc(_transactionRepository)),
      BlocProvider(create: (context) => TransactionDetailsBloc(_transactionRepository)),
    ];
  }
}
