package com.github.yck.connector.httprestful;

import org.apache.flink.api.common.serialization.DeserializationSchema;
import org.apache.flink.table.data.RowData;
import org.apache.flink.types.RowKind;

import java.io.IOException;

public interface DeserializationRestfulSchema extends DeserializationSchema<RowData> {
    public default RowData deserializeWith(byte[] message, RowKind rowKind) throws IOException {
        RowData rowData = this.deserialize(message);
        rowData.setRowKind(rowKind);
        return rowData;
    }
}
