const axios = require('axios');

// Salesforce API Endpoint URL
const apiUrl = 'https://cheverda2-dev-ed.develop.my.salesforce.com/services/data/v58.0/sobjects/Account/';

// Your Salesforce authentication credentials
const username = 'cheverdai@gmail.com';
const password = 'Salesforce1234567*';
const securityToken = 'V5YdI5i7axCMBuEIgx5Su4qX';

// Data for the new record
const newRecordData = {
    'Name': 'Created_JavaScript',
    // Add other fields and values for the record as needed
};

// Function call to create a new record
createRecord();

// Function to create a new record in Salesforce
async function createRecord() {
    try {
        // Get the access token required for authentication
        const accessToken = await getAccessToken();

        // Send a POST request to create a new record with the provided data
        const response = await axios.post(apiUrl, newRecordData, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${accessToken}`
            }
        });

        // Log success message and the created record data
        console.log('New record successfully created:', response.data);
    } catch (error) {
        // Handle errors that might occur during the record creation process
        console.error('Error creating record:', error);
    }
}

// Function to obtain the access token required for authentication
async function getAccessToken() {
    try {
        // Send a POST request to Salesforce to obtain the access token using provided credentials
        const response = await axios.post('https://login.salesforce.com/services/oauth2/token', null, {
            params: {
                grant_type: 'password',
                client_id: '3MVG98Gq2O8Po4ZnUwmhrtP_hIcTr1fabIfUobDMXtJVUmOsEfhYku72SO1tDMp0NGvnKNTmdwXBdGuMBVKWN',
                client_secret: '0B73CA6C0E77744989904109FC89B85BD1013DD1776913B92AA9419155069BF2',
                username: `${username}`,
                password: `${password}${securityToken}`
            }
        });

        // Return the access token obtained from the response
        return response.data.access_token;
    } catch (error) {
        // Handle errors that might occur during the access token retrieval process
        console.error('Error obtaining access token:', error);
        throw error; // Re-throw the error for further handling, if necessary, in the createRecord function
    }
}