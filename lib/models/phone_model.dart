import 'dart:convert';

class PhoneModel {
  String? id;
  String? name;
  String? brand;
  String? mainImage;
  double? ourOpinion;
  String? releaseDate;
  Versions? versions;
  DesignAndStructur? designAndStructur;
  PerformanceAndHardware? performanceAndHardware;
  Camera? camera;
  Network? network;
  Connectiv? connectiv;
  Battery? battery;
  Software? software;
  Images? images;
  FeatureAndDiscard? featureAndDiscard;
  Gaming? gaming;
  Price? price;
  SupportedCountry? supportedCountry;
  PhoneModel({
    this.id,
    this.name,
    this.brand,
    this.mainImage,
    this.ourOpinion,
    this.releaseDate,
    this.versions,
    this.designAndStructur,
    this.performanceAndHardware,
    this.camera,
    this.network,
    this.connectiv,
    this.battery,
    this.software,
    this.images,
    this.featureAndDiscard,
    this.gaming,
    this.price,
    this.supportedCountry,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'mainImage': mainImage,
      'ourOpinion': ourOpinion,
      'releaseDate': releaseDate,
      'versions': versions,
      'designAndStructur': designAndStructur,
      'performanceAndHardware': performanceAndHardware,
      'camera': camera,
      'network': network,
      'connectiv': connectiv,
      'battery': battery,
      'software': software,
      'images': images,
      'featureAndDiscard': featureAndDiscard,
      'gaming': gaming,
      'price': price,
      'supportedCountry': supportedCountry,
    };
  }

