import { createServer } from 'http';

const hostName = '12.0.0.1'
const port = 3000;
const server = createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.write('Hello World!');
    res.end();
})

//localhost:3000
server.listen(port, hostName, () => {
    console.log(`Server running at http://${hostName}:${port}/`);
});