output "kafka_mirror_topics_id" {
  description = "Map of id values across all kafka_mirror_topics, keyed the same as var.kafka_mirror_topics except keys with no id are omitted"
  value       = { for k, v in confluent_kafka_mirror_topic.kafka_mirror_topics : k => v.id if v.id != null && length(v.id) > 0 }
}
output "kafka_mirror_topics_cluster_link" {
  description = "Map of cluster_link values across all kafka_mirror_topics, keyed the same as var.kafka_mirror_topics except keys with no cluster_link are omitted"
  value       = { for k, v in confluent_kafka_mirror_topic.kafka_mirror_topics : k => one(v.cluster_link) if v.cluster_link != null && length(v.cluster_link) > 0 }
}
output "kafka_mirror_topics_kafka_cluster" {
  description = "Map of kafka_cluster values across all kafka_mirror_topics, keyed the same as var.kafka_mirror_topics except keys with no kafka_cluster are omitted"
  value       = { for k, v in confluent_kafka_mirror_topic.kafka_mirror_topics : k => one(v.kafka_cluster) if v.kafka_cluster != null && length(v.kafka_cluster) > 0 }
  sensitive   = true
}
output "kafka_mirror_topics_mirror_topic_name" {
  description = "Map of mirror_topic_name values across all kafka_mirror_topics, keyed the same as var.kafka_mirror_topics except keys with no mirror_topic_name are omitted"
  value       = { for k, v in confluent_kafka_mirror_topic.kafka_mirror_topics : k => v.mirror_topic_name if v.mirror_topic_name != null && length(v.mirror_topic_name) > 0 }
}
output "kafka_mirror_topics_source_kafka_topic" {
  description = "Map of source_kafka_topic values across all kafka_mirror_topics, keyed the same as var.kafka_mirror_topics except keys with no source_kafka_topic are omitted"
  value       = { for k, v in confluent_kafka_mirror_topic.kafka_mirror_topics : k => one(v.source_kafka_topic) if v.source_kafka_topic != null && length(v.source_kafka_topic) > 0 }
}
output "kafka_mirror_topics_status" {
  description = "Map of status values across all kafka_mirror_topics, keyed the same as var.kafka_mirror_topics except keys with no status are omitted"
  value       = { for k, v in confluent_kafka_mirror_topic.kafka_mirror_topics : k => v.status if v.status != null && length(v.status) > 0 }
}

