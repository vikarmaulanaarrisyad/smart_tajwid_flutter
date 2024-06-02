import '../models/tajwid_rule.dart';

List<TajwidRule> tajwidRules = [
  TajwidRule(
    name: 'Idgham',
    definition:
        'Idgham adalah memasukkan huruf nun mati atau tanwin ke huruf hijaiyah berikutnya.',
    example: 'مَنْ يَقْرَأْ',
    nadhom: 'من يرملون لتقديرهم يبذغ',
    letters: ['ي', 'ر', 'م', 'ل', 'و', 'ن'],
  ),
  // Add more rules here
];
