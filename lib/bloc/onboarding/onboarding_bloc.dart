import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/customer_cache/customer_cache.dart';
import '../../di/app_module.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();

  OnboardingBloc() : super(OnboardingInitial()) {
    on<CheckIfLoggedIn>(_checkIfLoggedIn);
  }

  FutureOr<void> _checkIfLoggedIn(
      CheckIfLoggedIn event, Emitter<OnboardingStates> emit) async {
    bool? isLoggedIn = await _customerCache.getIsLoggedIn();
    if (isLoggedIn == true) {
      emit(IsLoggedIn());
    }
  }
}
