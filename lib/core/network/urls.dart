const scheme = 'https://';
const host = 'dibs.toadres.pl';

const server = '$scheme$host';

const _api = '$server/api';

const _auth = '$_api/auth';

const loginPath = '$_auth/login';
const logoutPath = '$_auth/logout';
const registerPath = '$_auth/register';

const categoriesPath = '$_api/categories';
