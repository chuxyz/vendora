part of 'register_vendor_bloc.dart';

abstract class RegisterVendorEvent extends Equatable {
  const RegisterVendorEvent();

  @override
  List<Object?> get props => [];
}

class BrandNameUnfocused extends RegisterVendorEvent {}

class BrandNameChanged extends RegisterVendorEvent {
  const BrandNameChanged({required this.brandName});
  final String brandName;

  @override
  List<Object> get props => [brandName];
}

class LogoPicked extends RegisterVendorEvent {}

class DescriptionUnfocused extends RegisterVendorEvent {}

class DescriptionChanged extends RegisterVendorEvent {
  const DescriptionChanged({required this.description});
  final String description;

  @override
  List<Object> get props => [description];
}

class TagUnfocused extends RegisterVendorEvent {}

class TagChanged extends RegisterVendorEvent {
  const TagChanged({required this.tags});
  final String tags;

  @override
  List<Object> get props => [tags];
}

class CategoryChanged extends RegisterVendorEvent {
  const CategoryChanged({required this.category});
  final String? category;

  @override
  List<Object?> get props => [category];
}

class StateNameChanged extends RegisterVendorEvent {
  const StateNameChanged({required this.stateName});
  final String? stateName;

  @override
  List<Object?> get props => [stateName];
}

class LgaNameChanged extends RegisterVendorEvent {
  const LgaNameChanged({required this.lgaName});
  final String? lgaName;

  @override
  List<Object?> get props => [lgaName];
}

class BrandEmailUnfocused extends RegisterVendorEvent {}

class BrandEmailChanged extends RegisterVendorEvent {
  const BrandEmailChanged({required this.email});
  final String email;

  @override
  List<Object> get props => [email];
}

class BrandPhoneUnfocused extends RegisterVendorEvent {}

class BrandPhoneChanged extends RegisterVendorEvent {
  const BrandPhoneChanged({required this.phone});
  final String phone;

  @override
  List<Object> get props => [phone];
}

class LoadCategoryData extends RegisterVendorEvent{}

class LoadLgaData extends RegisterVendorEvent{}