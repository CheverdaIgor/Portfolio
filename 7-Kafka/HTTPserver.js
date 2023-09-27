const express = require('express');
const { Kafka } = require('kafkajs');

const app = express();
const port = 3000;

// Create a Kafka client with brokers
const kafka = new Kafka({
  clientId: 'my-producer',
  brokers: ['localhost:9092'],
});

// Parse JSON request body
app.use(express.json());

// Handle POST request for sending messages to Kafka
app.post('/sendToKafka', async (req, res) => {
  try {
    const { messages } = req.body;

    if (!Array.isArray(messages)) {
      return res.status(400).send('Invalid request body format');
    }

    // Create a Kafka producer
    const producer = kafka.producer();
    await producer.connect();

    // Send each message to Kafka
    for (const message of messages) {
      const { topic, partition, acks, value } = message;

      await producer.send({
        topic,
        messages: [{ key: partition.toString(), value }],
        partition: parseInt(partition),
      });
    }

    // Disconnect from the Kafka producer
    await producer.disconnect();

    res.status(200).send('Messages sent to Kafka');
  } catch (error) {
    console.error(error);
    res.status(500).send('Error sending messages to Kafka');
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});