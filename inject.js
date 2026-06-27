const fs = require('fs');
const path = require('path');

const dir = __dirname;
const files = fs.readdirSync(dir);

const scriptTag = '\n<script src="design-export.js"></script>\n</head>';

let count = 0;
files.forEach(file => {
    if (file.endsWith('.html') && file !== 'design-export.js') {
        let content = fs.readFileSync(path.join(dir, file), 'utf8');
        // Prevent double injection
        if (!content.includes('design-export.js')) {
            // Replace first occurrence of </head> with the script tag + </head>
            content = content.replace('</head>', scriptTag);
            fs.writeFileSync(path.join(dir, file), content, 'utf8');
            count++;
        }
    }
});

console.log(`Injected design-export.js into ${count} HTML files.`);
