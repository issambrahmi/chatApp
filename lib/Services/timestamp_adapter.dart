import 'package:hive/hive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimestampAdapter extends TypeAdapter<Timestamp> {
  @override
  final typeId = 1; // Assign a unique typeId for this adapter

  @override
  Timestamp read(BinaryReader reader) {
    // Read seconds and nanoseconds from the binary reader
    final seconds = reader.readInt();
    final nanoseconds = reader.readInt();
    return Timestamp(seconds, nanoseconds);
  }

  @override
  void write(BinaryWriter writer, Timestamp obj) {
    // Write seconds and nanoseconds to the binary writer
    writer.writeInt(obj.seconds);
    writer.writeInt(obj.nanoseconds);
  }
}
