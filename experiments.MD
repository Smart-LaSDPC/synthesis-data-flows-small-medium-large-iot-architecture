# Prototype Load Testing Experiments

This repository contains experiments conducted to evaluate the performance of a prototype under different workload scenarios. Two main experiments were performed, each with distinct request patterns.

## 1. Description of the First Experiment

The objective of this experiment is to measure the behavior of the prototype under sequential HTTP requests over time. Five different scenarios were defined, as described in the table below:

| Scenario | Number of Requests | Mapping |
|----------|-------------------|----------|
| 1        | 100               | 10 requests per VM |
| 2        | 1,000             | 100 requests per VM |
| 3        | 10,000            | 1,000 requests per VM |
| 4        | 50,000            | 5,000 requests per VM |
| 5        | 100,000           | 10,000 requests per VM |

Requests are performed at a rate of 4 requests per second per VM. The total test execution time \( T(s) \) is defined by the following equation:

$$ T(s) = \frac{R}{4 \times V} $$




where:
- \( R \) is the total number of requests
- \( V \) is the number of virtual machines

### Collected Metrics
The results of this experiment include:
- Average request time
- Median request time
- Minimum request time
- Maximum request time
- Percentage of ESP32 publications to MQTT that were successfully read

## 2. Description of the Second Experiment

The second experiment evaluates how the prototype responds to a workload generated by an exponential distribution. In this case, we use the function \( 2^x \), where \( x \) starts at 0 and increments every 20 seconds. The table below presents the test scenarios:

| Scenario | Requests per VM | Total Requests |
|----------|---------------|---------------|
| 1        | 3             | \( \sum_{x=0}^{3} 2^x \) = 150 |
| 2        | 5             | \( \sum_{x=0}^{5} 2^x \) = 630 |
| 3        | 7             | \( \sum_{x=0}^{7} 2^x \) = 2,550 |
| 4        | 9             | \( \sum_{x=0}^{9} 2^x \) = 10,230 |
| 5        | 11            | \( \sum_{x=0}^{11} 2^x \) = 40,950 |

The total number of requests is calculated by multiplying the number of requests per VM by the number of virtual machines in the server (in this experiment, 10 VMs were used).

### Expected Behavior
In this experiment, the request rate per second increases exponentially in each cycle. The goal is to assess the architectural model's ability to handle sudden increases in request rates.
