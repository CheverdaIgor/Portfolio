const { Kafka } = require("kafkajs");

// Create a Kafka object with Kafka brokers configuration
const kafka = new Kafka({
  clientId: "my-app",
  brokers: ["localhost:9092"],
});

// Function for consuming messages from the Kafka broker (consumer)
async function consumeFromKafka(topics) {
  const consumer = kafka.consumer({ groupId: "my-group" });

  // Connect to the Kafka broker
  await consumer.connect();
  
  // Subscribe to all the specified topics
  await Promise.all(topics.map(topic => consumer.subscribe({ topic, fromBeginning: true })));

  // Start consuming messages from the subscribed topics
  await consumer.run({
    eachMessage: async ({ topic, partition, message }) => {
      console.log({
        topic,
        partition,
        offset: message.offset,
        value: message.value.toString(),
      });
    },
  });
}

// Example of consuming messages from the Kafka broker for "test" and "my-topic" topics
consumeFromKafka(["test", "my-topic"]);