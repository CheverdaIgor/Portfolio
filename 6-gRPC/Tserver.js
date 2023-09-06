const grpc = require('@grpc/grpc-js');
const protoLoader = require('@grpc/proto-loader');
const fs = require('fs');
const path = require('path');

// Load the protocol definition from the specified file.
const packageDefinition = protoLoader.loadSync(path.join(__dirname, 'file.proto'));
const testProto = grpc.loadPackageDefinition(packageDefinition).Igor;

// Create a new gRPC server instance.
const server = new grpc.Server();

// Add gRPC service methods to the server.
server.addService(testProto.Service.service, {
  // Define a gRPC method called 'ReplyList'.
  ReplyList: (call, callback) => {
    try {
      // Read data from a JSON file.
      const inputDataPath = path.join(__dirname, 'data.json');
      const data = fs.readFileSync(inputDataPath);
      const jsonData = JSON.parse(data);

      // Prepare a response object.
      const response = {
        responses: jsonData.responses
      };

      // Send the response back to the client.
      callback(null, response);
    } catch (error) {
      // Handle errors and return an internal server error if needed.
      callback({
        code: grpc.status.INTERNAL,
        details: 'Error reading or parsing data.json'
      });
    }
  },
  // Define a gRPC method called 'ReplyByID'.
  ReplyByID: (call, callback) => {
    try {
      // Read data from a JSON file.
      const inputDataPath = path.join(__dirname, 'data.json'); 
      const data = fs.readFileSync(inputDataPath);
      const jsonData = JSON.parse(data);
      
      // Get the 'id' from the client request.
      const id = call.request.id;

      // Find data in the JSON file based on the 'id'.
      const foundData = jsonData.responses.find(item => item.id === id);

      if (foundData) {
        // Send the found data back to the client.
        callback(null, foundData);
      } else {
        // Return a 'NOT_FOUND' error if the data is not found.
        callback({
          code: grpc.status.NOT_FOUND,
          details: `Data with id ${id} not found`
        });
      }
    } catch (error) {
      // Handle errors and return an internal server error if needed.
      callback({
        code: grpc.status.INTERNAL,
        details: 'Error reading or parsing data.json'
      });
    }
  },
  // Define a gRPC method called 'LotsOfRepliesByID'.
  LotsOfRepliesByID: (call) => {
    try {
      // Read data from a JSON file.
      const inputDataPath = path.join(__dirname, 'data.json');
      const data = fs.readFileSync(inputDataPath);
      const jsonData = JSON.parse(data);
  
      // Get the 'id' from the client request.
      const id = call.request.id;
  
      // Find all records with the specified 'id'.
      const matchingData = jsonData.responses.filter(item => item.id === id);
  
      // Stream each record one by one to the client.
      matchingData.forEach(item => {
        call.write(item);
      });
  
      // Finish the stream.
      call.end();
    } catch (error) {
      // Emit an error event if there's an issue and return an internal server error.
      call.emit('error', {
        code: grpc.status.INTERNAL,
        details: 'Error reading or parsing data.json'
      });
    }
  },      
});

// Bind the server to a specified IP and port with insecure credentials.
server.bindAsync('127.0.0.1:50051', grpc.ServerCredentials.createInsecure(), (err, port) => {
  if (err) {
    console.error('Error binding:', err);
    return;
  }
  // Start the gRPC server and log the port it's running on.
  server.start();
  console.log(`Server is running on http://127.0.0.1:${port}`);
});