  factory PhoneModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return PhoneModel();
    }

    return PhoneModel(
      id: map['id'].toString(),
      name: map['name'].toString(),
      brand: map['brand'].toString(),
      mainImage: map['mainImage'].toString(),
      ourOpinion: double.parse(map['ourOpinion'].toString()),
      releaseDate: map['releaseDate'].toString(),
      versions: Versions?.fromMap(map['versions'] as Map<String, dynamic>),
      designAndStructur: DesignAndStructur?.fromMap(
          map['designAndStructur'] as Map<String, dynamic>),
      performanceAndHardware: PerformanceAndHardware?.fromMap(
          map['performanceAndHardware'] as Map<String, dynamic>),
      camera: Camera?.fromMap(map['camera'] as Map<String, dynamic>),
      network: Network?.fromMap(map['network'] as Map<String, dynamic>),
      connectiv: Connectiv?.fromMap(map['connectiv'] as Map<String, dynamic>),
      battery: Battery?.fromMap(map['battery'] as Map<String, dynamic>),
      software: Software?.fromMap(map['software'] as Map<String, dynamic>),
      images: Images?.fromMap(map['images'] as Map<String, dynamic>),
      featureAndDiscard: FeatureAndDiscard?.fromMap(
          map['featureAndDiscard'] as Map<String, dynamic>),
      gaming: Gaming?.fromMap(map['gaming'] as Map<String, dynamic>),
      price: Price?.fromMap(map['price'] as Map<String, dynamic>),
      supportedCountry: SupportedCountry?.fromMap(
          map['supportedCountry'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PhoneModel.fromJson(String source) =>
      PhoneModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Versions {
  String? id;
  String? country;
  String? ram;
  String? space;
  String? price;
  Versions({
    this.id,
    this.country,
    this.ram,
    this.space,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'country': country,
      'ram': ram,
      'space': space,
      'price': price,
    };
  }

  factory Versions.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return Versions();
    }

    return Versions(
      id: map['id'].toString(),
      country: map['country'].toString(),
      ram: map['ram'].toString(),
      space: map['space'].toString(),
      price: map['price'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Versions.fromJson(String source) =>
      Versions.fromMap(json.decode(source) as Map<String, dynamic>);
}

class DesignAndStructur {
  Structure? structure;
  Screen? screen;
  DesignAndStructur({
    this.structure,
    this.screen,
  });

  Map<String, dynamic> toMap() {
    return {
      'structure': structure?.toMap(),
      'screen': screen?.toMap(),
    };
  }

  factory DesignAndStructur.fromMap(Map<String, dynamic>? map) {
    if (map == null) return DesignAndStructur();

    return DesignAndStructur(
      structure: Structure?.fromMap(map['structure'] as Map<String, dynamic>),
      screen: Screen?.fromMap(map['screen'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory DesignAndStructur.fromJson(String source) =>
      DesignAndStructur.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Structure {
  String? size;
  String? weight;
  int? usablesurface;
  String? materials;
  List<String>? colors;
  Structure({
    this.size,
    this.weight,
    this.usablesurface,
    this.materials,
    this.colors,
  });

  Map<String, dynamic> toMap() {
    return {
      'size': size,
      'weight': weight,
      'usablesurface': usablesurface,
      'materials': materials,
      'colors': colors?.map((x) => x).toList(),
    };
  }

  factory Structure.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Structure();

    return Structure(
      size: map['size'].toString(),
      weight: map['weight'].toString(),
      usablesurface: int.parse(map['usablesurface'].toString()),
      materials: map['materials'].toString(),
      colors: List<String>.from(map['colors'].map((x) => x) as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Structure.fromJson(String source) =>
      Structure.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Screen {
  String? type;
  String? diagonal;
  String? aspectRatio;
  String? resolution;
  String? density;
  List<String>? others;
  Screen({
    this.type,
    this.diagonal,
    this.aspectRatio,
    this.resolution,
    this.density,
    this.others,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'diagonal': diagonal,
      'aspectRatio': aspectRatio,
      'resolution': resolution,
      'density': density,
      'others': others?.map((x) => x).toList(),
    };
  }

  factory Screen.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Screen();

    return Screen(
      type: map['type'].toString(),
      diagonal: map['diagonal'].toString(),
      aspectRatio: map['aspectRatio'].toString(),
      resolution: map['resolution'].toString(),
      density: map['density'].toString(),
      others: List<String>.from(map['others']?.map((x) => x) as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Screen.fromJson(String source) =>
      Screen.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PerformanceAndHardware {
  Processor? processor;
  Graphics? graphics;
  Ram? ram;
  Antutu? antutu;
  Storage? storage;
  Security? security;
  Sensors? sensors;
  Other? other;
  PerformanceAndHardware({
    this.processor,
    this.graphics,
    this.ram,
    this.antutu,
    this.storage,
    this.security,
    this.sensors,
    this.other,
  });

  Map<String, dynamic> toMap() {
    return {
      'processor': processor?.toMap(),
      'graphics': graphics?.toMap(),
      'ram': ram?.toMap(),
      'antutu': antutu?.toMap(),
      'storage': storage?.toMap(),
      'security': security?.toMap(),
      'sensors': sensors?.toMap(),
      'other': other?.toMap(),
    };
  }

  factory PerformanceAndHardware.fromMap(Map<String, dynamic>? map) {
    if (map == null) return PerformanceAndHardware();

    return PerformanceAndHardware(
      processor: Processor?.fromMap(map['processor'] as Map<String, dynamic>),
      graphics: Graphics?.fromMap(map['graphics'] as Map<String, dynamic>),
      ram: Ram?.fromMap(map['ram'] as Map<String, dynamic>),
      antutu: Antutu?.fromMap(map['antutu'] as Map<String, dynamic>),
      storage: Storage?.fromMap(map['storage'] as Map<String, dynamic>),
      security: Security?.fromMap(map['security'] as Map<String, dynamic>),
      sensors: Sensors?.fromMap(map['sensors'] as Map<String, dynamic>),
      other: Other?.fromMap(map['other'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PerformanceAndHardware.fromJson(String source) =>
      PerformanceAndHardware.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class Processor {
  String? model;
  String? cpu;
  String? type;
  String? nanomete;
  String? freqency;
  Processor({
    this.model,
    this.cpu,
    this.type,
    this.nanomete,
    this.freqency,
  });

  Map<String, dynamic> toMap() {
    return {
      'model': model.toString(),
      'cpu': cpu?.toString(),
      'type': type?.toString(),
      'nanomete': nanomete?.toString(),
      'freqency': freqency?.toString(),
    };
  }

  factory Processor.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Processor();

    return Processor(
      model: map['model'].toString(),
      cpu: map['cpu'].toString(),
      type: map['type'].toString(),
      nanomete: map['nanomete'].toString(),
      freqency: map['freqency'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Processor.fromJson(String source) =>
      Processor.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Graphics {
  String? gpu;
  Graphics({
    this.gpu,
  });

  Map<String, dynamic> toMap() {
    return {
      'gpu': gpu,
    };
  }

  factory Graphics.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Graphics();

    return Graphics(
      gpu: map['gpu'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Graphics.fromJson(String source) =>
      Graphics.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Ram {
  String? ram;
  String? type;
  Ram({
    this.ram,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'ram': ram,
      'type': type,
    };
  }

  factory Ram.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Ram();

    return Ram(
      ram: map['ram'].toString(),
      type: map['type'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ram.fromJson(String source) =>
      Ram.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Antutu {
  String? points;
  Antutu({
    this.points,
  });

  Map<String, dynamic> toMap() {
    return {
      'points': points,
    };
  }

  factory Antutu.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Antutu();

    return Antutu(
      points: map['points'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Antutu.fromJson(String source) =>
      Antutu.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Storage {
  String? capacity;
  String? type;
  String? sdSlot;
  Storage({
    this.capacity,
    this.type,
    this.sdSlot,
  });

  Map<String, dynamic> toMap() {
    return {
      'capacity': capacity,
      'type': type,
      'sdSlot': sdSlot,
    };
  }

  factory Storage.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Storage();

    return Storage(
      capacity: map['capacity'].toString(),
      type: map['type'].toString(),
      sdSlot: map['sdSlot'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Storage.fromJson(String source) =>
      Storage.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Security {
  String? fingerprint;
  Security({
    this.fingerprint,
  });

  Map<String, dynamic> toMap() {
    return {
      'fingerprint': fingerprint,
    };
  }

  factory Security.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Security();

    return Security(
      fingerprint: map['fingerprint'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Security.fromJson(String source) =>
      Security.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Sensors {
  bool? fingeprint;
  bool? proximity;
  bool? lightSensor;
  bool? accelerometer;
  bool? compass;
  bool? gyroscope;
  bool? gravity;
  Sensors({
    this.fingeprint,
    this.proximity,
    this.lightSensor,
    this.accelerometer,
    this.compass,
    this.gyroscope,
    this.gravity,
  });

  Map<String, dynamic> toMap() {
    return {
      'fingeprint': fingeprint,
      'proximity': proximity,
      'lightSensor': lightSensor,
      'accelerometer': accelerometer,
      'compass': compass,
      'gyroscope': gyroscope,
      'gravity': gravity,
    };
  }

  factory Sensors.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Sensors();

    return Sensors(
      fingeprint: map['fingeprint'] as bool,
      proximity: map['proximity'] as bool,
      lightSensor: map['lightSensor'] as bool,
      accelerometer: map['accelerometer'] as bool,
      compass: map['compass'] as bool,
      gyroscope: map['gyroscope'] as bool,
      gravity: map['gravity'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sensors.fromJson(String source) =>
      Sensors.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Other {
  bool? notificationsLed;
  bool? coolingSystem;
  bool? gamingButton;
  Other({
    this.notificationsLed,
    this.coolingSystem,
    this.gamingButton,
  });

  Map<String, dynamic> toMap() {
    return {
      'notificationsLed': notificationsLed,
      'coolingSystem': coolingSystem,
      'gamingButton': gamingButton,
    };
  }

  factory Other.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Other();

    return Other(
      notificationsLed: map['notificationsLed'] as bool,
      coolingSystem: map['coolingSystem'] as bool,
      gamingButton: map['gamingButton'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Other.fromJson(String source) =>
      Other.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Camera {
  RearCamera? rearCamera;
  SelfieCamera? selfieCamera;
  Camera({
    this.rearCamera,
    this.selfieCamera,
  });

  Map<String, dynamic> toMap() {
    return {
      'rearCamera': rearCamera?.toMap(),
      'selfieCamera': selfieCamera?.toMap(),
    };
  }

  factory Camera.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Camera();

    return Camera(
      rearCamera:
          RearCamera?.fromMap(map['rearCamera'] as Map<String, dynamic>),
      selfieCamera:
          SelfieCamera?.fromMap(map['selfieCamera'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Camera.fromJson(String source) =>
      Camera.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SelfieCamera {
  int? countCamera;
  String? count;
  List<CameraModel>? camerasList;
  SelfieCamera({
    this.countCamera,
    this.count,
    this.camerasList,
  });

  Map<String, dynamic> toMap() {
    return {
      'countCamera': countCamera,
      'count': count,
      'camerasList': camerasList?.map((x) => x.toMap()).toList(),
    };
  }

  factory SelfieCamera.fromMap(Map<String, dynamic>? map) {
    if (map == null) return SelfieCamera();

    return SelfieCamera(
      countCamera: int.parse(map['countCamera'].toString()),
      count: map['count'].toString(),
      camerasList: List<CameraModel>.from(
        map['camerasList']
                ?.map((Map<String, dynamic> x) => CameraModel?.fromMap(x))
            as List<CameraModel>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SelfieCamera.fromJson(String source) =>
      SelfieCamera.fromMap(json.decode(source) as Map<String, dynamic>);
}

class RearCamera {
  int? countCamera;
  String? count;
  List<CameraModel>? camerasList;
  String? flashLed;
  bool? opticalStabilistaion;
  List<String>? features;
  RearCamera({
    this.countCamera,
    this.count,
    this.camerasList,
    this.flashLed,
    this.opticalStabilistaion,
    this.features,
  });

  Map<String, dynamic> toMap() {
    return {
      'countCamera': countCamera,
      'count': count,
      'camerasList': camerasList?.map((x) => x).toList(),
      'flashLed': flashLed,
      'opticalStabilistaion': opticalStabilistaion,
      'features': features?.map((x) => x).toList(),
    };
  }

  factory RearCamera.fromMap(Map<String, dynamic>? map) {
    if (map == null) return RearCamera();

    return RearCamera(
      countCamera: int?.parse(map['countCamera'].toString()),
      count: map['count'].toString(),
      camerasList: List<CameraModel>.from(
        map['camerasList']
                ?.map((Map<String, dynamic> x) => CameraModel?.fromMap(x))
            as List<CameraModel>,
      ),
      flashLed: map['flashLed'].toString(),
      opticalStabilistaion: map['opticalStabilistaion'] as bool,
      features: List<String>.from(
        map['features']?.map((x) => x) as List<String>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RearCamera.fromJson(String source) =>
      RearCamera.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CameraModel {
  String? lens;
  String? resolution;
  String? sensor;
  String? type;
  String? aperture;
  String? iso;
  String? pixelsSize;
  CameraModel({
    this.lens,
    this.resolution,
    this.sensor,
    this.type,
    this.aperture,
    this.iso,
    this.pixelsSize,
  });

  Map<String, dynamic> toMap() {
    return {
      'lens': lens,
      'resolution': resolution,
      'sensor': sensor,
      'type': type,
      'aperture': aperture,
      'iso': iso,
      'pixelsSize': pixelsSize,
    };
  }

  factory CameraModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) return CameraModel();

    return CameraModel(
      lens: map['lens'].toString(),
      resolution: map['resolution'].toString(),
      sensor: map['sensor'].toString(),
      type: map['type'].toString(),
      aperture: map['aperture'].toString(),
      iso: map['iso'].toString(),
      pixelsSize: map['pixelsSize'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CameraModel.fromJson(String source) =>
      CameraModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Network {
  bool? is5g;
  Network({
    this.is5g,
  });

  Map<String, dynamic> toMap() {
    return {
      'is5g': is5g,
    };
  }

  factory Network.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Network();

    return Network(
      is5g: map['is5g'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Network.fromJson(String source) =>
      Network.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Connectiv {
  SimCard? simCard;
  Wifi? wifi;
  Bluetooth? bluetooth;
  Navigation? navigation;
  Usb? usb;
  Others? others;
  Connectiv({
    this.simCard,
    this.wifi,
    this.bluetooth,
    this.navigation,
    this.usb,
    this.others,
  });

  Map<String, dynamic> toMap() {
    return {
      'simCard': simCard?.toMap(),
      'wifi': wifi?.toMap(),
      'bluetooth': bluetooth?.toMap(),
      'navigation': navigation?.toMap(),
      'usb': usb?.toMap(),
      'others': others?.toMap(),
    };
  }

  factory Connectiv.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Connectiv();

    return Connectiv(
      simCard: SimCard?.fromMap(map['simCard'] as Map<String, dynamic>),
      wifi: Wifi?.fromMap(map['wifi'] as Map<String, dynamic>),
      bluetooth: Bluetooth?.fromMap(map['bluetooth'] as Map<String, dynamic>),
      navigation:
          Navigation?.fromMap(map['navigation'] as Map<String, dynamic>),
      usb: Usb?.fromMap(map['usb'] as Map<String, dynamic>),
      others: Others?.fromMap(map['others'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Connectiv.fromJson(String source) =>
      Connectiv.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SimCard {
  String? type;
  SimCard({
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
    };
  }

  factory SimCard.fromMap(Map<String, dynamic>? map) {
    if (map == null) return SimCard();

    return SimCard(
      type: map['type'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory SimCard.fromJson(String source) =>
      SimCard.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Wifi {
  String? standors;
  List<String>? others;
  Wifi({
    this.standors,
    this.others,
  });

  Map<String, dynamic> toMap() {
    return {
      'standors': standors,
      'others': others?.map((x) => x).toList(),
    };
  }

  factory Wifi.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Wifi();

    return Wifi(
      standors: map['standors'].toString(),
      others: List<String>.from(map['others']?.map((x) => x) as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Wifi.fromJson(String source) =>
      Wifi.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Bluetooth {
  String? versions;
  List<String>? profiles;
  Bluetooth({
    this.versions,
    this.profiles,
  });

  Map<String, dynamic> toMap() {
    return {
      'versions': versions,
      'profiles': profiles?.map((x) => x).toList(),
    };
  }

  factory Bluetooth.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Bluetooth();

    return Bluetooth(
      versions: map['versions'].toString(),
      profiles:
          List<String>.from(map['profiles']?.map((x) => x) as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bluetooth.fromJson(String source) =>
      Bluetooth.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Navigation {
  String? supports;
  Navigation({
    this.supports,
  });

  Map<String, dynamic> toMap() {
    return {
      'supports': supports,
    };
  }

  factory Navigation.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Navigation();

    return Navigation(
      supports: map['supports'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Navigation.fromJson(String source) =>
      Navigation.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Usb {
  bool? otg;
  bool? typeC;
  Usb({
    this.otg,
    this.typeC,
  });

  Map<String, dynamic> toMap() {
    return {
      'otg': otg,
      'typeC': typeC,
    };
  }

  factory Usb.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Usb();

    return Usb(
      otg: map['otg'] as bool,
      typeC: map['typeC'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usb.fromJson(String source) =>
      Usb.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Others {
  bool? nfc;
  bool? audioJac;
  bool? radioFm;
  bool? volte;
  Others({
    this.nfc,
    this.audioJac,
    this.radioFm,
    this.volte,
  });

  Map<String, dynamic> toMap() {
    return {
      'nfc': nfc,
      'audioJac': audioJac,
      'radioFm': radioFm,
      'volte': volte,
    };
  }

  factory Others.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Others();

    return Others(
      nfc: map['nfc'] as bool,
      audioJac: map['audioJac'] as bool,
      radioFm: map['radioFm'] as bool,
      volte: map['volte'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Others.fromJson(String source) =>
      Others.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Battery {
  String? capacity;
  String? type;
  String? fastCharge;
  Battery({
    this.capacity,
    this.type,
    this.fastCharge,
  });

  Map<String, dynamic> toMap() {
    return {
      'capacity': capacity,
      'type': type,
      'fastCharge': fastCharge,
    };
  }

  factory Battery.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Battery();

    return Battery(
      capacity: map['capacity'].toString(),
      type: map['type'].toString(),
      fastCharge: map['fastCharge'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Battery.fromJson(String source) =>
      Battery.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Software {
  String? opreationSystem;
  String? systemBrand;
  bool? googleServices;
  Software({
    this.opreationSystem,
    this.systemBrand,
    this.googleServices,
  });

  Map<String, dynamic> toMap() {
    return {
      'opreationSystem': opreationSystem,
      'systemBrand': systemBrand,
      'googleServices': googleServices,
    };
  }

  factory Software.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Software();

    return Software(
      opreationSystem: map['opreationSystem'].toString(),
      systemBrand: map['systemBrand'].toString(),
      googleServices: map['googleServices'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Software.fromJson(String source) =>
      Software.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Images {
  String? d3dModelLink;
  List<String>? images;
  Images({
    this.d3dModelLink,
    this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'd3dModelLink': d3dModelLink,
      'images': images?.map((x) => x).toList(),
    };
  }

  factory Images.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Images();

    return Images(
      d3dModelLink: map['d3dModelLink'].toString(),
      images: List<String>.from(
        map['images']?.map((x) => x) as List<String>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Images.fromJson(String source) =>
      Images.fromMap(json.decode(source) as Map<String, dynamic>);
}

class FeatureAndDiscard {
  List<String>? features;
  List<String>? disadvantages;
  FeatureAndDiscard({
    this.features,
    this.disadvantages,
  });

  Map<String, dynamic> toMap() {
    return {
      'features': features?.map((x) => x).toList(),
      'disadvantages': disadvantages?.map((x) => x).toList(),
    };
  }

  factory FeatureAndDiscard.fromMap(Map<String, dynamic>? map) {
    if (map == null) return FeatureAndDiscard();

    return FeatureAndDiscard(
      features:
          List<String>.from(map['features']?.map((x) => x) as List<String>),
      disadvantages: List<String>.from(
        map['disadvantages']?.map((x) => x) as List<String>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeatureAndDiscard.fromJson(String source) =>
      FeatureAndDiscard.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Gaming {
  String? fbsPubg;
  String? fbsCallOfDuty;
  String? resloutionPubg;
  String? resloutionCallOfDuty;
  String? versionPubg;
  String? versionCallOfDuty;
  Gaming({
    this.fbsPubg,
    this.fbsCallOfDuty,
    this.resloutionPubg,
    this.resloutionCallOfDuty,
    this.versionPubg,
    this.versionCallOfDuty,
  });

  Map<String, dynamic> toMap() {
    return {
      'fbsPubg': fbsPubg,
      'fbsCallOfDuty': fbsCallOfDuty,
      'resloutionPubg': resloutionPubg,
      'resloutionCallOfDuty': resloutionCallOfDuty,
      'versionPubg': versionPubg,
      'versionCallOfDuty': versionCallOfDuty,
    };
  }

  factory Gaming.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Gaming();

    return Gaming(
      fbsPubg: map['fbsPubg'].toString(),
      fbsCallOfDuty: map['fbsCallOfDuty'].toString(),
      resloutionPubg: map['resloutionPubg'].toString(),
      resloutionCallOfDuty: map['resloutionCallOfDuty'].toString(),
      versionPubg: map['versionPubg'].toString(),
      versionCallOfDuty: map['versionCallOfDuty'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Gaming.fromJson(String source) =>
      Gaming.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Price {
  String? internationalPrice;
  String? egyptPrice;
  String? indiaPrice;
  String? usaPrice;
  String? iraqPrice;
  Price({
    this.internationalPrice,
    this.egyptPrice,
    this.indiaPrice,
    this.usaPrice,
    this.iraqPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'internationalPrice': internationalPrice,
      'egyptPrice': egyptPrice,
      'indiaPrice': indiaPrice,
      'usaPrice': usaPrice,
      'iraqPrice': iraqPrice,
    };
  }

  factory Price.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Price();

    return Price(
      internationalPrice: map['internationalPrice'].toString(),
      egyptPrice: map['egyptPrice'].toString(),
      indiaPrice: map['indiaPrice'].toString(),
      usaPrice: map['usaPrice'].toString(),
      iraqPrice: map['iraqPrice'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Price.fromJson(String source) =>
      Price.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SupportedCountry {
  List<String>? supportedCountry;
  SupportedCountry({
    this.supportedCountry,
  });

  Map<String, dynamic> toMap() {
    return {
      'supportedCountry': supportedCountry?.map((x) => x).toList(),
    };
  }

  factory SupportedCountry.fromMap(Map<String, dynamic>? map) {
    if (map == null) return SupportedCountry();

    return SupportedCountry(
      supportedCountry: List<String>.from(
        map['supportedCountry']?.map((x) => x.toString()) as List<String>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SupportedCountry.fromJson(String source) =>
      SupportedCountry.fromMap(json.decode(source) as Map<String, dynamic>);
}
