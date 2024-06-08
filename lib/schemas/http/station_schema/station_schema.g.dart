// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StationSchema _$StationSchemaFromJson(Map<String, dynamic> json) =>
    StationSchema(
      sId: json['_id'] as String?,
      companyId: json['company_id'] as String?,
      id: json['id'] as String?,
      title: json['title'] as String?,
      address: json['address'] as String?,
      addressRecipe: json['adress_recipe'] as String?,
      photo: json['photo'] as String?,
      typeOfUse: json['type_of_use'] as String?,
      model: json['model'] as String?,
      locationType: json['location_type'] as String?,
      powerType: json['power_type'] as String?,
      phoneNumber: json['phone_number'] as String?,
      status: json['status'] as String?,
      coordinate: json['coordinate'] == null
          ? null
          : CoordinateSchema.fromJson(
              json['coordinate'] as Map<String, dynamic>),
      facility: json['facility'] == null
          ? null
          : FacilitySchema.fromJson(json['facility'] as Map<String, dynamic>),
      workingHours: json['working_hours'] == null
          ? null
          : WorkingHoursSchema.fromJson(
              json['working_hours'] as Map<String, dynamic>),
      service: json['service'] == null
          ? null
          : ServiceSchema.fromJson(json['service'] as Map<String, dynamic>),
      sockets: (json['sockets'] as List<dynamic>?)
          ?.map((e) => SocketsSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
      whPrice: json['wh_price'] as num?,
      parkingFee: json['parking_fee'] as num?,
      reservationFee: (json['reservation_fee'] as num?)?.toDouble(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$StationSchemaToJson(StationSchema instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'company_id': instance.companyId,
      'id': instance.id,
      'title': instance.title,
      'address': instance.address,
      'adress_recipe': instance.addressRecipe,
      'photo': instance.photo,
      'type_of_use': instance.typeOfUse,
      'model': instance.model,
      'location_type': instance.locationType,
      'power_type': instance.powerType,
      'phone_number': instance.phoneNumber,
      'status': instance.status,
      'coordinate': instance.coordinate,
      'facility': instance.facility,
      'working_hours': instance.workingHours,
      'service': instance.service,
      'sockets': instance.sockets,
      'wh_price': instance.whPrice,
      'parking_fee': instance.parkingFee,
      'reservation_fee': instance.reservationFee,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

FacilitySchema _$FacilitySchemaFromJson(Map<String, dynamic> json) =>
    FacilitySchema(
      wifi: json['wifi'] as bool?,
      phone: json['phone'] as bool?,
      cafe: json['cafe'] as bool?,
      avm: json['avm'] as bool?,
    );

Map<String, dynamic> _$FacilitySchemaToJson(FacilitySchema instance) =>
    <String, dynamic>{
      'wifi': instance.wifi,
      'phone': instance.phone,
      'cafe': instance.cafe,
      'avm': instance.avm,
    };

WorkingHoursSchema _$WorkingHoursSchemaFromJson(Map<String, dynamic> json) =>
    WorkingHoursSchema(
      mondayStart: json['monday_start'] as String?,
      mondayEnd: json['monday_end'] as String?,
      tuesdayStart: json['tuesday_start'] as String?,
      tuesdayEnd: json['tuesday_end'] as String?,
      wednesdayStart: json['wednesday_start'] as String?,
      wednesdayEnd: json['wednesday_end'] as String?,
      thursdayStart: json['thursday_start'] as String?,
      thursdayEnd: json['thursday_end'] as String?,
      fridayStart: json['friday_start'] as String?,
      fridayEnd: json['friday_end'] as String?,
      saturdayStart: json['saturday_start'] as String?,
      saturdayEnd: json['saturday_end'] as String?,
      sundayStart: json['sunday_start'] as String?,
      sundayEnd: json['sunday_end'] as String?,
    );

Map<String, dynamic> _$WorkingHoursSchemaToJson(WorkingHoursSchema instance) =>
    <String, dynamic>{
      'monday_start': instance.mondayStart,
      'monday_end': instance.mondayEnd,
      'tuesday_start': instance.tuesdayStart,
      'tuesday_end': instance.tuesdayEnd,
      'wednesday_start': instance.wednesdayStart,
      'wednesday_end': instance.wednesdayEnd,
      'thursday_start': instance.thursdayStart,
      'thursday_end': instance.thursdayEnd,
      'friday_start': instance.fridayStart,
      'friday_end': instance.fridayEnd,
      'saturday_start': instance.saturdayStart,
      'saturday_end': instance.saturdayEnd,
      'sunday_start': instance.sundayStart,
      'sunday_end': instance.sundayEnd,
    };

ServiceSchema _$ServiceSchemaFromJson(Map<String, dynamic> json) =>
    ServiceSchema(
      chargeService: json['chargeService'] as String?,
      reservation: json['reservation'] as bool?,
      parkArea: json['park_area'] as num?,
      freePark: json['free_park'] as bool?,
    );

Map<String, dynamic> _$ServiceSchemaToJson(ServiceSchema instance) =>
    <String, dynamic>{
      'chargeService': instance.chargeService,
      'reservation': instance.reservation,
      'park_area': instance.parkArea,
      'free_park': instance.freePark,
    };

SocketsSchema _$SocketsSchemaFromJson(Map<String, dynamic> json) =>
    SocketsSchema(
      id: json['id'] as num?,
      socketType: json['socket_type'] as String?,
      kva: json['kva'] as num?,
      amp: json['amp'] as num?,
      status: json['status'] as String?,
    )..socketQr = json['socket_qr'] as String?;

Map<String, dynamic> _$SocketsSchemaToJson(SocketsSchema instance) =>
    <String, dynamic>{
      'id': instance.id,
      'socket_type': instance.socketType,
      'kva': instance.kva,
      'amp': instance.amp,
      'status': instance.status,
      'socket_qr': instance.socketQr,
    };
