String nowTime() =>
    '${DateTime.now().hour}:${DateTime.now().minute} ${DateTime.now().hour < 12 ? 'AM' : 'PM'}';
