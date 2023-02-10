import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'base_state.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(BaseInitial());
}
