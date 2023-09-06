const fs = require('fs');
const path = require('path');
const generateSchema = require('generate-schema');
const Ajv = require('ajv');

class ValidateDataSchema {
  
  // Method to validate data against a JSON schema from files
  async validateFileDataSchema(fileDataName, fileSchemaName) {
    try {
      const fileData = `${fileDataName}.json`
      const fileSchema = `${fileSchemaName}.json`
      const dataFilename = path.join(__dirname, fileData);
      const data = fs.readFileSync(dataFilename, 'utf8');
      const parsedData = JSON.parse(data);
      const schemaFilename = path.join(__dirname, fileSchema);
      const schemaContent = fs.readFileSync(schemaFilename, 'utf8');
      const schema = JSON.parse(schemaContent);
      await this.validateDataSchema(parsedData, schema, fileDataName, fileSchemaName);
    } catch (err) {
      console.error('Error reading data or performing validation:', err);
    }
  }
  
  // Method to validate data against a JSON schema
  async validateDataSchema(parsedData, schema, fileDataName, fileSchemaName) {
    const logFile = `${fileDataName}VS${fileSchemaName}_errors.json`
    const ajv = new Ajv();
    const validate = ajv.compile(schema);
    const valid = validate(parsedData);
    if (valid === true) {
      console.log(`Data file "${fileDataName}.json" matches the JSON schema file "${fileSchemaName}.json"`);
    } else {
      console.error(`Data file "${fileDataName}.json" does not match the JSON schema file "${fileSchemaName}.json"`);
      console.error('Validation errors:', validate.errors);
      const logApi = path.join(__dirname, logFile);
      fs.writeFile(logApi, JSON.stringify(validate.errors, null, 2), (err) => {
        if (err) {
            console.error('Error writing logs to file:', err);
          } else {
            console.log(`File "${logFile}" has been created.`);
          }
      });
    }
  }
  
  // Method to generate a JSON schema from file data and validate it
  async jsonSchemaFromFile(fileDataName, saveSchemaName) {
    const fileData = `${fileDataName}.json`
    const saveSchema = `${saveSchemaName}.json`
    const dataFilename = path.join(__dirname, fileData);
    const data = fs.readFileSync(dataFilename, 'utf8');
    const parsedData = JSON.parse(data);
    const schema = generateSchema.json('Schema', parsedData);
    schema.$schema = 'http://json-schema.org/draft-07/schema#';
    const schemaFilename = path.join(__dirname, saveSchema);
    fs.writeFileSync(schemaFilename, JSON.stringify(schema, null, 2));
    console.log(`The schema has been successfully generated and saved to the file "${saveSchema}"`);
    await this.validateDataSchema(parsedData, schema, fileDataName, saveSchemaName);
  }
}

module.exports = new ValidateDataSchema();