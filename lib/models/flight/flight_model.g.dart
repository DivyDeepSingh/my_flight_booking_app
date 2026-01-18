// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlightModelAdapter extends TypeAdapter<FlightModel> {
  @override
  final int typeId = 1;

  @override
  FlightModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FlightModel(
      id: fields[0] as String,
      from: fields[1] as String,
      to: fields[2] as String,
      date: fields[3] as String,
      airline: fields[4] as String,
      price: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, FlightModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.from)
      ..writeByte(2)
      ..write(obj.to)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.airline)
      ..writeByte(5)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlightModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
