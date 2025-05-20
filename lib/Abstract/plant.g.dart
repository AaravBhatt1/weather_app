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
      img: fields[1] as String,
      family: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlantEntry obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.img)
      ..writeByte(2)
      ..write(obj.family);
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
      img: json['img'] as String,
      family: json['family'] as String,
    );

Map<String, dynamic> _$$PlantEntryImplToJson(_$PlantEntryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'img': instance.img,
      'family': instance.family,
    };
