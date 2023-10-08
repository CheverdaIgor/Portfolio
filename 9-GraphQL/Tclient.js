const fs = require('fs'); // File system module for reading files
const axios = require('axios'); // Axios for making HTTP requests
const path = require('path'); // Path module for working with file paths

// Path to the GraphQL query file
const queryFilePath = path.join(__dirname, 'query.txt');

// Read the content of the GraphQL query file synchronously
const graphqlQuery = fs.readFileSync(queryFilePath, 'utf-8');

// GraphQL API URL and request headers
const apiUrl = 'https://in-barnacle-23.hasura.app/v1/graphql';
const headers = {
    'Content-Type': 'application/json',
    'x-hasura-admin-secret': 'NWbgDk07OruGT2ehypEb3GMKem9YmC2hEQ0iqyEoua48Drupe7TnsT9L6GxERW0G'
};

// Function to send a GraphQL request
async function sendGraphQLRequest() {
    try {
        // Send a POST request to the GraphQL API with the query and headers
        const response = await axios.post(apiUrl, {
            query: graphqlQuery
        }, { headers });

        // Log the response from the server
        console.log('Server Response:', JSON.stringify(response.data, null, 2));
    } catch (error) {
        // Handle errors that might occur during the GraphQL request
        console.error('GraphQL Request Error:', error);
    }
}

// Call the function to send the GraphQL request
sendGraphQLRequest();