# Two Ways to Catch a Change

*Two ways to watch the database. Each has a cost.*

[Pipeline Architecture · Medium · on DataDriven](https://datadriven.io/problems/two_ways_to_catch_a_change)

## How it went

| | |
|---|---|
| Solved | 2026-11-19 |
| Accepted | on the first submission |
| Hints | none |
| Concepts | Batch vs Streaming, Change Data Capture, Data Quality & Validation, Dead Letter Queues, Deduplication Strategies, Event-Driven Architecture, Event Streaming Platforms, Full vs Incremental Load, Idempotency, Kappa Architecture, Pipeline Monitoring, Retry & Failure Handling, Schema Evolution, Stream Processing |

## The design

```mermaid
flowchart LR
    n1[("<b>Source</b><br/>db2")]
    n2[("<b>Source</b><br/>db2")]
    n3["<b>Transform</b><br/>Debezium connector for CDC"]
    n4["<b>Transform</b><br/>Debezium connector for CDC_copy"]
    n5[/"<b>Queue</b><br/>Kafka"/]
    n6{{"<b>Quality</b><br/>Schema registry + contract checks"}}
    n7["<b>Transform</b><br/>Bronze Lyer"]
    n8("<b>Consumer</b><br/>Fraud Consumer")
    n9["<b>Transform</b><br/>Merge statement to store history"]
    n10[("<b>Storage</b><br/>Silver layer")]
    n11{{"<b>Quality</b><br/>Rconciliation (Data Qulity Check)"}}
    n12("<b>Consumer</b><br/>Analytics team")
    n1 --> n3
    n2 --> n4
    n3 --> n5
    n4 --> n5
    n5 --> n6
    n5 --> n7
    n7 --> n8
    n7 --> n9
    n9 --> n10
    n10 --> n11
    n10 --> n12
    classDef source fill:#1B3D2E,stroke:#34D399,color:#34D399
    classDef transform fill:#1E3A5F,stroke:#5B8DEF,color:#5B8DEF
    classDef storage fill:#2A2348,stroke:#A78BFA,color:#A78BFA
    classDef quality_gate fill:#3A3020,stroke:#FBBF24,color:#FBBF24
    classDef consumer fill:#1E3A5F,stroke:#94A3B8,color:#94A3B8
    classDef queue fill:#1A3A40,stroke:#22D3EE,color:#22D3EE
    class n1,n2 source
    class n3,n4,n7,n9 transform
    class n10 storage
    class n6,n11 quality_gate
    class n8,n12 consumer
    class n5 queue
    linkStyle 0 stroke:#3B82F6
    linkStyle 1 stroke:#3B82F6
    linkStyle 2 stroke:#3B82F6
    linkStyle 3 stroke:#3B82F6
    linkStyle 4 stroke:#3B82F6
    linkStyle 5 stroke:#3B82F6
    linkStyle 6 stroke:#3B82F6
    linkStyle 7 stroke:#3B82F6
    linkStyle 8 stroke:#3B82F6
    linkStyle 9 stroke:#3B82F6
    linkStyle 10 stroke:#3B82F6
```

The whole design, with every component's settings, the connections, the zones and where each sits on the canvas, is in [`architecture.json`](./architecture.json).
