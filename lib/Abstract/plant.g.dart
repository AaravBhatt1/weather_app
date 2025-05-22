// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlantEntryAdapter extends TypeAdapter<PlantEntry> {
  @override
  final int typeId = 0;

  @override
  PlantEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlantEntry(
      name: fields[0] as String,
      type: fields[2] as String,
      description: fields[1] as String,
      activities: (fields[3] as Map).map((dynamic k, dynamic v) =>
          MapEntry(k as String, (v as List).cast<bool>())),
    );
  }

  @override
  void write(BinaryWriter writer, PlantEntry obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.activities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlantEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantEntryImpl _$$PlantEntryImplFromJson(Map<String, dynamic> json) =>
    _$PlantEntryImpl(
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      activities: (json['activities'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as bool).toList()),
      ),
    );

Map<String, dynamic> _$$PlantEntryImplToJson(_$PlantEntryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'activities': instance.activities,
    };
