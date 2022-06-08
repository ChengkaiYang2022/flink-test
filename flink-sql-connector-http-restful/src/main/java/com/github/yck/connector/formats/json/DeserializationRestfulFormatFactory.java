package com.github.yck.connector.formats.json;

import org.apache.flink.annotation.PublicEvolving;
import org.apache.flink.table.factories.DecodingFormatFactory;
@PublicEvolving
public interface DeserializationRestfulFormatFactory extends DecodingFormatFactory<DeserializationRestfulSchema> {
}
