variable "kafka_mirror_topics" {
  description = <<EOT
Map of kafka_mirror_topics, attributes below
Required:
    - cluster_link (block):
        - link_name (required)
    - kafka_cluster (block):
        - credentials (optional, block):
            - key (required)
            - secret (required)
        - id (required)
        - rest_endpoint (optional)
    - source_kafka_topic (block):
        - topic_name (required)
Optional:
    - mirror_topic_name
    - status
EOT

  type = map(object({
    mirror_topic_name = optional(string)
    status            = optional(string)
    cluster_link = object({
      link_name = string
    })
    kafka_cluster = object({
      credentials = optional(object({
        key    = string
        secret = string
      }))
      id            = string
      rest_endpoint = optional(string)
    })
    source_kafka_topic = object({
      topic_name = string
    })
  }))
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

