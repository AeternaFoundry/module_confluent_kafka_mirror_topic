resource "confluent_kafka_mirror_topic" "kafka_mirror_topics" {
  for_each = var.kafka_mirror_topics

  mirror_topic_name = each.value.mirror_topic_name
  status            = each.value.status

  cluster_link {
    link_name = each.value.cluster_link.link_name
  }

  kafka_cluster {
    dynamic "credentials" {
      for_each = each.value.kafka_cluster.credentials != null ? [each.value.kafka_cluster.credentials] : []
      content {
        key    = credentials.value.key
        secret = credentials.value.secret
      }
    }
    id            = each.value.kafka_cluster.id
    rest_endpoint = each.value.kafka_cluster.rest_endpoint
  }

  source_kafka_topic {
    topic_name = each.value.source_kafka_topic.topic_name
  }
}

