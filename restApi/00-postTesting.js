const fs = require('fs');
const path = require('path');
const axios = require('axios');
const Ajv = require('ajv');
const util = require('util');

class PostTesting {
  async validatation() {
    // Function to load data from a file
    function loadDataFromFile(filePath) {
      const fileData = fs.readFileSync(filePath, 'utf8');
      return JSON.parse(fileData);
    }

    // API URL
    const postApiUrl = 'https://petstore.swagger.io/v2/store/order';

    // Load schema and input data
    const schemaPath = path.join(__dirname, 'postDataSchema.json');
    const schema = loadDataFromFile(schemaPath);
    const inputDataPath = path.join(__dirname, 'inputData.json');
    const inputData = loadDataFromFile(inputDataPath);

    // Prepare test data
    const validData = inputData.valid;
    const invalidData = inputData.invalid;

    // Combine valid and invalid data into one array
    const allData = [...validData, ...invalidData];

    // Function to validate data against the schema
    function validateData(data, index, schema) {
      const ajv = new Ajv({ allErrors: true });
      const validate = ajv.compile(schema);
      const isValid = validate(data);
      if (!isValid) {
        const invalidParams = validate.errors.reduce((acc, error) => {
          const { instancePath, message } = error;
          const property = instancePath.split('/')[1];
          const errorMessage = `${message}`;
          if (!acc[errorMessage]) {
            acc[errorMessage] = [property];
          } else {
            acc[errorMessage].push(property);
          }
          acc[errorMessage].push(data[property]);
          return acc;
        }, {});
        const formattedInvalidParams = Object.entries(invalidParams).map(([message, properties]) => {
          const formattedMessage = `[${properties.filter(prop => data[prop] !== undefined).map(prop => `"${prop}":"${data[prop]}"`).join(', ')}] - ${message}`;
          return formattedMessage;
        });
        // Output validation errors to the console
        console.error(`Test ${index + 1}: Data ${formattedInvalidParams.join('; ')};`);
      }
      return isValid;
    }

    // Create a log file and setup log stream
    const logFileName = path.join(__dirname, 'log.json');
    const logStream = fs.createWriteStream(logFileName, { flags: 'w' });

    // Store original console.log and console.error functions
    const originalConsoleLog = console.log;
    const originalConsoleError = console.error;

    // Override console.log to log to the file using util.inspect
    console.log = function (...args) {
      const logLine = args.map(obj => util.inspect(obj)).join(' ');
      logStream.write(logLine + '\n');
      originalConsoleLog.apply(console, args);
    };

    // Override console.error to log to the file using util.inspect
    console.error = function (...args) {
      const logLine = args.map(obj => util.inspect(obj)).join(' ');
      logStream.write(logLine + '\n');
      originalConsoleError.apply(console, args);
    };

    // Start testing valid data
    console.log('TESTING VALID DATA:');
    for (const [index, data] of allData.entries()) {
      if (index === validData.length) {
        // Move to testing invalid data after testing valid data
        console.log('TESTING INVALID DATA:');
      }
      const isValid = validateData(data, index, schema);
      if (isValid) {
        try {
          const response = await axios.post(postApiUrl, data);
          // Log successful test result to the file and console
          console.log(`Test ${index + 1}: PASSED. "id":${response.data.id}`, response.data);
        } catch (error) {
          // Log successful test result to the file and console
          console.error(`Test ${index + 1}: PASSED:`, error.message, data);
        }
      } else {
        try {
          const response = await axios.post(postApiUrl, data);
          // Log failed test result with successful response to the file and console
          console.log(
            `FAILED. Successful response:`,
            response.data
          );
        } catch (error) {
          // Log successful test result with error to the console
          console.log(`PASSED:`, error.message);
        }
      }
    }

    // Close the log stream and restore original console.log and console.error functions
    logStream.end();
    console.log = originalConsoleLog;
    console.error = originalConsoleError;
  }
}

module.exports = new PostTesting();