part of 'register_vendor_bloc.dart';

class RegisterVendorState extends Equatable {
  RegisterVendorState(
      {required this.brandName,
      required this.description,
      required this.tags,
      required this.category,
      required this.stateName,
      required this.lgaName,
      required this.email,
      required this.phone,
      required this.formStatus,
      required this.registerStatus,
      required this.errorText,
      required this.allLga});

  final String? brandName;
  final String? description;
  final String? tags;
  final String? category;
  final String? stateName;
  final String? lgaName;
  final String? email;
  final String? phone;
  final FormStatus formStatus;
  final RegisterStatus registerStatus;
  final Map<String, String?> errorText;
  final List<String> allLga;

  RegisterVendorState copyWith({
    String? brandName,
    String? description,
    String? tags,
    String? category,
    String? stateName,
    String? lgaName,
    String? email,
    String? phone,
    FormStatus? formStatus,
    RegisterStatus? registerStatus,
    Map<String, String?>? errorText,
    List<String>? allLga,
  }) {
    return RegisterVendorState(
      brandName: brandName ?? this.brandName,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      category: category ?? this.category,
      stateName: stateName ?? this.stateName,
      lgaName: lgaName ?? this.lgaName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      formStatus: formStatus ?? this.formStatus,
      registerStatus: registerStatus ?? this.registerStatus,
      errorText: errorText ?? this.errorText,
      allLga: allLga ?? this.allLga,
    );
  }

  @override
  List<Object?> get props => [
        brandName,
        description,
        tags,
        category,
        stateName,
        lgaName,
        email,
        phone,
        formStatus,
        registerStatus,
        errorText,
        allLga,
      ];
}

class RegisterVendorInitial extends RegisterVendorState {
  RegisterVendorInitial()
      : super(
          brandName: null,
          description: null,
          tags: null,
          category: null,
          stateName: null,
          lgaName: null,
          email: null,
          phone: null,
          formStatus: FormStatus.invalid,
          registerStatus: RegisterStatus.initial,
          errorText: {},
          allLga: [],
        );
}
