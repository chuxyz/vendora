import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'vendor_search_events.dart';
part 'vendor_search_states.dart';

class VendorSearchBloc extends Bloc<VendorSearchEvents, VendorSearchStates> {
  VendorSearchBloc() : super(VendorSearchStates());

  @override
  Stream<VendorSearchStates> mapEventToState(VendorSearchEvents event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}

class Vendor {
  final String name;
  Vendor(this.name);

  @override
  String toString() => 'Vendor {name: $name}';
}
