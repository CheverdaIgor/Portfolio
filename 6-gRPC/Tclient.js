const grpc = require('@grpc/grpc-js');
const protoLoader = require('@grpc/proto-loader');
const path = require('path');

// Load the protofile and create classes
const packageDefinition = protoLoader.loadSync(path.join(__dirname, 'file.proto'), {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
});
const testProto = grpc.loadPackageDefinition(packageDefinition).Igor;

describe('gRPC API Tests', () => {
  it('should send and receive gRPC requests', (done) => {
    // Create a gRPC client instance with an insecure connection to the server.
    const client = new testProto.Service(
      '127.0.0.1:50051',
      grpc.credentials.createInsecure()
    );

    // Send a gRPC request 'ReplyList' and handle the response.
    const request = {};
    client.ReplyList(request, (error, response) => {
      if (error) {
        console.error('Error:', error);
      } else {
        console.log("ReplyList: ", JSON.stringify(response)); // Output in JSON format
        // Uncomment the line below to add an assertion for response validation.
        //expect(response.reply).to.equal('Igor1 Igor2');
      }
    });

    // Send a gRPC request 'ReplyByID' with an ID and handle the response.
    const request2 = { id: '1' };
    client.ReplyByID(request2, (error, response) => {
      if (error) {
        console.error('Error:', error);
      } else {
        console.log("ReplyByID: ", JSON.stringify(response)); // Output in JSON format
        // Uncomment the line below to add an assertion for response validation.
        //expect(response.reply).to.equal('Igor1 Igor2');
      }
    });

    // Send a gRPC request 'LotsOfRepliesByID' with an ID and handle the streaming response.
    const request3 = { id: '1' };
    const stream = client.LotsOfRepliesByID(request3);
    stream.on('data', (response) => {
      console.log("LotsOfRepliesByID: ", JSON.stringify(response)); // Output in JSON format
    });
    stream.on('error', (error) => {
      console.error('Error:', error);
    });

    // Signal the end of the test case.
    done();
  });
});