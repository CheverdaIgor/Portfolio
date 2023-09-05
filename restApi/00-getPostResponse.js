const fs = require('fs');
const path = require('path');
const axios = require('axios');

class API {
  
  // Method to get response from the API and save it to a JSON file
  async requestGetPost(addSaveName, apiUrl, dataFileName) {
    try {
      let fileName;
      let response;
      if (dataFileName === undefined) {
        fileName = 'getResponse'
        response = await axios.get(apiUrl);
      }
      else {
        fileName = 'postResponse'
        const dataFile = `${dataFileName}.json`
        const pathFile = path.join(__dirname, dataFile);
        const readData = fs.readFileSync(pathFile, 'utf8');
        const parseData = JSON.parse(readData);
        response = await axios.post(apiUrl, parseData);
      }
      if (!response.data || (Array.isArray(response.data) && response.data.length === 0)) {
        console.error('The received data is an empty array or object. Nothing has been written to the file.');
        return;
      }
      let responseFileName = `${fileName}${addSaveName}.json`;
      const responseFile = path.join(__dirname, responseFileName);
      fs.writeFileSync(responseFile, JSON.stringify(response.data, null, 2), 'utf8');
      console.log(`Data has been successfully written to the file "${responseFileName}"`);
    } catch (error) {
      console.error('Error:', error.message);
    }
  }
}

module.exports = new API ();