/// Represents a WiFi subscription plan offered on the captive portal.
class Plan {
  final String id;
  final String name;
  final int priceTzs; // price in Tanzanian Shillings (placeholder currency for v0)
  final String duration; // e.g. "24 hours"
  final String speed; // e.g. "5 Mbps"

  const Plan({
    required this.id,
    required this.name,
    required this.priceTzs,
    required this.duration,
    required this.speed,
  });

  /// Formatted price string, e.g. "1,000 TZS" or "Free" for 0.
  String get formattedPrice {
    if (priceTzs == 0) return 'Free';
    final str = priceTzs.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      final posFromEnd = str.length - i;
      buffer.write(str[i]);
      if (posFromEnd > 1 && posFromEnd % 3 == 1) {
        buffer.write(',');
      }
    }
    return '${buffer.toString()} TZS';
  }
}

/// Hard-coded plan catalogue for the v0 prototype.
const List<Plan> kAvailablePlans = [
  Plan(
    id: 'free_preview',
    name: 'Free Preview',
    priceTzs: 0,
    duration: '30 minutes',
    speed: '1 Mbps',
  ),
  Plan(
    id: 'day_pass',
    name: 'Day Pass',
    priceTzs: 1000,
    duration: '24 hours',
    speed: '5 Mbps',
  ),
  Plan(
    id: 'weekly',
    name: 'Weekly',
    priceTzs: 3000,
    duration: '7 days',
    speed: '5 Mbps',
  ),
  Plan(
    id: 'monthly_basic',
    name: 'Monthly Basic',
    priceTzs: 8000,
    duration: '30 days',
    speed: '5 Mbps',
  ),
  Plan(
    id: 'monthly_premium',
    name: 'Monthly Premium',
    priceTzs: 15000,
    duration: '30 days',
    speed: '15 Mbps',
  ),
];
