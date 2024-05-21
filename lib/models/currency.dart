class Currency {
  Data? data;

  Currency({this.data});

  Currency.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  double? AUD;
  double? BGN;
  double? BRL;
  double? CAD;
  double? CHF;
  double? CNY;
  double? CZK;
  double? DKK;
  double? EUR;
  double? GBP;
  double? HKD;
  double? HRK;
  double? HUF;
  double? IDR;
  double? ILS;
  double? INR;
  double? ISK;
  double? JPY;
  double? KRW;
  double? MXN;
  double? MYR;
  double? NOK;
  double? NZD;
  double? PHP;
  double? PLN;
  double? RON;
  double? RUB;
  double? SEK;
  double? SGD;
  double? THB;
  double? TRY;
  double? USD;
  double? ZAR;

  Data(
      {this.AUD,
      this.BGN,
      this.BRL,
      this.CAD,
      this.CHF,
      this.CNY,
      this.CZK,
      this.DKK,
      this.EUR,
      this.GBP,
      this.HKD,
      this.HRK,
      this.HUF,
      this.IDR,
      this.ILS,
      this.INR,
      this.ISK,
      this.JPY,
      this.KRW,
      this.MXN,
      this.MYR,
      this.NOK,
      this.NZD,
      this.PHP,
      this.PLN,
      this.RON,
      this.RUB,
      this.SEK,
      this.SGD,
      this.THB,
      this.TRY,
      this.USD,
      this.ZAR});

  Data.fromJson(Map<String, dynamic> json) {
    AUD = _toDouble(json['AUD']);
    BGN = _toDouble(json['BGN']);
    BRL = _toDouble(json['BRL']);
    CAD = _toDouble(json['CAD']);
    CHF = _toDouble(json['CHF']);
    CNY = _toDouble(json['CNY']);
    CZK = _toDouble(json['CZK']);
    DKK = _toDouble(json['DKK']);
    EUR = _toDouble(json['EUR']);
    GBP = _toDouble(json['GBP']);
    HKD = _toDouble(json['HKD']);
    HRK = _toDouble(json['HRK']);
    HUF = _toDouble(json['HUF']);
    IDR = _toDouble(json['IDR']);
    ILS = _toDouble(json['ILS']);
    INR = _toDouble(json['INR']);
    ISK = _toDouble(json['ISK']);
    JPY = _toDouble(json['JPY']);
    KRW = _toDouble(json['KRW']);
    MXN = _toDouble(json['MXN']);
    MYR = _toDouble(json['MYR']);
    NOK = _toDouble(json['NOK']);
    NZD = _toDouble(json['NZD']);
    PHP = _toDouble(json['PHP']);
    PLN = _toDouble(json['PLN']);
    RON = _toDouble(json['RON']);
    RUB = _toDouble(json['RUB']);
    SEK = _toDouble(json['SEK']);
    SGD = _toDouble(json['SGD']);
    THB = _toDouble(json['THB']);
    TRY = _toDouble(json['TRY']);
    USD = _toDouble(json['USD']);
    ZAR = _toDouble(json['ZAR']);
  }

  double? getCurrencyValue(Data data, String currencyCode) {
    switch (currencyCode) {
      case 'AUD': return data.AUD;
      case 'BGN': return data.BGN;
      case 'BRL': return data.BRL;
      case 'CAD': return data.CAD;
      case 'CHF': return data.CHF;
      case 'CNY': return data.CNY;
      case 'CZK': return data.CZK;
      case 'DKK': return data.DKK;
      case 'EUR': return data.EUR;
      case 'GBP': return data.GBP;
      case 'HKD': return data.HKD;
      case 'HRK': return data.HRK;
      case 'HUF': return data.HUF;
      case 'IDR': return data.IDR;
      case 'ILS': return data.ILS;
      case 'INR': return data.INR;
      case 'ISK': return data.ISK;
      case 'JPY': return data.JPY;
      case 'KRW': return data.KRW;
      case 'MXN': return data.MXN;
      case 'MYR': return data.MYR;
      case 'NOK': return data.NOK;
      case 'NZD': return data.NZD;
      case 'PHP': return data.PHP;
      case 'PLN': return data.PLN;
      case 'RON': return data.RON;
      case 'RUB': return data.RUB;
      case 'SEK': return data.SEK;
      case 'SGD': return data.SGD;
      case 'THB': return data.THB;
      case 'TRY': return data.TRY;
      case 'USD': return data.USD;
      case 'ZAR': return data.ZAR;
      default: return null;
    }
  }

  double? _toDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    } else {
      return 0.0;
    }
  }

  @override
  String toString() {
    return 'Data{AUD: $AUD, BGN: $BGN, BRL: $BRL, CAD: $CAD, CHF: $CHF, CNY: $CNY, CZK: $CZK, DKK: $DKK, EUR: $EUR, GBP: $GBP, HKD: $HKD, HRK: $HRK, HUF: $HUF, IDR: $IDR, ILS: $ILS, INR: $INR, ISK: $ISK, JPY: $JPY, KRW: $KRW, MXN: $MXN, MYR: $MYR, NOK: $NOK, NZD: $NZD, PHP: $PHP, PLN: $PLN, RON: $RON, RUB: $RUB, SEK: $SEK, SGD: $SGD, THB: $THB, TRY: $TRY, USD: $USD, ZAR: $ZAR}';
  }
}