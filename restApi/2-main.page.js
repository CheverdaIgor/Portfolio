const Page = require('./1-page');
const API = require('./00-getPostResponse');
const DataSchema = require('./00-jsonSchema');

class MainPage extends Page {
  
  async requestGetPost() {
    const getApiUrl = 'https://petstore.swagger.io/v2/pet/findByStatus?status=sold';
    const postApiUrl = 'https://petstore.swagger.io/v2/store/order';
    await API.requestGetPost('', getApiUrl);
    await browser.pause(1000);
    await API.requestGetPost('', postApiUrl, 'postData');
    await browser.pause(1000);
    await DataSchema.jsonSchemaFromFile('postResponse', 'postResponseSchema');
    await browser.pause(1000);
    await DataSchema.validateFileDataSchema('postData', 'postResponseSchema');
    await browser.pause(1000);
    await DataSchema.validateFileDataSchema('postData', 'postDataSchema');
  }
  
  open() {
    return super.open('');
  }
}

module.exports = new MainPage();