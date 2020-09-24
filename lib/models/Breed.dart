// class generated using json to dart site
class Breed  {
  int adaptability;
  int affectionLevel;
  String altNames;
  String cfaUrl;
  int childFriendly;
  String countryCode;
  String countryCodes;
  String description;
  int dogFriendly;
  int energyLevel;
  int experimental;
  int grooming;
  int hairless;
  int healthIssues;
  int hypoallergenic;
  String id;
  int indoor;
  int intelligence;
  int lap;
  String lifeSpan;
  String name;
  int natural;
  String origin;
  int rare;
  int rex;
  int sheddingLevel;
  int shortLegs;
  int socialNeeds;
  int strangerFriendly;
  int suppressedTail;
  String temperament;
  String vcahospitalsUrl;
  String vetstreetUrl;
  int vocalisation;
  Weight weight;
  String wikipediaUrl;

  Breed(
      {this.adaptability,
        this.affectionLevel,
        this.altNames,
        this.cfaUrl,
        this.childFriendly,
        this.countryCode,
        this.countryCodes,
        this.description,
        this.dogFriendly,
        this.energyLevel,
        this.experimental,
        this.grooming,
        this.hairless,
        this.healthIssues,
        this.hypoallergenic,
        this.id,
        this.indoor,
        this.intelligence,
        this.lap,
        this.lifeSpan,
        this.name,
        this.natural,
        this.origin,
        this.rare,
        this.rex,
        this.sheddingLevel,
        this.shortLegs,
        this.socialNeeds,
        this.strangerFriendly,
        this.suppressedTail,
        this.temperament,
        this.vcahospitalsUrl,
        this.vetstreetUrl,
        this.vocalisation,
        this.weight,
        this.wikipediaUrl});

  Breed.fromJson(Map<String, dynamic> json) {
    adaptability = json['adaptability'];
    affectionLevel = json['affection_level'];
    altNames = json['alt_names'];
    cfaUrl = json['cfa_url'];
    childFriendly = json['child_friendly'];
    countryCode = json['country_code'];
    countryCodes = json['country_codes'];
    description = json['description'];
    dogFriendly = json['dog_friendly'];
    energyLevel = json['energy_level'];
    experimental = json['experimental'];
    grooming = json['grooming'];
    hairless = json['hairless'];
    healthIssues = json['health_issues'];
    hypoallergenic = json['hypoallergenic'];
    id = json['id'];
    indoor = json['indoor'];
    intelligence = json['intelligence'];
    lap = json['lap'];
    lifeSpan = json['life_span'];
    name = json['name'];
    natural = json['natural'];
    origin = json['origin'];
    rare = json['rare'];
    rex = json['rex'];
    sheddingLevel = json['shedding_level'];
    shortLegs = json['short_legs'];
    socialNeeds = json['social_needs'];
    strangerFriendly = json['stranger_friendly'];
    suppressedTail = json['suppressed_tail'];
    temperament = json['temperament'];
    vcahospitalsUrl = json['vcahospitals_url'];
    vetstreetUrl = json['vetstreet_url'];
    vocalisation = json['vocalisation'];
    weight =
    json['weight'] != null ? new Weight.fromJson(json['weight']) : null;
    wikipediaUrl = json['wikipedia_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adaptability'] = this.adaptability;
    data['affection_level'] = this.affectionLevel;
    data['alt_names'] = this.altNames;
    data['cfa_url'] = this.cfaUrl;
    data['child_friendly'] = this.childFriendly;
    data['country_code'] = this.countryCode;
    data['country_codes'] = this.countryCodes;
    data['description'] = this.description;
    data['dog_friendly'] = this.dogFriendly;
    data['energy_level'] = this.energyLevel;
    data['experimental'] = this.experimental;
    data['grooming'] = this.grooming;
    data['hairless'] = this.hairless;
    data['health_issues'] = this.healthIssues;
    data['hypoallergenic'] = this.hypoallergenic;
    data['id'] = this.id;
    data['indoor'] = this.indoor;
    data['intelligence'] = this.intelligence;
    data['lap'] = this.lap;
    data['life_span'] = this.lifeSpan;
    data['name'] = this.name;
    data['natural'] = this.natural;
    data['origin'] = this.origin;
    data['rare'] = this.rare;
    data['rex'] = this.rex;
    data['shedding_level'] = this.sheddingLevel;
    data['short_legs'] = this.shortLegs;
    data['social_needs'] = this.socialNeeds;
    data['stranger_friendly'] = this.strangerFriendly;
    data['suppressed_tail'] = this.suppressedTail;
    data['temperament'] = this.temperament;
    data['vcahospitals_url'] = this.vcahospitalsUrl;
    data['vetstreet_url'] = this.vetstreetUrl;
    data['vocalisation'] = this.vocalisation;
    if (this.weight != null) {
      data['weight'] = this.weight.toJson();
    }
    data['wikipedia_url'] = this.wikipediaUrl;
    return data;
  }
}

class Weight {
  String imperial;
  String metric;

  Weight({this.imperial, this.metric});

  Weight.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imperial'] = this.imperial;
    data['metric'] = this.metric;
    return data;
  }
}
