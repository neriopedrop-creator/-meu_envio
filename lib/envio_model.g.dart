// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'envio_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnvioAdapter extends TypeAdapter<Envio> {
  @override
  final int typeId = 0;

  @override
  Envio read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Envio(
      valor: fields[0] as double,
      destinatario: fields[1] as String,
      metodoEnvio: fields[2] as String,
      taxaPaga: fields[3] as double,
      data: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Envio obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.valor)
      ..writeByte(1)
      ..write(obj.destinatario)
      ..writeByte(2)
      ..write(obj.metodoEnvio)
      ..writeByte(3)
      ..write(obj.taxaPaga)
      ..writeByte(4)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnvioAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
