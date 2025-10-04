import 'package:flutter/material.dart';

class SubscriptionPlansController extends ChangeNotifier{
  static final SubscriptionPlansController _instance = SubscriptionPlansController._internal();

  factory SubscriptionPlansController() {
    return _instance;
  }

  SubscriptionPlansController._internal();
  final List<Map<String, dynamic>> _plans = const [
    {
      'name': 'Legacy Basic (Free)',
      'price': '\$0',
      'features': [
        'Free Plan (Hook).',
        'Limited storage.',
        'Basic legacy capsules.',
        'Text + a few video/voice messages). Limited to 5 each',
        'Top storage',
      ],
      'buttonColor': Color(0xFF9EA3B0),
      'isViewerPlan': false,
    },
    {
      'name': 'Legacy Plus',
      'price': '\$9.99',
      'features': [
        'Advanced privacy',
        'AI curation',
        'higher storage cap',
        'Unlimited capsules',
        'extended scheduling.',
      ],
      'buttonColor': Color(0xFF9EA3B0),
      'isViewerPlan': false,
    },
    {
      'name': 'Creator Pro',
      'price': '\$19.99',
      'features': [
        'Monetization tools',
        'Branded libraries',
        'Revenue dashboard',
        'Top storage',
      ],
      'buttonColor': Color(0xFF9EA3B0),
      'isViewerPlan': false,
    },
    {
      'name': 'Viewer (Free)',
      'price': '\$0',
      'features': [
        'Note: No monetization, can tip/unlock/pay for capsules',
      ],
      'buttonColor': Color(0xFFFF7B3D),
      'isViewerPlan': true,
    },
  ];

  List<Map<String, dynamic>> get plans => _plans;
  List<Map<String, dynamic>> getPlans() {
    return List.from(_plans);
  }
  void upgradePlan(String planName) {
    print('Controller received request to upgrade to: $planName');
  }
}