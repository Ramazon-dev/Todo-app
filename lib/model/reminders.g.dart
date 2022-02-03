// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminders.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RemindersAdapter extends TypeAdapter<Reminders> {
  @override
  final int typeId = 1;

  @override
  Reminders read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Reminders(
      name: fields[0] as String,
      day: fields[1] as String,
      dateTime: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Reminders obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.day)
      ..writeByte(2)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RemindersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
