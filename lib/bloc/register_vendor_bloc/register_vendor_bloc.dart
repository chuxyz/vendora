import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_vendor_event.dart';
part 'register_vendor_state.dart';

class RegisterVendorBloc
    extends Bloc<RegisterVendorEvent, RegisterVendorState> {
  RegisterVendorBloc() : super(RegisterVendorInitial());

  @override
  Stream<RegisterVendorState> mapEventToState(
    RegisterVendorEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
