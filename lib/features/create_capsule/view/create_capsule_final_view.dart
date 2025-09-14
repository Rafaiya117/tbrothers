import 'package:appsoleum/core/components/custom_button.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/create_capsule/controller/capsule_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateCapsuleFinalView extends StatelessWidget {
  const CreateCapsuleFinalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          //height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
          decoration: BoxDecoration(
            gradient: AppGradientColors.background_color,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  'assets/icons/arrow_back.svg',
                  width: 16.w,
                  height: 10.h,
                ),
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Here's What You'll Seal",
                  style: GoogleFonts.inter(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "This capsule will stay sealed until your chosen date",
                  style: GoogleFonts.inter(
                    color: FontColors.text_colors,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/family.png',
                  height: 280.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Description",
                  style: GoogleFonts.inter(
                    color: Color(0xFF84869F),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Making Memories with my kids!",
                  style: GoogleFonts.inter(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Crafting lasting memories with my kids is one of the\nmost rewarding experiences. Whether we’re\nexploring nature, baking together, or simply enjoying\na movie night at home, each moment is filled with\nlaughter and joy.",
                  style: GoogleFonts.inter(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w200,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Delivary Date",
                  style: GoogleFonts.inter(
                    color: Color(0xFF84869F),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              //SizedBox(height: 10.h),
              Consumer<CapsuleController>(
                builder: (context, controller, _) {
                  return Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox.expand(
                            child: CircularProgressIndicator(
                              value: controller.dayProgress,
                              strokeWidth: 10,
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.blue,
                              ),
                            ),
                          ),
                          Text(
                            "${controller.daysRemaining} Days",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              CustomRoundedButton(
                text: "Next",
                backgroundColor: FontColors.button_color,
                textColor: Colors.white,
                onPressed: () {
                  //context.push('/capsule_final_view');
                },
              ),
            ],
          ),
        ),
      ),
    );
    }
  }
//SizedBox(height: 20.h),