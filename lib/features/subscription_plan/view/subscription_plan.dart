import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/subscription_plan/controller/subscription_controller.dart';
import 'package:appsoleum/features/subscription_plan/widget/subscription_plan_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SubscriptionPlansPage extends StatelessWidget {
  const SubscriptionPlansPage({super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Color(0xFF017FDC),
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow_back.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Subscription Plans',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradientColors.background_color,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pick your plan:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Consumer<SubscriptionPlansController>(
                builder: (context, controller, child) {
                  final plans = controller.plans; 
                  return GridView.builder(
                    shrinkWrap: true, 
                    physics: const NeverScrollableScrollPhysics(), 
                    itemCount: plans.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.55,
                    ),
                    itemBuilder: (context, index) {
                      final plan = plans[index];
                      return PlanCard(
                        planName: plan['name'] as String,
                        price: plan['price'] as String,
                        features: plan['features'] as List<String>,
                        buttonText: 'Upgrade', 
                        buttonColor: plan['buttonColor'] as Color,
                        isViewerPlan: plan['isViewerPlan'] as bool,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}