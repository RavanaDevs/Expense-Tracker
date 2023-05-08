class Expense{

  String? userId;
  String description;
  double amount;
  DateTime? time;

  Expense({
    required this.description,
    required this.amount,
    this.time,
    this.userId
  });

  Map<String, dynamic> toMap(){
    return {
      'user_id': userId,
      'description': description,
      'amount': amount,
      'time': time
    };
  }

  factory Expense.fromMap(Map<String, dynamic> data){
    return Expense(
      userId: data['user_id'],
      description: data['description'],
      amount: double.parse(data['amount'].toString()),
      time: DateTime.tryParse(data['time'].toDate().toString()),
    );
  }

  @override
  String toString() {
    return "Expense ${userId} - ${amount} - ${time}";
  }

}