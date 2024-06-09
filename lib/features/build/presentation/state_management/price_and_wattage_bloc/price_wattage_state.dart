class PriceWattageState {
  final dynamic price;
  final dynamic wattage;

  const PriceWattageState(this.price,this.wattage);

  List<Object> get props => [price,wattage];

  PriceWattageState copyWith({dynamic price, dynamic wattage}) {
    return PriceWattageState(price ?? this.price, wattage ?? this.wattage);
  }
}
