const { Kafka } = require('kafkajs');

// Create a Kafka client with broker configuration
const kafka = new Kafka({
  clientId: 'my-producer',
  brokers: ['localhost:9092'],
});

// Function to send a message to a specified topic and partition
async function sendMessage(topic, message) {
  const producer = kafka.producer();
  await producer.connect();
  await producer.send({
    topic,
    messages: [message],
    partition: parseInt(message.partition),
  });
  await producer.disconnect();
}

(async () => {
  // Define an array of messages to be sent to different topics and partitions
  const messages = [
    { topic: 'test', partition: 0, acks: 0, value: 'Sending with acks: 0, partition: 0' },
    { topic: 'my-topic', partition: 0, acks: 0, value: 'Sending with acks: 0, partition: 0' },
    { topic: 'my-topic', partition: 1, acks: 1, value: 'Sending with acks: 1, partition: 1' },
    { topic: 'my-topic', partition: 0, acks: 'all', value: 'Sending with acks: all, partition: 0' },
  ];

  // Iterate through the messages and send them to the specified topics and partitions
  for (const message of messages) {
    console.log(`Sending to topic: ${message.topic}, partition: ${message.partition}, acks: ${message.acks}`);
    await sendMessage(message.topic, message);
  }
})();