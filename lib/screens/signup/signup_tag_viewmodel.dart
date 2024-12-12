import 'package:flutter/cupertino.dart';

import '../../utils/constants.dart';

class SignupTagViewModel extends ChangeNotifier {
  int _currentStep = 0; // 현재 회원가입 단계
  get currentStep => _currentStep;

  List<String> _selectedAgeGroups = [];
  get selectedAgeGroups => _selectedAgeGroups;

  List<String> _selectedAreaGroups = [];
  get selectedAreaGroups => _selectedAreaGroups;

  bool _isNextButtonEnabled = false;
  get isNextButtonEnabled => _isNextButtonEnabled;

  void setCurrentStep(int step) {
    _currentStep = step;
    notifyListeners();
  }

  void setSelectedAgeGroups(List<String> groups) {
    _selectedAgeGroups = groups;
    _isNextButtonEnabled = groups.isNotEmpty;
    notifyListeners();
  }

  void setSelectedAreaGroups(List<String> groups) {
    _selectedAreaGroups = groups;
    _isNextButtonEnabled = groups.isNotEmpty;
    notifyListeners();
  }

  void goToNextStep() {
    if (_currentStep < MAX_SIGNUP_STEP - 1) {
      _currentStep++;
      _isNextButtonEnabled = false;
      notifyListeners();
    }
  }

  void goToPreviousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      switch (_currentStep) {
        case 0:
          _isNextButtonEnabled = _selectedAgeGroups.isNotEmpty;
          break;
        case 1:
          _isNextButtonEnabled = _selectedAreaGroups.isNotEmpty;
          break;
        default:
          _isNextButtonEnabled = false;
      }
      notifyListeners();
    }
  }
}