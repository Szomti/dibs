const scheme = 'https://';
const host = 'dibs.toadres.pl';

const server = '$scheme$host';

const _api = '$server/api';

const _auth = '$_api/auth';

const loginPath = '$_auth/login';
const logoutPath = '$_auth/logout';
const registerPath = '$_auth/register';

const reservations = '$_api/reservations';

const categoriesPath = '$_api/categories';

String locationsPath(int categoryId) {
  return '$categoriesPath/$categoryId/locations';
}

String itemsPath(int categoryId, int locationId) {
  return '${locationsPath(categoryId)}/$locationId/items';
}

String itemUpcomingReservationsPath(int itemId) {
  return '$_api/items/id/$itemId/reservations';
}

String _reservation(int reservationId) {
  return '$reservations/$reservationId';
}

String completeReservation(int reservationId) {
  return '${_reservation(reservationId)}/complete';
}

String activateReservation(int reservationId) {
  return '${_reservation(reservationId)}/activate';
}
