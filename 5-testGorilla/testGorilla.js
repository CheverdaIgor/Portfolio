// Adding a link to the Tesseract.js library
var script = document.createElement('script');
script.src = 'https://cdn.jsdelivr.net/npm/tesseract.js';
document.head.appendChild(script);

// Adding a delay of 1 second
await new Promise(resolve => setTimeout(resolve, 1000));

// Selecting all elements with classes "ql-editor" and "imagep"
const elements = document.querySelectorAll('[class="ql-editor"], [class="imagep"]');

// Function to recognize text from an image using Tesseract.js
async function recognizeImage(imageSrc) {
    const image = new Image();
    image.src = imageSrc;

    return new Promise((resolve, reject) => {
        image.onload = async () => {
            try {
                const { data: { text } } = await Tesseract.recognize(image);
                resolve(text);
            } catch (error) {
                reject(error);
            }
        };
    });
}

if (elements.length > 0) {
    // Filter out elements that are images
    const imageElements = Array.from(elements).filter(element => element.classList.contains('imagep'));
    
    // Process each image element
    for (const imageElement of imageElements) {
        const img = imageElement.querySelector('img');
        if (img) {
            try {
                const imageText = await recognizeImage(img.src);
                console.log(imageText);
            } catch (error) {
                console.error('Error recognizing text from image:', error);
            }
        }
    }

    // Adding a delay of 1 second
    await new Promise(resolve => setTimeout(resolve, 1000));

    // Process each text editor element
    for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        if (element.classList.contains('ql-editor')) {
            const textContent = element.textContent.trim();
            if (i === 0) {
                console.log(`Question: ${textContent}`);
            } else {
                console.log(`Answer: ${textContent}`);
            }
        }
    }
} else {
    console.log('Elements not found');
}