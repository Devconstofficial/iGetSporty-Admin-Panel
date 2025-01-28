import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/models/booking_model.dart';

class RevenueController extends GetxController {
  var selectedMonth = "January".obs;
  List<BookingModel> venueData = <BookingModel>[
    BookingModel(
      id: '1',
      venueName: 'Greenfield Arena',
      venueImage: ['image1.png'],
      ownerName: 'John Doe',
      venueLocation: 'Location A',
      date: "12 jan",
      bookingTimeFrom: "12:00",
      bookingTimeTo: "1:00",
    ),
    // BookingModel(
    //   id: '2',
    //   venueName: 'Midtown Sports Hub',
    //   sports: ['Badminton'],
    //   venueImage: ['image2.png'],
    //   ownerName: 'Jane Smith',
    //   venueLocation: 'Location B',
    //   dateTime: DateTime.now(),
    //   bookingStatus: 'Completed',
    //   totalBookings: 37,
    //   revenueGenerated: 4754.50,
    // ),
    // BookingModel(
    //   id: '3',
    //   venueName: 'Riverside Courts',
    //   sports: ['Table Tennis'],
    //   venueImage: ['image3.png'],
    //   ownerName: 'Alex Brown',
    //   venueLocation: 'Location C',
    //   dateTime: DateTime.now(),
    //   bookingStatus: 'Completed',
    //   totalBookings: 64,
    //   revenueGenerated: 2559.36,
    // ),
    // BookingModel(
    //   id: '4',
    //   venueName: 'Greyfield Arena',
    //   sports: ['Swimming'],
    //   venueImage: ['image4.png'],
    //   ownerName: 'Michael Green',
    //   venueLocation: 'Location D',
    //   dateTime: DateTime.now(),
    //   bookingStatus: 'Completed',
    //   totalBookings: 184,
    //   revenueGenerated: 3680.00,
    // ),
    // BookingModel(
    //   id: '5',
    //   venueName: 'Downtown Court',
    //   sports: ['Basketball'],
    //   venueImage: ['image5.png'],
    //   ownerName: 'Rachel White',
    //   venueLocation: 'Location E',
    //   dateTime: DateTime.now(),
    //   bookingStatus: 'Completed',
    //   totalBookings: 64,
    //   revenueGenerated: 1965.81,
    // ),
  ].obs;
}
