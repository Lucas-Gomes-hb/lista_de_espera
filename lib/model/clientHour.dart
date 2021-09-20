class ClientHour {
  static String getHour() {
    String comunHour;
    String comunMinute;

    switch (DateTime.now().hour) {
      case 0:
        comunHour = "00";
        break;
      case 1:
        comunHour = "01";
        break;
      case 2:
        comunHour = "02";
        break;
      case 3:
        comunHour = "03";
        break;
      case 4:
        comunHour = "04";
        break;
      case 5:
        comunHour = "05";
        break;
      case 6:
        comunHour = "06";
        break;
      case 7:
        comunHour = "07";
        break;
      case 8:
        comunHour = "08";
        break;
      case 9:
        comunHour = "09";
        break;
      default:
        comunHour = DateTime.now().hour.toString();
    }
    switch (DateTime.now().minute) {
      case 0:
        comunMinute = "00";
        break;
      case 1:
        comunMinute = "01";
        break;
      case 2:
        comunMinute = "02";
        break;
      case 3:
        comunMinute = "03";
        break;
      case 4:
        comunMinute = "04";
        break;
      case 5:
        comunMinute = "05";
        break;
      case 6:
        comunMinute = "06";
        break;
      case 7:
        comunMinute = "07";
        break;
      case 8:
        comunMinute = "08";
        break;
      case 9:
        comunMinute = "09";
        break;
      default:
        comunMinute = DateTime.now().minute.toString();
    }

    String stringHour = comunHour + ":" + comunMinute;

    return stringHour;
  }

  static String getTimeMist() {
    String comunHour;
    String comunMinute;
    String comunSecond;

    switch (DateTime.now().hour) {
      case 0:
        comunHour = "00";
        break;
      case 1:
        comunHour = "01";
        break;
      case 2:
        comunHour = "02";
        break;
      case 3:
        comunHour = "03";
        break;
      case 4:
        comunHour = "04";
        break;
      case 5:
        comunHour = "05";
        break;
      case 6:
        comunHour = "06";
        break;
      case 7:
        comunHour = "07";
        break;
      case 8:
        comunHour = "08";
        break;
      case 9:
        comunHour = "09";
        break;
      default:
        comunHour = DateTime.now().hour.toString();
    }
    switch (DateTime.now().minute) {
      case 0:
        comunMinute = "00";
        break;
      case 1:
        comunMinute = "01";
        break;
      case 2:
        comunMinute = "02";
        break;
      case 3:
        comunMinute = "03";
        break;
      case 4:
        comunMinute = "04";
        break;
      case 5:
        comunMinute = "05";
        break;
      case 6:
        comunMinute = "06";
        break;
      case 7:
        comunMinute = "07";
        break;
      case 8:
        comunMinute = "08";
        break;
      case 9:
        comunMinute = "09";
        break;
      default:
        comunMinute = DateTime.now().minute.toString();
    }
    switch (DateTime.now().second) {
      case 0:
        comunSecond = "00";
        break;
      case 1:
        comunSecond = "01";
        break;
      case 2:
        comunSecond = "02";
        break;
      case 3:
        comunSecond = "03";
        break;
      case 4:
        comunSecond = "04";
        break;
      case 5:
        comunSecond = "05";
        break;
      case 6:
        comunSecond = "06";
        break;
      case 7:
        comunSecond = "07";
        break;
      case 8:
        comunSecond = "08";
        break;
      case 9:
        comunSecond = "09";
        break;
      default:
        comunSecond = DateTime.now().second.toString();
    }

    String stringTimeMist = comunHour + comunMinute + comunSecond;

    return stringTimeMist;
  }
}
