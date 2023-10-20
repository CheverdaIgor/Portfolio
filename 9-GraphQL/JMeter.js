const fs = require('fs');
const axios = require('axios');
const path = require('path');

const queryFilePath = path.join(__dirname, 'query.txt');
const graphqlQuery = fs.readFileSync(queryFilePath, 'utf-8');

const apiUrl = 'https://in-barnacle-23.hasura.app/v1/graphql';
const headers = {
    'Content-Type': 'application/json',
    'x-hasura-admin-secret': 'NWbgDk07OruGT2ehypEb3GMKem9YmC2hEQ0iqyEoua48Drupe7TnsT9L6GxERW0G'
};

async function sendGraphQLRequest() {
    try {
        const response = await axios.post(apiUrl, {
            query: graphqlQuery
        }, { headers });

        return response.data;
    } catch (error) {
        console.error('GraphQL Request Error:', error);
        throw error;
    }
}

async function runLoadTest(userCount, seconds, loopCount) {
    const startTime = Date.now();
    const interval = seconds * 1000;
    let totalRequests = 0;
    let successfulRequests = 0;
    let failedRequests = 0;
    let minResponseTime = Infinity;
    let maxResponseTime = 0;
    let totalResponseTime = 0;

    for (let i = 1; i <= loopCount; i++) {
        const promises = [];
        for (let j = 1; j <= userCount; j++) {
            const requestStartTime = Date.now();
            promises.push(sendGraphQLRequest().then(
                () => {
                    successfulRequests++;
                    const responseTime = Date.now() - requestStartTime;
                    minResponseTime = Math.min(minResponseTime, responseTime);
                    maxResponseTime = Math.max(maxResponseTime, responseTime);
                    totalResponseTime += responseTime;
                }).catch(
                () => {
                    failedRequests++;
                }
            ));
        }

        try {
            await Promise.all(promises);
            totalRequests += userCount;
            console.log(`Loop ${i}: All ${userCount} requests completed successfully.`);
        } catch (error) {
            console.error(`Loop ${i}: Some requests failed.`);
        }

        if (i < loopCount) {
            const elapsedTime = Date.now() - startTime;
            const remainingTime = interval - elapsedTime;
            if (remainingTime > 0) {
                console.log(`Waiting for ${remainingTime / 1000} seconds before next loop...`);
                await new Promise(resolve => setTimeout(resolve, remainingTime));
            }
        }
    }

    const totalTime = Date.now() - startTime;
    const averageResponseTime = totalResponseTime / totalRequests;
    const requestsPerSecond = totalRequests / (totalTime / 1000);
    const successRate = (successfulRequests / totalRequests) * 100;
    const errorRate = (failedRequests / totalRequests) * 100;

    console.log(`Load test completed in ${totalTime / 1000} seconds.`);
    console.log(`Total Requests: ${totalRequests}`);
    console.log(`Requests per Second: ${requestsPerSecond.toFixed(2)}`);
    console.log(`Success Rate: ${successRate.toFixed(2)}%`);
    console.log(`Error Rate: ${errorRate.toFixed(2)}%`);
    console.log(`Average Response Time: ${averageResponseTime.toFixed(2)} ms`);
    console.log(`Min Response Time: ${minResponseTime} ms`);
    console.log(`Max Response Time: ${maxResponseTime} ms`);
}

const userCount = 50;
const seconds = 10;
const loopCount = 1;

runLoadTest(userCount, seconds, loopCount);