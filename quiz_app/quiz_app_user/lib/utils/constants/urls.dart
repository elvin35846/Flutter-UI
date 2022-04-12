class Urls {
  static String BASE_URL = 'testsms3.herokuapp.com';
  //auth
  static String LOGIN_URL = 'api/v1/auth/token/';
  static String CHANGE_PASSWORD_URL = 'api/v1/auth/password/change/';
  static String REGISTER_DEVICE_URL = 'api/v1/auth/register_device/';

  //student
  static String CREATE_STUDENT_URL = 'api/v1/users/students/';
  static String CHANGE_STUDENT_URL = 'api/v1/users/students/username/';
  static String GET_STUDENT_URL = 'api/v1/users/students/';

  //teacher
  static String CREATE_TEACHER_URL = 'api/v1/users/teachers/';
  static String CHANGE_TEACHER_URL = 'api/v1/users/teachers/finNumber/';
}
