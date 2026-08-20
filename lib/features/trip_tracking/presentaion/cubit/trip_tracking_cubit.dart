import 'package:barq_go/core/enum/trip_step.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripTrackingCubit extends Cubit<TripStep> {
  TripTrackingCubit() : super(TripStep.pickup);

  void confirmPickup() {
    emit(TripStep.destination);
  }

  void selectDestination(int locationIndex) {
    emit(TripStep.details);
  }

  void showVehicleTypes() {
    emit(TripStep.vehicle);
  }

  void selectVehicle(int vehicleIndex) {
    emit(TripStep.price);
  }

  Future<void> sendRequest(int price) async {
    emit(TripStep.searching);
  }

  void cancelSearch() {
    emit(TripStep.price);
  }

  void showDriverOffers() {
    emit(TripStep.offers);
  }

  void onOfferAccepted(int? id) {
    emit(TripStep.driverInTheWay);
  }

  void startChat() {}
  void startTrip() {
    emit(TripStep.tripInProgress);
  }

  void tripOnCompleted() {
    emit(TripStep.tripCompleted);
  }

  void makeReview() {
    emit(TripStep.tripReview);
  }

  void back() {
    switch (state) {
      case TripStep.pickup:
        return;
      case TripStep.destination:
        emit(TripStep.pickup);
      case TripStep.details:
        emit(TripStep.destination);
      case TripStep.vehicle:
        emit(TripStep.details);
      case TripStep.price:
        emit(TripStep.vehicle);
      case TripStep.searching:
        emit(TripStep.price);
      case TripStep.offers:
        emit(TripStep.searching);
      case TripStep.driverInTheWay:
        emit(TripStep.driverInTheWay);
      case TripStep.tripInProgress:
        emit(TripStep.tripInProgress);
      case TripStep.tripCompleted:
        emit(TripStep.tripCompleted);
      case TripStep.tripReview:
        emit(TripStep.tripReview);
    }
  }
}
