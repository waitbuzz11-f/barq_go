import 'package:barq_go/core/enum/trip_step.dart';
import 'package:barq_go/features/home/presentaion/views/widgets/map_widget.dart';
import 'package:barq_go/features/trip_tracking/presentaion/cubit/trip_tracking_cubit.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/choose_price_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/choose_service_type_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/choose_vehicle_type_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/confuirm_location_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/delivery_fee_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/detect_location_header.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/driver_offers_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/driver_on_the_way_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/form_deliver_type/form_deliver_type_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/location_sugestion_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/order_summary_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/provider_on_the_way.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/provider_verfication_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/searching_for_driver_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/service_time_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/track_package_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/trip_completed_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/trip_details_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/trip_in_progress_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/trip_review_content.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/trip_tracking_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripTrackingView extends StatelessWidget {
  const TripTrackingView({super.key});

  bool _shouldShowHeader(TripStep step) {
    return step != TripStep.tripInProgress &&
        step != TripStep.tripCompleted &&
        step != TripStep.tripReview;
  }

  double _getSheetExtent(TripStep step) {
    switch (step) {
      case TripStep.pickup:
        return 0.30;
      case TripStep.destination:
        return 0.40;
      case TripStep.details:
        return 0.30;
      case TripStep.vehicle:
        return 0.40;
      case TripStep.price:
        return 0.30;
      case TripStep.searching:
        return 0.38;
      case TripStep.offers:
        return 0.50;
      case TripStep.driverInTheWay:
        return 0.36;
      case TripStep.tripInProgress:
        return 0.33;
      case TripStep.tripCompleted:
        return 0.3;
      case TripStep.tripReview:
        return 0.45;
      case TripStep.chooseServiceType:
        return 0.50;
      case TripStep.timeYouWantService:
        return 0.30;
      case TripStep.deliverTypeContentForm:
        return 0.90;
      case TripStep.deliveryFee:
        return 0.30;
      case TripStep.trackPackage:
        return 0.55;
      case TripStep.orderSummary:
        return 0.40;
      case TripStep.providerOnTheWay:
        return 0.40;
      case TripStep.providerVerification:
        return 0.50;
    }
  }

  String _getTitle(TripStep step) {
    switch (step) {
      case TripStep.pickup:
        return 'select_pickup_location';

      case TripStep.destination:
        return 'select_destination';

      case TripStep.details:
        return 'trip_details';

      case TripStep.vehicle:
        return 'choose_vehicle_type';

      case TripStep.price:
        return 'suggest_price';

      case TripStep.searching:
        return 'searching_for_driver';

      case TripStep.offers:
        return 'driver_offers';
      case TripStep.driverInTheWay:
        return 'driver_on_the_way';
      case TripStep.tripInProgress:
        return 'trip_in_progress';
      case TripStep.tripCompleted:
        return 'trip_completed';
      case TripStep.tripReview:
        return 'trip_review';
      case TripStep.chooseServiceType:
        return 'transport_and_flatbeds';
      case TripStep.timeYouWantService:
        return 'service_time';
      case TripStep.deliverTypeContentForm:
        return 'package_details';
      case TripStep.deliveryFee:
        return 'delivery_pricing';
      case TripStep.trackPackage:
        return 'track_package';
      case TripStep.orderSummary:
        return 'order_summary';
      case TripStep.providerOnTheWay:
        return 'provider_on_the_way';
      case TripStep.providerVerification:
        return "provider_verification";
    }
  }

  Widget _buildContent(BuildContext context, TripStep step) {
    final cubit = context.read<TripTrackingCubit>();

    switch (step) {
      case TripStep.pickup:
        return ConfuirmLocationContent(onConfirm: cubit.confirmPickup);

      case TripStep.destination:
        return LocationSugestionContent(
          onLocationSelected: cubit.selectDestination,
        );

      case TripStep.details:
        return TripDetailsContent(onChooseVehicleType: cubit.showVehicleTypes);

      case TripStep.vehicle:
        return ChooseVehicleTypeContent(onNext: cubit.selectVehicle);

      case TripStep.price:
        return ChoosePriceContent(onSendRequest: cubit.sendRequest);

      case TripStep.searching:
        return SearchingForDriverContent(onCancel: cubit.cancelSearch);

      case TripStep.offers:
        return DriverOffersContent(onOfferAccepted: cubit.onOfferAccepted);
      case TripStep.driverInTheWay:
        return DriverOnTheWayContent(
          startTrip: cubit.startTrip,
          startChat: cubit.startChat,
        );
      case TripStep.tripInProgress:
        return TripInProgressContent(onCompleted: cubit.tripOnCompleted);
      case TripStep.tripCompleted:
        return TripCompletedContent(makeReview: cubit.makeReview);
      case TripStep.tripReview:
        return const TripReviewContent();
      case TripStep.chooseServiceType:
        return const ChooseServiceTypeContent();
      case TripStep.timeYouWantService:
        return const ServiceTimeContent();
      case TripStep.deliverTypeContentForm:
        return const FormDeliverTypeContent();
      case TripStep.deliveryFee:
        return const DeliveryFeeContent();
      case TripStep.trackPackage:
        return const TrackPackageContent();
      case TripStep.orderSummary:
        return const OrderSummaryContent();
      case TripStep.providerOnTheWay:
        return const ProviderOnTheWay();
      case TripStep.providerVerification:
        return const ProviderVerficationContent();
    }
  }

  void _handleBack(BuildContext context, TripStep step) {
    if (step == TripStep.pickup) {
      Navigator.of(context).pop();
      return;
    }
    context.read<TripTrackingCubit>().back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TripTrackingCubit, TripStep>(
        builder: (context, step) {
          return Stack(
            children: [
              const Positioned.fill(child: MapWidget()),

              Positioned.fill(
                child: TripTrackingSheet(
                  key: ValueKey(step),
                  extent: _getSheetExtent(step),
                  content: _buildContent(context, step),
                ),
              ),

              if (_shouldShowHeader(step))
                Positioned(
                  top: 40.h,
                  left: 16.w,
                  right: 16.w,
                  child: DetectLocationHeader(
                    titleKey: _getTitle(step),
                    onBack: () => _handleBack(context, step),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
