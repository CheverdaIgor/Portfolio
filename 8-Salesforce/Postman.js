const axios = require('axios');

// Salesforce API Endpoint URL
const apiUrl = 'https://cheverda2-dev-ed.develop.my.salesforce.com/services/data/v58.0/sobjects/Account/';

// Your Salesforce authentication credentials
const username = 'cheverdai@gmail.com';
const password = 'Salesforce1234567*';
const securityToken = 'V5YdI5i7axCMBuEIgx5Su4qX';

// Data for the new record
const newRecordData = {
    'Name': 'JavaScript_2',
};

// Data for modifying the record
const modifyRecordData = {
    'Name': 'JavaScript_222',
};

// Function call to create a new record and modify it
Record();

// Function to create a new record in Salesforce and then modify it
async function Record() {
    try {
        // Get the access token required for authentication
        const accessToken = await getAccessToken();

        // Send a POST request to create a new record
        const postResponse = await axios.post(apiUrl, newRecordData, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${accessToken}`
            }
        });
        console.log('Record successfully created:', postResponse.data);
        
        // Get the ID of the created record
        const recordId = postResponse.data.id;

        // Send a GET request to retrieve the created record
        const getResponse = await axios.get(`${apiUrl}${recordId}`, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${accessToken}`
            }
        });
        console.log('POST->Created Record Name:', getResponse.data.Name, getResponse.headers['last-modified']);

        // Introduce a 3-second delay
        await new Promise(resolve => setTimeout(resolve, 3000));

        // Send a PATCH request to modify the created record
        const patchResponse = await axios.patch(`${apiUrl}${recordId}`, modifyRecordData, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${accessToken}`
            }
        });
        // Send a GET request to retrieve the modified record
        const getResponse2 = await axios.get(`${apiUrl}${recordId}`, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${accessToken}`
            }
        });
        console.log('PATCH->Modified Record Name:', getResponse2.data.Name, getResponse2.headers['last-modified']);

        // Send a HEAD request to check the Last-Modified header
        const headResponse = await axios.head(`${apiUrl}${recordId}`, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${accessToken}`
            }
        });
        console.log('HEAD->Last-Modified Record Name:', headResponse.headers['last-modified']);

        // Send a DELETE request to remove the record
        const deleteResponse = await axios.delete(`${apiUrl}${recordId}`, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${accessToken}`
            }
        });
        console.log('DELETE->Delete was successful');

    } catch (error) {
        // Handle errors that might occur during the record creation/modification process
        console.error('Error record:', error);
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