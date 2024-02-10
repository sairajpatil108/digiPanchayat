class Event {
  final String eventName;
  final String dateTime;

  Event({required this.eventName, required this.dateTime});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventName: json['eventName'],
      dateTime: json['dateTime'],
    );
  }
}

List<Event> eventData = [
  Event(eventName: "MLA visit", dateTime: "2024-02-05 10:00:00"),
  Event(eventName: "Gram Sabha", dateTime: "2024-03-15 15:30:00"),
  Event(eventName: "Conference", dateTime: "2024-04-20 09:00:00"),
  Event(eventName: "Training Session", dateTime: "2024-05-10 14:00:00"),
  Event(eventName: "Blood Donation", dateTime: "2024-06-25 18:00:00"),
  Event(eventName: "Meeting with Team", dateTime: "2024-02-05 10:00:00"),
  Event(eventName: "Gram Sabha", dateTime: "2024-03-15 15:30:00"),
  Event(eventName: "Conference", dateTime: "2024-04-20 09:00:00"),
  Event(eventName: "Training Session", dateTime: "2024-05-10 14:00:00"),
  Event(eventName: "Blood Donation", dateTime: "2024-06-25 18:00:00"),
];
