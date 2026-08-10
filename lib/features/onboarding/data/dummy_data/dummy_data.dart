import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/features/onboarding/data/models/onboarding_model.dart';

final List<OnboardingModel> dummyData = [
  OnboardingModel(
    imgPath: Assets.assetsImagesOnboarding1,
    title: 'your_ride_your_way',
    description: 'choose_destination_and_transport',
  ),
  OnboardingModel(
    imgPath: Assets.assetsImagesOnboarding2,
    title: 'you_set_the_price',
    description: 'set_price_and_receive_offers',
  ),
  OnboardingModel(
    imgPath: Assets.assetsImagesOnboarding3,
    title: 'safe_and_clear_choice',
    description: 'compare_before_confirming_driver',
  ),
];
